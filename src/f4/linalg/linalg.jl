# This file is a part of Groebner.jl. License is GNU GPL v2.

# The main entry point for linear algebra. 
# The functions in this file are "safe", in a sense that they try to ensure that
# the arguments are in a valid state, and handle printing and statistics. Use
# the functions from this file, and do not call the backends directly.

@noinline __throw_linalg_error(msg) = throw(DomainError("Linear algebra error: $msg"))

###
# Linear algebra, main entry points

"""
    linalg_main!

Given a `MacaulayMatrix` of the form

    | A B |
    | C D |

linearly reduces the `CD` part with respect to the known pivots from the `AB`
part, and interreduces (or, autoreduces) the result inplace.

In other words, computes the reduced row echelon form of

    D - C inv(A) B.

Returns `true` if successful and `false` otherwise.
"""
@timeit function linalg_main!(
    matrix::MacaulayMatrix,
    basis::Basis,
    params::AlgorithmParameters,
    trace=nothing;
    linalg=nothing
)
    @invariant matrix_well_formed(matrix)

    @stat matrix_block_sizes = matrix_block_sizes(matrix)
    @stat matrix_nnz = sum(i -> length(matrix.upper_rows[i]), 1:length(matrix.upper_rows))

    rng = params.rng
    arithmetic = params.arithmetic
    if isnothing(linalg)
        linalg = params.linalg
    end

    # Decide if multi-threading should be used. Further in dispatch, the backend
    # may opt to NOT use multi-threading regardless of this setting.
    threaded = if params.threaded_f4 === :yes && nthreads() > 1
        # NOTE: use multi-threading if explicitly requested
        :yes
    elseif params.threaded_multimodular === :yes &&
           linalg.algorithm === :learn &&
           nthreads() > 1
        # TODO: we do not use threading at the learn stage, but we could. One of
        # the obstactles here are frequent allocations and GC.
        :no
    elseif params.threaded_f4 === :auto && nthreads() > 1
        # try to use multi-threading by default whenever possible
        # :yes
        :no
    else
        :no
    end

    flag = if !isnothing(trace)
        _linalg_main_with_trace!(trace, matrix, basis, linalg, threaded, arithmetic, rng)
    else
        _linalg_main!(matrix, basis, linalg, threaded, arithmetic, rng)
    end

    flag
end

"""
    linalg_autoreduce!

Interreduces the rows of the given `MacaulayMatrix`.

Returns `true` if successful and `false` otherwise.
"""
function linalg_autoreduce!(
    matrix::MacaulayMatrix,
    basis::Basis,
    params::AlgorithmParameters,
    trace=nothing;
    linalg=nothing
)
    @invariant matrix_well_formed(matrix)

    arithmetic = params.arithmetic
    if isnothing(linalg)
        linalg = params.linalg
    end

    flag = if !isnothing(trace)
        _linalg_autoreduce_with_trace!(trace, matrix, basis, linalg, arithmetic)
    else
        _linalg_autoreduce!(matrix, basis, linalg, arithmetic)
    end

    flag
end

"""
    linalg_normalform!

Given a `MacaulayMatrix` of the form

    | A B |
    | C D |

linearly reduces the `CD` part with respect to the pivots in the `AB` part.

In contrast to `linalg_main!`, this function does not perform the final
interreduction (or, autoreduction) of the matrix rows.

Returns `true` if successful and `false` otherwise.
"""
function linalg_normalform!(
    matrix::MacaulayMatrix,
    basis::Basis,
    arithmetic::AbstractArithmetic
)
    @invariant matrix_well_formed(matrix)
    _linalg_normalform!(matrix, basis, arithmetic)
end

"""
    linalg_isgroebner!

Given a `MacaulayMatrix` of the form

    | A B |
    | C D |

returns `true` if

    D - C inv(A) B

is zero and `false`, otherwise.
"""
function linalg_isgroebner!(
    matrix::MacaulayMatrix,
    basis::Basis,
    arithmetic::AbstractArithmetic
)
    @invariant matrix_well_formed(matrix)
    _linalg_isgroebner!(matrix, basis, arithmetic)
end

###
# Further dispatch between linear algebra backends

function linalg_should_use_threading(matrix, linalg, threaded)
    @assert threaded !== :auto
    nup, nlow, nleft, nright = matrix_block_sizes(matrix)
    if threaded === :yes
        # Opt for single thread for small matrices
        if nlow < 2 * nthreads()
            false
        elseif nleft + nright < 1_000
            false
        else
            true
        end
    else
        false
    end
end

function _linalg_main!(
    matrix::MacaulayMatrix,
    basis::Basis,
    linalg::LinearAlgebra,
    threaded::Symbol,
    arithmetic::AbstractArithmetic,
    rng::AbstractRNG
)
    flag = if linalg.algorithm === :deterministic
        if linalg_should_use_threading(matrix, linalg, threaded)
            linalg_deterministic_sparse_threaded!(matrix, basis, linalg, arithmetic)
        else
            linalg_deterministic_sparse!(matrix, basis, linalg, arithmetic)
        end
    elseif linalg.algorithm === :randomized
        if linalg_should_use_threading(matrix, linalg, threaded)
            linalg_randomized_sparse_threaded!(matrix, basis, linalg, arithmetic, rng)
        else
            linalg_randomized_sparse!(matrix, basis, linalg, arithmetic, rng)
        end
    elseif linalg.algorithm === :experimental_1
        if linalg.sparsity === :sparse
            linalg_direct_rref_sparse!(matrix, basis, linalg, arithmetic)
        else
            linalg_direct_rref_sparsedense!(matrix, basis, linalg, arithmetic)
        end
    elseif linalg.algorithm === :experimental_2
        linalg_randomized_hashcolumns_sparse!(matrix, basis, linalg, arithmetic, rng)
    else
        __throw_linalg_error("Cannot pick a suitable linear algebra backend for parameters
                             linalg     = $linalg
                             threaded   = $threaded
                             arithmetic = $arithmetic")
    end

    flag
end

function _linalg_main_with_trace!(
    trace::TraceF4,
    matrix::MacaulayMatrix,
    basis::Basis,
    linalg::LinearAlgebra,
    threaded::Symbol,
    arithmetic::AbstractArithmetic,
    rng::AbstractRNG
)
    flag = if linalg.algorithm === :learn
        # At the moment, this never opts for multi-threading
        if false && threaded === :yes
            linalg_learn_sparse_threaded!(trace, matrix, basis, arithmetic)
        else
            linalg_learn_sparse!(trace, matrix, basis, arithmetic)
        end
    else
        @assert linalg.algorithm === :apply
        linalg_apply_sparse!(trace, matrix, basis, arithmetic)
    end

    flag
end

function _linalg_autoreduce!(
    matrix::MacaulayMatrix,
    basis::Basis,
    linalg::LinearAlgebra,
    arithmetic::AbstractArithmetic
)
    sort_matrix_upper_rows!(matrix)
    linalg_deterministic_sparse_interreduction!(matrix, basis, arithmetic)
    true
end

function _linalg_autoreduce_with_trace!(
    trace::TraceF4,
    matrix::MacaulayMatrix,
    basis::Basis,
    linalg::LinearAlgebra,
    arithmetic::AbstractArithmetic
)
    sort_matrix_upper_rows!(matrix)

    if linalg.algorithm === :learn
        linalg_learn_deterministic_sparse_interreduction!(trace, matrix, basis, arithmetic)
    else
        @assert linalg.algorithm === :apply
        linalg_apply_deterministic_sparse_interreduction!(trace, matrix, basis, arithmetic)
    end

    true
end

function _linalg_normalform!(
    matrix::MacaulayMatrix,
    basis::Basis,
    arithmetic::AbstractArithmetic
)
    sort_matrix_upper_rows!(matrix)
    @log level = -3 "linalg_normalform!"
    @log level = -3 matrix_string_repr(matrix)

    linalg_reduce_matrix_lower_part_invariant_pivots!(matrix, basis, arithmetic)
end

function _linalg_isgroebner!(
    matrix::MacaulayMatrix,
    basis::Basis,
    arithmetic::AbstractArithmetic
)
    sort_matrix_upper_rows!(matrix)
    sort_matrix_lower_rows!(matrix)
    @log level = -3 "linalg_isgroebner!"
    @log level = -3 matrix_string_repr(matrix)

    linalg_reduce_matrix_lower_part_any_nonzero!(matrix, basis, arithmetic)
end
