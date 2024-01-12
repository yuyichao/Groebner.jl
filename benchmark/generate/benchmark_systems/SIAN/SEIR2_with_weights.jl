#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function SEIR2_with_weights(; np=AbstractAlgebra, ordering=:degrevlex, k=np.QQ)
    R, (Cu_7,Cu_6,E_6,S_5,In_5,Cu_5,E_5,N_5,S_4,In_4,Cu_4,E_4,N_4,S_3,In_3,Cu_3,E_3,N_3,S_2,In_2,Cu_2,E_2,N_2,S_1,In_1,Cu_1,E_1,N_1,S_0,In_0,Cu_0,E_0,N_0,z_aux,b_0,nu_0,a_0) = np.PolynomialRing(k, [:Cu_7,:Cu_6,:E_6,:S_5,:In_5,:Cu_5,:E_5,:N_5,:S_4,:In_4,:Cu_4,:E_4,:N_4,:S_3,:In_3,:Cu_3,:E_3,:N_3,:S_2,:In_2,:Cu_2,:E_2,:N_2,:S_1,:In_1,:Cu_1,:E_1,:N_1,:S_0,:In_0,:Cu_0,:E_0,:N_0,:z_aux,:b_0,:nu_0,:a_0], ordering=ordering)
    sys = [
    		-N_0 + 99317849184429,
		N_1,
		-Cu_0 + 92341425057626,
		-E_0^2*nu_0 + Cu_1,
		-Cu_1 + 816239626663116873439018552,
		-E_1^2*nu_0 + Cu_2,
		-S_0^3*In_0^3*b_0 + E_0^2*N_0*nu_0 + E_1^2*N_0,
		-Cu_2 + k(3896231985308604102183504487849607775572818168649344768)//k(33105949728143),
		-E_2^2*nu_0 + Cu_3,
		-In_1^3*S_0^3*b_0 - S_1^3*In_0^3*b_0 + N_1*E_0^2*nu_0 + E_1^2*N_0*nu_0 + E_1^2*N_1 + E_2^2*N_0,
		S_0^3*In_0^3*b_0 + S_1^3*N_0,
		In_0^3*a_0^4 + In_1^3 - E_0^2*nu_0,
		-Cu_3 - k(25926973140751789284334198511860213414791031742281799325928283778494434168028599968)//k(1096003907402331575606228449),
		-E_3^2*nu_0 + Cu_4,
		-2*S_1^3*In_1^3*b_0 - In_2^3*S_0^3*b_0 - S_2^3*In_0^3*b_0 + 2*E_1^2*N_1*nu_0 + N_2*E_0^2*nu_0 + E_2^2*N_0*nu_0 + N_2*E_1^2 + 2*E_2^2*N_1 + E_3^2*N_0,
		In_1^3*S_0^3*b_0 + S_1^3*In_0^3*b_0 + S_1^3*N_1 + S_2^3*N_0,
		In_1^3*a_0^4 + In_2^3 - E_1^2*nu_0,
		N_2,
		-Cu_4 + k(194961878205639699061716060440220469376066685789510048928301603383383631345886149910051615993638416231658308608)//k(36284250260309884770765363571589102540207),
		-E_4^2*nu_0 + Cu_5,
		-3*In_2^3*S_1^3*b_0 - 3*S_2^3*In_1^3*b_0 - In_3^3*S_0^3*b_0 - S_3^3*In_0^3*b_0 + 3*N_2*E_1^2*nu_0 + 3*E_2^2*N_1*nu_0 + N_3*E_0^2*nu_0 + E_3^2*N_0*nu_0 + 3*E_2^2*N_2 + N_3*E_1^2 + 3*E_3^2*N_1 + E_4^2*N_0,
		2*S_1^3*In_1^3*b_0 + In_2^3*S_0^3*b_0 + S_2^3*In_0^3*b_0 + N_2*S_1^3 + 2*S_2^3*N_1 + S_3^3*N_0,
		In_2^3*a_0^4 + In_3^3 - E_2^2*nu_0,
		N_3,
		-Cu_5 - k(1724757484256166530202018870289226731020142373422450911297841286802882998215240241232275181877993636529006137760090340411444097985043319168)//k(1201224565041178606709655244006890804759467282376945601),
		-E_5^2*nu_0 + Cu_6,
		-6*S_2^3*In_2^3*b_0 - 4*In_3^3*S_1^3*b_0 - 4*S_3^3*In_1^3*b_0 - In_4^3*S_0^3*b_0 - S_4^3*In_0^3*b_0 + 6*E_2^2*N_2*nu_0 + 4*N_3*E_1^2*nu_0 + 4*E_3^2*N_1*nu_0 + N_4*E_0^2*nu_0 + E_4^2*N_0*nu_0 + 4*N_3*E_2^2 + 6*E_3^2*N_2 + N_4*E_1^2 + 4*E_4^2*N_1 + E_5^2*N_0,
		3*In_2^3*S_1^3*b_0 + 3*S_2^3*In_1^3*b_0 + In_3^3*S_0^3*b_0 + S_3^3*In_0^3*b_0 + 3*S_2^3*N_2 + N_3*S_1^3 + 3*S_3^3*N_1 + S_4^3*N_0,
		N_4,
		In_3^3*a_0^4 + In_4^3 - E_3^2*nu_0,
		-Cu_6 + k(17615668950307772097143988985658213666579460646154988726711480329842368859857565928962983312742234208729615238697758396790363912335405548669689465233777231698176764928)//k(39767680062463700316399818541063180967845372367512545234276649748943),
		-E_6^2*nu_0 + Cu_7,
		-10*In_3^3*S_2^3*b_0 - 10*S_3^3*In_2^3*b_0 - 5*In_4^3*S_1^3*b_0 - 5*S_4^3*In_1^3*b_0 - In_5^3*S_0^3*b_0 - S_5^3*In_0^3*b_0 + 10*N_3*E_2^2*nu_0 + 10*E_3^2*N_2*nu_0 + 5*N_4*E_1^2*nu_0 + 5*E_4^2*N_1*nu_0 + N_5*E_0^2*nu_0 + E_5^2*N_0*nu_0 + 10*E_3^2*N_3 + 5*N_4*E_2^2 + 10*E_4^2*N_2 + N_5*E_1^2 + 5*E_5^2*N_1 + E_6^2*N_0,
		N_5,
		In_4^3*a_0^4 + In_5^3 - E_4^2*nu_0,
		6*S_2^3*In_2^3*b_0 + 4*In_3^3*S_1^3*b_0 + 4*S_3^3*In_1^3*b_0 + In_4^3*S_0^3*b_0 + S_4^3*In_0^3*b_0 + 4*N_3*S_2^3 + 6*S_3^3*N_2 + N_4*S_1^3 + 4*S_4^3*N_1 + S_5^3*N_0,
		-N_1,
		-N_2,
		-N_3,
		-N_4,
		-N_5,
		-Cu_7 - k(204662678762472030603736098584933779252201691967408047305286120880007211029944356783015757710279902646184628972315646801313197457997697262104805069467407986537817476742431361330681756181724031488)//k(1316546816952797940748522395714005146844627316954712551183843043001272340051602849),
		N_0*z_aux - 1
    ]
end

