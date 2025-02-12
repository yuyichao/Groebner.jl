# This file is a part of Groebner.jl. License is GNU GPL v2.

# Parts of this file were adapted from msolve
#   https://github.com/algebraic-solving/msolve
# msolve is distributed under GNU GPL v2+
#   https://github.com/algebraic-solving/msolve/blob/master/COPYING

### 
# Monomial hashtable.

# This hashtable implementation assumes that the hash function is linear.

# The hashtable size is always the power of two. The hashtable size is doubled
# each time the load factor exceeds a threshold, which can be a bit smaller than
# 0.5, since the number of hits greatly exceeds the number of misses usually.

# Some monomial implementations are mutable, and some are not. In order to
# maintain generic code that will work for both, we usually write something
# like: m3 = monom_product!(m3, m1, m2). Then, if a mutable implementation is
#   used, m3 would be overwritten inside of monom_product!. Otherwise,
# monom_product! would return a new immutable object that is then assigned to
# m3. That allows us to write more or less independently of the monomial
# implementation.

# Hash of a monomial in the hashtable
const MonomHash = UInt32

# The idenfifier of a monomial. This idenfifier is guaranteed to be unique
# within a particular hashtable. This allows one to use this idenfifier when
# working with monomials
const MonomId = Int32

# Division mask of a monomial
const DivisionMask = UInt32

# Hashvalue of a single monomial
struct Hashvalue
    # index of the monomial in the F4 matrix (defaults to NON_PIVOT_COLUMN, or 0),
    idx::Int32
    # hash of the monomial,
    hash::MonomHash
    # corresponding divmask to speed up divisibility checks,
    divmask::DivisionMask
    # total degree of the monomial
    deg::MonomHash
end

# Hashtable implements open addressing with linear scan.
mutable struct MonomialHashtable{M <: Monom, Ord <: AbstractInternalOrdering}
    #= Data =#
    monoms::Vector{M}
    # Maps monomial id to its position in the `monoms` array
    hashtable::Vector{MonomId}
    # Stores hashes, division masks, and other valuable info for each hashtable
    # enrty
    hashdata::Vector{Hashvalue}
    # Hash vector. Hash of a monomial is a dot product of the `hasher` vector
    # and the monomial exponent vector
    hasher::Vector{MonomHash}

    #= Ring information =#
    # number of variables
    nvars::Int
    # ring monomial ordering
    ord::Ord

    #= Monom divisibility =#
    use_divmask::Bool
    compress_divmask::Bool
    # Divisor map to check divisibility faster
    divmap::Vector{UInt32}
    ndivvars::Int
    # Number of bits per div variable
    ndivbits::Int

    # Hashtable size 
    # (always a power of two)
    # (always greater than 1)
    size::Int
    # Elements currently added
    load::Int
    offset::Int

    # If the hashtable is frozen, any operation that tries to modify it will
    # result in an error.
    frozen::Bool
end

###
# Initialization and resizing

# Resize hashtable if load factor exceeds hashtable_resize_threshold. Load factor of a
# hashtable must be smaller than hashtable_resize_threshold at any point of its
# lifetime
hashtable_resize_threshold() = 0.4
hashtable_needs_resize(size, load, added) =
    (load + added) / size > hashtable_resize_threshold()

function hashtable_initialize(
    ring::PolyRing{Ord},
    rng::AbstractRNG,
    MonomT::T,
    initial_size::Int
) where {Ord <: AbstractInternalOrdering, T}
    exponents = Vector{MonomT}(undef, initial_size)
    hashdata = Vector{Hashvalue}(undef, initial_size)
    hashtable = zeros(MonomId, initial_size)

    nvars = ring.nvars
    ord = ring.ord

    # initialize hashing vector
    hasher = monom_construct_hash_vector(MonomT, nvars)

    # exponents[1:load] covers all stored exponents
    # , also exponents[1] is [0, 0, ..., 0] by default
    load = 1
    @invariant initial_size > 1
    size = initial_size

    # exponents array starts from index offset,
    # We store buffer array at index 1
    offset = 2

    # Initialize fast divisibility parameters.
    use_divmask = nvars <= 32 || (MonomT <: ExponentVector)
    # use_divmask = true
    dmbits = 8 * sizeof(DivisionMask)
    compress_divmask = nvars > dmbits
    @log level = -5 "Using division masks: $use_divmask. Using $dmbits bits. Compressed: $compress_divmask"
    ndivbits = div(dmbits, nvars)
    # division mask stores at least 1 bit
    # per each of first ndivvars variables
    ndivbits == 0 && (ndivbits += 1)
    # count only first ndivvars variables for divisibility checks
    ndivvars = min(nvars, dmbits)
    divmap = zeros(DivisionMask, ndivvars * ndivbits)

    # first stored exponent used as buffer lately
    exponents[1] = monom_construct_const_monom(MonomT, nvars)

    MonomialHashtable(
        exponents,
        hashtable,
        hashdata,
        hasher,
        nvars,
        ord,
        use_divmask,
        compress_divmask,
        divmap,
        ndivvars,
        ndivbits,
        size,
        load,
        offset,
        false
    )
end

# TODO: this function is incorrect, and is not used at the moment
function hashtable_deep_copy(ht::MonomialHashtable)
    exps = Vector{M}(undef, ht.size)
    table = Vector{MonomId}(undef, ht.size)
    data = Vector{Hashvalue}(undef, ht.size)
    exps[1] = monom_construct_const_monom(M, ht.nvars)

    @inbounds for i in 2:(ht.load)
        exps[i] = monom_copy(ht.monoms[i])
        table[i] = ht.hashtable[i]
        data[i] = ht.hashdata[i]
    end

    MonomialHashtable(
        ht.monoms,
        ht.hashtable,
        ht.hashdata,
        ht.hasher,
        ht.nvars,
        ht.ord,
        ht.use_divmask,
        ht.compress_divmask,
        ht.divmap,
        ht.ndivvars,
        ht.ndivbits,
        ht.size,
        ht.load,
        ht.offset,
        ht.frozen
    )
end

@timeit function hashtable_initialize_secondary(ht::MonomialHashtable{M}) where {M <: Monom}
    # 2^6 seems to be the best out of 2^5, 2^6, 2^7
    initial_size = 2^6
    @invariant initial_size > 1

    exponents = Vector{M}(undef, initial_size)
    hashdata = Vector{Hashvalue}(undef, initial_size)
    hashtable = zeros(MonomId, initial_size)

    # preserve ring info
    nvars = ht.nvars
    ord = ht.ord

    # preserve division info
    divmap = ht.divmap
    ndivbits = ht.ndivbits
    ndivvars = ht.ndivvars

    # preserve hasher
    hasher = ht.hasher

    load = 1
    size = initial_size
    offset = 2

    exponents[1] = monom_construct_const_monom(M, nvars)

    MonomialHashtable(
        exponents,
        hashtable,
        hashdata,
        hasher,
        nvars,
        ord,
        ht.use_divmask,
        ht.compress_divmask,
        divmap,
        ndivvars,
        ndivbits,
        size,
        load,
        offset,
        false
    )
end

function hashtable_reinitialize!(ht::MonomialHashtable{M}) where {M}
    @invariant !ht.frozen

    initial_size = 2^6
    @invariant initial_size > 1

    # Reinitialize counters
    ht.load = 1
    ht.offset = 2
    ht.size = initial_size

    # NOTE: Preserve division info, hasher, and polynomial ring info

    resize!(ht.monoms, ht.size)
    resize!(ht.hashdata, ht.size)
    resize!(ht.hashtable, ht.size)
    hashtable = ht.hashtable
    @inbounds for i in 1:(ht.size)
        hashtable[i] = zero(MonomId)
    end

    ht.monoms[1] = monom_construct_const_monom(M, ht.nvars)

    nothing
end

function hashtable_select_initial_size(ring::PolyRing, monoms::AbstractVector)
    nvars = ring.nvars
    sz = length(monoms)

    tablesize = 2^10
    if nvars > 4
        tablesize = 2^14
    end
    if nvars > 7
        tablesize = 2^16
    end

    if sz < 3
        tablesize = div(tablesize, 2)
    end
    if sz < 2
        tablesize = div(tablesize, 2)
    end

    tablesize
end

function hashtable_resize_if_needed!(ht::MonomialHashtable, added::Int)
    newsize = ht.size
    while hashtable_needs_resize(newsize, ht.load, added)
        newsize *= 2
    end
    newsize == ht.size && return nothing

    @invariant !ht.frozen
    ht.size = newsize
    @invariant ispow2(ht.size)

    resize!(ht.hashdata, ht.size)
    resize!(ht.monoms, ht.size)
    resize!(ht.hashtable, ht.size)
    @inbounds for i in 1:(ht.size)
        ht.hashtable[i] = zero(MonomId)
    end

    mod = MonomHash(ht.size - 1)

    @inbounds for i in (ht.offset):(ht.load)
        # hash for this elem is already computed
        he = ht.hashdata[i].hash
        hidx = he
        for j in MonomHash(0):MonomHash(ht.size)
            hidx = hashtable_next_lookup_index(he, j, mod)
            !iszero(ht.hashtable[hidx]) && continue
            ht.hashtable[hidx] = i
            break
        end
    end
    nothing
end

###
# Insertion of monomials

# Returns the next look-up position in the table.
# Must be within 1 <= ... <= mod+1
function hashtable_next_lookup_index(h::MonomHash, j::MonomHash, mod::MonomHash)
    ((h + j) & mod) + MonomHash(1)
end

# if hash collision happened
function hashtable_is_hash_collision(ht::MonomialHashtable, vidx, e, he)
    # if not free and not same hash
    @inbounds if ht.hashdata[vidx].hash != he
        return true
    end
    # if not free and not same monomial
    @inbounds if !monom_is_equal(ht.monoms[vidx], e)
        return true
    end
    false
end

function hashtable_insert!(ht::MonomialHashtable{M}, e::M) where {M <: Monom}
    # NOTE: trying to optimize for the case when the monomial is already in the
    # table.
    # NOTE: all of the functions called here are inlined. The only potential
    # exception is monom_create_divmask
    @invariant ispow2(ht.size) && ht.size > 1

    # generate hash
    he = monom_hash(e, ht.hasher)

    hsize = ht.size
    mod = (hsize - 1) % MonomHash
    hidx = hashtable_next_lookup_index(he, 0 % MonomHash, mod)
    @inbounds vidx = ht.hashtable[hidx]

    hit = !iszero(vidx)
    @inbounds if hit && !hashtable_is_hash_collision(ht, vidx, e, he)
        # Hit!
        return vidx
    end

    # Miss or collision
    i = 1 % MonomHash
    mhhsize = hsize % MonomHash
    @inbounds while hit && i < mhhsize
        hidx = hashtable_next_lookup_index(he, i, mod)
        vidx = ht.hashtable[hidx]

        iszero(vidx) && break

        if hashtable_is_hash_collision(ht, vidx, e, he)
            i += (1 % MonomHash)
            continue
        end

        # already present in hashtable
        return vidx
    end

    @invariant !ht.frozen

    # add monomial to hashtable
    vidx = (ht.load + 1) % MonomId
    @inbounds ht.hashtable[hidx] = vidx
    @inbounds ht.monoms[vidx] = monom_copy(e)
    divmask = monom_create_divmask(
        e,
        DivisionMask,
        ht.ndivvars,
        ht.divmap,
        ht.ndivbits,
        ht.compress_divmask
    )
    @inbounds ht.hashdata[vidx] = Hashvalue(0, he, divmask, monom_totaldeg(e))

    ht.load += 1

    return vidx
end

###
# Division masks

function divmask_is_probably_divisible(d1::DivisionMask, d2::DivisionMask)
    iszero(~d1 & d2)
end

# Having `ht` filled with monomials from input polys,
# computes ht.divmap and divmask for each of already stored monomials
function hashtable_fill_divmasks!(ht::MonomialHashtable)
    @invariant !ht.frozen

    ndivvars = ht.ndivvars

    min_exp = Vector{UInt64}(undef, ndivvars)
    max_exp = Vector{UInt64}(undef, ndivvars)

    e = Vector{UInt64}(undef, ht.nvars)
    monom_to_vector!(e, ht.monoms[ht.offset])

    @inbounds for i in 1:ndivvars
        min_exp[i] = e[i]
        max_exp[i] = e[i]
    end

    @inbounds for i in (ht.offset):(ht.load)
        monom_to_vector!(e, ht.monoms[i])
        for j in 1:ndivvars
            if e[j] > max_exp[j]
                max_exp[j] = e[j]
                continue
            end
            if e[j] < min_exp[j]
                min_exp[j] = e[j]
            end
        end
    end

    if !ht.compress_divmask
        # Available bits >= variables
        ctr = 1
        steps = UInt32(0)
        @inbounds for i in 1:ndivvars
            steps = div(max_exp[i] - min_exp[i], UInt32(ht.ndivbits))
            (iszero(steps)) && (steps += UInt32(1))
            for j in 1:(ht.ndivbits)
                ht.divmap[ctr] = steps
                steps += UInt32(1)
                ctr += 1
            end
        end
    else
        # Available bits < variables.
        # Pack variables tighlty.
        vars_per_bit = div(ht.nvars, 8 * sizeof(DivisionMask))
        vars_covered = vars_per_bit * 8 * sizeof(DivisionMask)
        if vars_covered != ht.nvars
            @invariant vars_covered < ht.nvars
            vars_per_bit += 1
        end
        @invariant vars_per_bit > 1
        @invariant ht.ndivbits == 1
        @invariant ndivvars == length(ht.divmap)
        ctr = 1
        @inbounds for i in 1:ndivvars
            if ht.nvars - ctr + 1 <= (ndivvars - i + 1) * (vars_per_bit - 1)
                vars_per_bit -= 1
            end
            ht.divmap[i] = vars_per_bit
            ctr += vars_per_bit
        end
        @invariant sum(ht.divmap) == ht.nvars
    end

    @inbounds for vidx in (ht.offset):(ht.load)
        unmasked = ht.hashdata[vidx]
        e = ht.monoms[vidx]
        divmask = monom_create_divmask(
            e,
            DivisionMask,
            ht.ndivvars,
            ht.divmap,
            ht.ndivbits,
            ht.compress_divmask
        )
        ht.hashdata[vidx] = Hashvalue(0, unmasked.hash, divmask, monom_totaldeg(e))
    end

    nothing
end

###
# Monomial arithmetic

# h1 divisible by h2
function hashtable_monom_is_divisible(h1::MonomId, h2::MonomId, ht::MonomialHashtable)
    @inbounds if ht.use_divmask
        if !divmask_is_probably_divisible(ht.hashdata[h1].divmask, ht.hashdata[h2].divmask)
            return false
        end
    end
    @inbounds e1 = ht.monoms[h1]
    @inbounds e2 = ht.monoms[h2]
    monom_is_divisible(e1, e2)
end

# checks that gcd(g1, h2) is one
function hashtable_monom_is_gcd_const(h1::MonomId, h2::MonomId, ht::MonomialHashtable)
    @inbounds e1 = ht.monoms[h1]
    @inbounds e2 = ht.monoms[h2]
    monom_is_gcd_const(e1, e2)
end

function hashtable_get_lcm!(
    he1::MonomId,
    he2::MonomId,
    ht1::MonomialHashtable{M},
    ht2::MonomialHashtable{M}
) where {M}
    @inbounds e1 = ht1.monoms[he1]
    @inbounds e2 = ht1.monoms[he2]
    @inbounds etmp = ht1.monoms[1]

    etmp = monom_lcm!(etmp, e1, e2)

    hashtable_insert!(ht2, etmp)
end

###
# What are those once again?..

# compare pairwise divisibility of lcms from a[first:last] with lcm
function hashtable_check_monomial_division_in_update(
    a::Vector{MonomId},
    first::Int,
    last::Int,
    lcm::MonomId,
    ht::MonomialHashtable{M}
) where {M <: Monom}

    # pairs are sorted, we only need to check entries above starting point

    @inbounds divmask = ht.hashdata[lcm].divmask
    @inbounds lcmexp = ht.monoms[lcm]

    j = first
    @inbounds while j <= last
        # bad lcm
        if iszero(a[j])
            j += 1
            continue
        end
        # fast division check
        if ht.use_divmask &&
           !divmask_is_probably_divisible(ht.hashdata[a[j]].divmask, divmask)
            j += 1
            continue
        end
        ea = ht.monoms[a[j]]
        if !monom_is_divisible(ea, lcmexp)
            j += 1
            continue
        end
        # mark as redundant
        a[j] = 0
    end

    nothing
end

function hashtable_insert_polynomial_multiple!(
    row::Vector{MonomId},
    multhash::MonomHash,
    mult::M,
    poly::Vector{MonomId},
    ht::MonomialHashtable{M},
    symbol_ht::MonomialHashtable{M}
) where {M <: Monom}
    # We iterate over monomials of the given polynomial one by one, multiply
    # them by a monomial multiple, and insert them into symbolic hashtable. 
    # We use the fact that the hash function is linear.
    @invariant ispow2(ht.size) && ht.size > 1
    @invariant ispow2(symbol_ht.size) && symbol_ht.size > 1
    @invariant length(row) == length(poly)

    len = length(poly)
    iszero(len) && return row

    ssize = symbol_ht.size % MonomHash
    mod = (symbol_ht.size - 1) % MonomHash
    buf = symbol_ht.monoms[1]
    @inbounds for j in 1:len
        oldmonom = ht.monoms[poly[j]]
        newmonom = monom_product!(buf, mult, oldmonom)

        oldhash = ht.hashdata[poly[j]].hash
        newhash = multhash + oldhash

        hidx = hashtable_next_lookup_index(newhash, 0 % MonomHash, mod)
        @inbounds vidx = symbol_ht.hashtable[hidx]

        hit = !iszero(vidx)
        @inbounds if hit && !hashtable_is_hash_collision(symbol_ht, vidx, newmonom, newhash)
            # Hit, go to next monomial
            row[j] = vidx
            continue
        end

        # Miss or collision
        i = 1 % MonomHash
        while hit && i <= ssize
            hidx = hashtable_next_lookup_index(newhash, i, mod)
            vidx = symbol_ht.hashtable[hidx]

            # if index is free
            hit = !iszero(vidx)
            iszero(vidx) && break

            if hashtable_is_hash_collision(symbol_ht, vidx, newmonom, newhash)
                i += (1 % MonomHash)
                continue
            end

            # Hit, go to next monomial
            row[j] = vidx
            break
        end
        hit && continue
        # Miss!

        @invariant !symbol_ht.frozen

        # add multiplied monomial to hash table
        vidx = (symbol_ht.load + 1) % MonomId
        symbol_ht.monoms[vidx] = monom_copy(newmonom)
        symbol_ht.hashtable[hidx] = vidx

        divmask = monom_create_divmask(
            newmonom,
            DivisionMask,
            symbol_ht.ndivvars,
            symbol_ht.divmap,
            symbol_ht.ndivbits,
            symbol_ht.compress_divmask
        )
        symbol_ht.hashdata[vidx] = Hashvalue(0, newhash, divmask, monom_totaldeg(newmonom))

        row[j] = vidx
        symbol_ht.load += 1
    end

    row
end
