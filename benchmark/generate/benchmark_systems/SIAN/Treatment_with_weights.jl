#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function Treatment_with_weights(; np=AbstractAlgebra, ordering=:degrevlex, k=np.QQ)
    R, (Tr_7,In_6,Tr_6,In_5,Tr_5,S_5,N_5,In_4,Tr_4,S_4,N_4,In_3,Tr_3,S_3,N_3,In_2,Tr_2,S_2,N_2,In_1,Tr_1,S_1,N_1,In_0,Tr_0,S_0,N_0,z_aux,b_0,d_0,a_0,g_0,nu_0) = np.PolynomialRing(k, [:Tr_7,:In_6,:Tr_6,:In_5,:Tr_5,:S_5,:N_5,:In_4,:Tr_4,:S_4,:N_4,:In_3,:Tr_3,:S_3,:N_3,:In_2,:Tr_2,:S_2,:N_2,:In_1,:Tr_1,:S_1,:N_1,:In_0,:Tr_0,:S_0,:N_0,:z_aux,:b_0,:d_0,:a_0,:g_0,:nu_0], ordering=ordering)
    sys = [
    		-Tr_0 + 48912847078777,
		-In_0^2*g_0 + Tr_0*nu_0 + Tr_1,
		-N_0 + 33197003141567,
		N_1,
		-Tr_1 + 667748921720740948803347665,
		-In_1^2*g_0 + Tr_1*nu_0 + Tr_2,
		-In_0^2*S_0^3*b_0 - Tr_0*S_0^3*b_0*d_0 + In_0^2*N_0*a_0 + In_0^2*N_0*g_0 + In_1^2*N_0,
		-Tr_2 + k(1302004934802039601345011160583523108201150031267201111934771092625)//k(33197003141567),
		-In_2^2*g_0 + Tr_2*nu_0 + Tr_3,
		-S_1^3*In_0^2*b_0 - In_1^2*S_0^3*b_0 - S_1^3*Tr_0*b_0*d_0 - Tr_1*S_0^3*b_0*d_0 + N_1*In_0^2*a_0 + In_1^2*N_0*a_0 + N_1*In_0^2*g_0 + In_1^2*N_0*g_0 + In_1^2*N_1 + In_2^2*N_0,
		In_0^2*S_0^3*b_0 + Tr_0*S_0^3*b_0*d_0 + S_1^3*N_0,
		-Tr_3 - k(46910137255420535247291100108009892566890745065218348233559595077960064967779581605799188632819048648578375)//k(1102041017581209267443215489),
		-In_3^2*g_0 + Tr_3*nu_0 + Tr_4,
		-2*In_1^2*S_1^3*b_0 - S_2^3*In_0^2*b_0 - In_2^2*S_0^3*b_0 - 2*Tr_1*S_1^3*b_0*d_0 - S_2^3*Tr_0*b_0*d_0 - Tr_2*S_0^3*b_0*d_0 + 2*In_1^2*N_1*a_0 + N_2*In_0^2*a_0 + In_2^2*N_0*a_0 + 2*In_1^2*N_1*g_0 + N_2*In_0^2*g_0 + In_2^2*N_0*g_0 + N_2*In_1^2 + 2*In_2^2*N_1 + In_3^2*N_0,
		N_2,
		S_1^3*In_0^2*b_0 + In_1^2*S_0^3*b_0 + S_1^3*Tr_0*b_0*d_0 + Tr_1*S_0^3*b_0*d_0 + S_1^3*N_1 + S_2^3*N_0,
		-Tr_4 + k(1690132593584790977795471367626034035142528579347822083538122989193366446421205809455377923808181291769620359173713642934989039956735780735060830625)//k(36584459122779097530859279282113154131263),
		-In_4^2*g_0 + Tr_4*nu_0 + Tr_5,
		-3*S_2^3*In_1^2*b_0 - 3*In_2^2*S_1^3*b_0 - S_3^3*In_0^2*b_0 - In_3^2*S_0^3*b_0 - 3*S_2^3*Tr_1*b_0*d_0 - 3*Tr_2*S_1^3*b_0*d_0 - S_3^3*Tr_0*b_0*d_0 - Tr_3*S_0^3*b_0*d_0 + 3*N_2*In_1^2*a_0 + 3*In_2^2*N_1*a_0 + N_3*In_0^2*a_0 + In_3^2*N_0*a_0 + 3*N_2*In_1^2*g_0 + 3*In_2^2*N_1*g_0 + N_3*In_0^2*g_0 + In_3^2*N_0*g_0 + 3*In_2^2*N_2 + N_3*In_1^2 + 3*In_3^2*N_1 + In_4^2*N_0,
		2*In_1^2*S_1^3*b_0 + S_2^3*In_0^2*b_0 + In_2^2*S_0^3*b_0 + 2*Tr_1*S_1^3*b_0*d_0 + S_2^3*Tr_0*b_0*d_0 + Tr_2*S_0^3*b_0*d_0 + N_2*S_1^3 + 2*S_2^3*N_1 + S_3^3*N_0,
		N_3,
		-Tr_5 - k(60894048728615432129759751945738489829168096447733413070313516781302052171579196270419446211520468590029644143595361372565940010331894701573148146803991555988475288208948249753114330584375)//k(1214494404431427193703696587057303814165913095689509121),
		-In_5^2*g_0 + Tr_5*nu_0 + Tr_6,
		-6*In_2^2*S_2^3*b_0 - 4*S_3^3*In_1^2*b_0 - 4*In_3^2*S_1^3*b_0 - S_4^3*In_0^2*b_0 - In_4^2*S_0^3*b_0 - 6*Tr_2*S_2^3*b_0*d_0 - 4*S_3^3*Tr_1*b_0*d_0 - 4*Tr_3*S_1^3*b_0*d_0 - S_4^3*Tr_0*b_0*d_0 - Tr_4*S_0^3*b_0*d_0 + 6*In_2^2*N_2*a_0 + 4*N_3*In_1^2*a_0 + 4*In_3^2*N_1*a_0 + N_4*In_0^2*a_0 + In_4^2*N_0*a_0 + 6*In_2^2*N_2*g_0 + 4*N_3*In_1^2*g_0 + 4*In_3^2*N_1*g_0 + N_4*In_0^2*g_0 + In_4^2*N_0*g_0 + 4*N_3*In_2^2 + 6*In_3^2*N_2 + N_4*In_1^2 + 4*In_4^2*N_1 + In_5^2*N_0,
		3*S_2^3*In_1^2*b_0 + 3*In_2^2*S_1^3*b_0 + S_3^3*In_0^2*b_0 + In_3^2*S_0^3*b_0 + 3*S_2^3*Tr_1*b_0*d_0 + 3*Tr_2*S_1^3*b_0*d_0 + S_3^3*Tr_0*b_0*d_0 + Tr_3*S_0^3*b_0*d_0 + 3*S_2^3*N_2 + N_3*S_1^3 + 3*S_3^3*N_1 + S_4^3*N_0,
		N_4,
		-Tr_6 + k(2193961103784203423658579061576851256755919782175902878873994438827795006810977008708736804370312689593750755537893825043075810738452784027723722111937168364555664931335821333022856667812389040829912857458539691234428963063640625)//k(40317574559325631195807050242682290630718588595369740575841100732607),
		-In_6^2*g_0 + Tr_6*nu_0 + Tr_7,
		-10*S_3^3*In_2^2*b_0 - 10*In_3^2*S_2^3*b_0 - 5*S_4^3*In_1^2*b_0 - 5*In_4^2*S_1^3*b_0 - S_5^3*In_0^2*b_0 - In_5^2*S_0^3*b_0 - 10*S_3^3*Tr_2*b_0*d_0 - 10*Tr_3*S_2^3*b_0*d_0 - 5*S_4^3*Tr_1*b_0*d_0 - 5*Tr_4*S_1^3*b_0*d_0 - S_5^3*Tr_0*b_0*d_0 - Tr_5*S_0^3*b_0*d_0 + 10*N_3*In_2^2*a_0 + 10*In_3^2*N_2*a_0 + 5*N_4*In_1^2*a_0 + 5*In_4^2*N_1*a_0 + N_5*In_0^2*a_0 + In_5^2*N_0*a_0 + 10*N_3*In_2^2*g_0 + 10*In_3^2*N_2*g_0 + 5*N_4*In_1^2*g_0 + 5*In_4^2*N_1*g_0 + N_5*In_0^2*g_0 + In_5^2*N_0*g_0 + 10*In_3^2*N_3 + 5*N_4*In_2^2 + 10*In_4^2*N_2 + N_5*In_1^2 + 5*In_5^2*N_1 + In_6^2*N_0,
		N_5,
		6*In_2^2*S_2^3*b_0 + 4*S_3^3*In_1^2*b_0 + 4*In_3^2*S_1^3*b_0 + S_4^3*In_0^2*b_0 + In_4^2*S_0^3*b_0 + 6*Tr_2*S_2^3*b_0*d_0 + 4*S_3^3*Tr_1*b_0*d_0 + 4*Tr_3*S_1^3*b_0*d_0 + S_4^3*Tr_0*b_0*d_0 + Tr_4*S_0^3*b_0*d_0 + 4*N_3*S_2^3 + 6*S_3^3*N_2 + N_4*S_1^3 + 4*S_4^3*N_1 + S_5^3*N_0,
		-Tr_7 - k(79046564080013251785909791912534753772331278238270726912831100488773221935422724157624043046675044095061937181469787825284772533491067367607266960710256969826196682614186212034851348202080662853990198348742968121758898004545466896772920325956844006420292584059462734375)//k(1338422649306294734424151865824291411820640715475193495686126812643753884233975169),
		-N_1,
		-N_2,
		-N_3,
		-N_4,
		-N_5,
		N_0*z_aux - 1
    ]
end

