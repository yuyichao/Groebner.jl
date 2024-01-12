#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function SIRSForced(; np=AbstractAlgebra, ordering=:degrevlex, k=np.QQ)
    R, (i_7,i_6,x1_6,s_6,i_5,x2_5,r_5,x1_5,s_5,i_4,x2_4,r_4,x1_4,s_4,i_3,x2_3,r_3,x1_3,s_3,i_2,x2_2,r_2,x1_2,s_2,i_1,x2_1,r_1,x1_1,s_1,i_0,x2_0,r_0,x1_0,s_0,z_aux,mu_0,b0_0,b1_0,g_0,nu_0,M_0) = np.PolynomialRing(k, [:i_7,:i_6,:x1_6,:s_6,:i_5,:x2_5,:r_5,:x1_5,:s_5,:i_4,:x2_4,:r_4,:x1_4,:s_4,:i_3,:x2_3,:r_3,:x1_3,:s_3,:i_2,:x2_2,:r_2,:x1_2,:s_2,:i_1,:x2_1,:r_1,:x1_1,:s_1,:i_0,:x2_0,:r_0,:x1_0,:s_0,:z_aux,:mu_0,:b0_0,:b1_0,:g_0,:nu_0,:M_0], ordering=ordering)
    sys = [
    		-r_0 + 30943455233320260215,
		r_0*mu_0 + r_0*g_0 - i_0*nu_0 + r_1,
		-i_0 + 11593402756024789577,
		-i_0*x1_0*s_0*b0_0*b1_0 - i_0*s_0*b0_0 + i_0*mu_0 + i_0*nu_0 + i_1,
		-r_1 - 1129420814231631882488052187492914929123,
		r_1*mu_0 + r_1*g_0 - i_1*nu_0 + r_2,
		-i_1 + 649649110415580301856392485547519566807634991958277489337673932064478466613792032953444571437495,
		-s_1*i_0*x1_0*b0_0*b1_0 - x1_1*i_0*s_0*b0_0*b1_0 - i_1*x1_0*s_0*b0_0*b1_0 - s_1*i_0*b0_0 - i_1*s_0*b0_0 + i_1*mu_0 + i_1*nu_0 + i_2,
		i_0*x1_0*s_0*b0_0*b1_0 + i_0*s_0*b0_0 + s_0*mu_0 - r_0*g_0 + s_1 - mu_0,
		x2_0*M_0 + x1_1,
		-r_2 + 8666848623426149729208284873123767614162346930841616054608631130242706425361353838228270257262384774060318318640699,
		r_2*mu_0 + r_2*g_0 - i_2*nu_0 + r_3,
		-i_2 + 148484727389343337287474807239494461082782326459089840235085470212920536881285667447866647198996772889328636080707732171799599686539767030367378275937569175341288577255719,
		-2*x1_1*s_1*i_0*b0_0*b1_0 - 2*i_1*s_1*x1_0*b0_0*b1_0 - s_2*i_0*x1_0*b0_0*b1_0 - 2*i_1*x1_1*s_0*b0_0*b1_0 - x1_2*i_0*s_0*b0_0*b1_0 - i_2*x1_0*s_0*b0_0*b1_0 - 2*i_1*s_1*b0_0 - s_2*i_0*b0_0 - i_2*s_0*b0_0 + i_2*mu_0 + i_2*nu_0 + i_3,
		x2_1*M_0 + x1_2,
		s_1*i_0*x1_0*b0_0*b1_0 + x1_1*i_0*s_0*b0_0*b1_0 + i_1*x1_0*s_0*b0_0*b1_0 + s_1*i_0*b0_0 + i_1*s_0*b0_0 + s_1*mu_0 - r_1*g_0 + s_2,
		-x1_0*M_0 + x2_1,
		-i_3 - 4063179717572550080256100072445948965059587307487419248043760971762927677411503488538911212077232855112783095606773163262523860548162334004122745609748777905544300770305090671234047127097324361871364050152132187233794010679094201067710568901748008417,
		-6*i_1*x1_1*s_1*b0_0*b1_0 - 3*s_2*x1_1*i_0*b0_0*b1_0 - 3*x1_2*s_1*i_0*b0_0*b1_0 - 3*s_2*i_1*x1_0*b0_0*b1_0 - 3*i_2*s_1*x1_0*b0_0*b1_0 - s_3*i_0*x1_0*b0_0*b1_0 - 3*x1_2*i_1*s_0*b0_0*b1_0 - 3*i_2*x1_1*s_0*b0_0*b1_0 - x1_3*i_0*s_0*b0_0*b1_0 - i_3*x1_0*s_0*b0_0*b1_0 - 3*s_2*i_1*b0_0 - 3*i_2*s_1*b0_0 - s_3*i_0*b0_0 - i_3*s_0*b0_0 + i_3*mu_0 + i_3*nu_0 + i_4,
		x2_2*M_0 + x1_3,
		2*x1_1*s_1*i_0*b0_0*b1_0 + 2*i_1*s_1*x1_0*b0_0*b1_0 + s_2*i_0*x1_0*b0_0*b1_0 + 2*i_1*x1_1*s_0*b0_0*b1_0 + x1_2*i_0*s_0*b0_0*b1_0 + i_2*x1_0*s_0*b0_0*b1_0 + 2*i_1*s_1*b0_0 + s_2*i_0*b0_0 + i_2*s_0*b0_0 + s_2*mu_0 - r_2*g_0 + s_3,
		-x1_1*M_0 + x2_2,
		-i_4 - 3714767879875897099204013751439335523312060597450496113799872090370809465592664748252022302509378612765168587903413429373155691774997067999832274854587808850297131353069982730075856237837778517309841666501808731850090812306097315277545782195780895817065487446930774473098795226208233026424658463195272546879762821525859782157,
		-12*s_2*i_1*x1_1*b0_0*b1_0 - 12*x1_2*i_1*s_1*b0_0*b1_0 - 12*i_2*x1_1*s_1*b0_0*b1_0 - 6*x1_2*s_2*i_0*b0_0*b1_0 - 4*s_3*x1_1*i_0*b0_0*b1_0 - 4*x1_3*s_1*i_0*b0_0*b1_0 - 6*i_2*s_2*x1_0*b0_0*b1_0 - 4*s_3*i_1*x1_0*b0_0*b1_0 - 4*i_3*s_1*x1_0*b0_0*b1_0 - s_4*i_0*x1_0*b0_0*b1_0 - 6*i_2*x1_2*s_0*b0_0*b1_0 - 4*x1_3*i_1*s_0*b0_0*b1_0 - 4*i_3*x1_1*s_0*b0_0*b1_0 - x1_4*i_0*s_0*b0_0*b1_0 - i_4*x1_0*s_0*b0_0*b1_0 - 6*i_2*s_2*b0_0 - 4*s_3*i_1*b0_0 - 4*i_3*s_1*b0_0 - s_4*i_0*b0_0 - i_4*s_0*b0_0 + i_4*mu_0 + i_4*nu_0 + i_5,
		6*i_1*x1_1*s_1*b0_0*b1_0 + 3*s_2*x1_1*i_0*b0_0*b1_0 + 3*x1_2*s_1*i_0*b0_0*b1_0 + 3*s_2*i_1*x1_0*b0_0*b1_0 + 3*i_2*s_1*x1_0*b0_0*b1_0 + s_3*i_0*x1_0*b0_0*b1_0 + 3*x1_2*i_1*s_0*b0_0*b1_0 + 3*i_2*x1_1*s_0*b0_0*b1_0 + x1_3*i_0*s_0*b0_0*b1_0 + i_3*x1_0*s_0*b0_0*b1_0 + 3*s_2*i_1*b0_0 + 3*i_2*s_1*b0_0 + s_3*i_0*b0_0 + i_3*s_0*b0_0 + s_3*mu_0 - r_3*g_0 + s_4,
		x2_3*M_0 + x1_4,
		-x1_2*M_0 + x2_3,
		-i_5 + 101650726394263218624690069605503507798583289575362919949585701749318208735546831089152977185455040631149902799050066430807444251503470800301140828869823193551330025320876243109973435953191961544852880485842781257704828264799370523693570182157008223237124618545738431701579051090668606373294911600294693392321013859220571640264202498819805002811245905775420214287532591767765878381632448548326302141597303,
		-30*x1_2*s_2*i_1*b0_0*b1_0 - 30*i_2*s_2*x1_1*b0_0*b1_0 - 20*s_3*i_1*x1_1*b0_0*b1_0 - 30*i_2*x1_2*s_1*b0_0*b1_0 - 20*x1_3*i_1*s_1*b0_0*b1_0 - 20*i_3*x1_1*s_1*b0_0*b1_0 - 10*s_3*x1_2*i_0*b0_0*b1_0 - 10*x1_3*s_2*i_0*b0_0*b1_0 - 5*s_4*x1_1*i_0*b0_0*b1_0 - 5*x1_4*s_1*i_0*b0_0*b1_0 - 10*s_3*i_2*x1_0*b0_0*b1_0 - 10*i_3*s_2*x1_0*b0_0*b1_0 - 5*s_4*i_1*x1_0*b0_0*b1_0 - 5*i_4*s_1*x1_0*b0_0*b1_0 - s_5*i_0*x1_0*b0_0*b1_0 - 10*x1_3*i_2*s_0*b0_0*b1_0 - 10*i_3*x1_2*s_0*b0_0*b1_0 - 5*x1_4*i_1*s_0*b0_0*b1_0 - 5*i_4*x1_1*s_0*b0_0*b1_0 - x1_5*i_0*s_0*b0_0*b1_0 - i_5*x1_0*s_0*b0_0*b1_0 - 10*s_3*i_2*b0_0 - 10*i_3*s_2*b0_0 - 5*s_4*i_1*b0_0 - 5*i_4*s_1*b0_0 - s_5*i_0*b0_0 - i_5*s_0*b0_0 + i_5*mu_0 + i_5*nu_0 + i_6,
		12*s_2*i_1*x1_1*b0_0*b1_0 + 12*x1_2*i_1*s_1*b0_0*b1_0 + 12*i_2*x1_1*s_1*b0_0*b1_0 + 6*x1_2*s_2*i_0*b0_0*b1_0 + 4*s_3*x1_1*i_0*b0_0*b1_0 + 4*x1_3*s_1*i_0*b0_0*b1_0 + 6*i_2*s_2*x1_0*b0_0*b1_0 + 4*s_3*i_1*x1_0*b0_0*b1_0 + 4*i_3*s_1*x1_0*b0_0*b1_0 + s_4*i_0*x1_0*b0_0*b1_0 + 6*i_2*x1_2*s_0*b0_0*b1_0 + 4*x1_3*i_1*s_0*b0_0*b1_0 + 4*i_3*x1_1*s_0*b0_0*b1_0 + x1_4*i_0*s_0*b0_0*b1_0 + i_4*x1_0*s_0*b0_0*b1_0 + 6*i_2*s_2*b0_0 + 4*s_3*i_1*b0_0 + 4*i_3*s_1*b0_0 + s_4*i_0*b0_0 + i_4*s_0*b0_0 + s_4*mu_0 - r_4*g_0 + s_5,
		x2_4*M_0 + x1_5,
		r_3*mu_0 + r_3*g_0 - i_3*nu_0 + r_4,
		-x1_3*M_0 + x2_4,
		-i_6 + 197487472512470103836425602717362170239061401159229042788087661278985779310031134921424357598148100631448229642056713838529544305738297776342553276630811314772223490277302216951729322913988282100123595193546033399555195977391277838763136247414462599092289753850387815501517643898626582034242882518591025676991696459525994656256908332986088270190262191825097405385959756527707990027987628463658857399105296348924920827267276144775756707228346251191271473957233572389454845798551691,
		-90*i_2*x1_2*s_2*b0_0*b1_0 - 60*s_3*x1_2*i_1*b0_0*b1_0 - 60*x1_3*s_2*i_1*b0_0*b1_0 - 60*s_3*i_2*x1_1*b0_0*b1_0 - 60*i_3*s_2*x1_1*b0_0*b1_0 - 30*s_4*i_1*x1_1*b0_0*b1_0 - 60*x1_3*i_2*s_1*b0_0*b1_0 - 60*i_3*x1_2*s_1*b0_0*b1_0 - 30*x1_4*i_1*s_1*b0_0*b1_0 - 30*i_4*x1_1*s_1*b0_0*b1_0 - 20*x1_3*s_3*i_0*b0_0*b1_0 - 15*s_4*x1_2*i_0*b0_0*b1_0 - 15*x1_4*s_2*i_0*b0_0*b1_0 - 6*s_5*x1_1*i_0*b0_0*b1_0 - 6*x1_5*s_1*i_0*b0_0*b1_0 - 20*i_3*s_3*x1_0*b0_0*b1_0 - 15*s_4*i_2*x1_0*b0_0*b1_0 - 15*i_4*s_2*x1_0*b0_0*b1_0 - 6*s_5*i_1*x1_0*b0_0*b1_0 - 6*i_5*s_1*x1_0*b0_0*b1_0 - s_6*i_0*x1_0*b0_0*b1_0 - 20*i_3*x1_3*s_0*b0_0*b1_0 - 15*x1_4*i_2*s_0*b0_0*b1_0 - 15*i_4*x1_2*s_0*b0_0*b1_0 - 6*x1_5*i_1*s_0*b0_0*b1_0 - 6*i_5*x1_1*s_0*b0_0*b1_0 - x1_6*i_0*s_0*b0_0*b1_0 - i_6*x1_0*s_0*b0_0*b1_0 - 20*i_3*s_3*b0_0 - 15*s_4*i_2*b0_0 - 15*i_4*s_2*b0_0 - 6*s_5*i_1*b0_0 - 6*i_5*s_1*b0_0 - s_6*i_0*b0_0 - i_6*s_0*b0_0 + i_6*mu_0 + i_6*nu_0 + i_7,
		x2_5*M_0 + x1_6,
		30*x1_2*s_2*i_1*b0_0*b1_0 + 30*i_2*s_2*x1_1*b0_0*b1_0 + 20*s_3*i_1*x1_1*b0_0*b1_0 + 30*i_2*x1_2*s_1*b0_0*b1_0 + 20*x1_3*i_1*s_1*b0_0*b1_0 + 20*i_3*x1_1*s_1*b0_0*b1_0 + 10*s_3*x1_2*i_0*b0_0*b1_0 + 10*x1_3*s_2*i_0*b0_0*b1_0 + 5*s_4*x1_1*i_0*b0_0*b1_0 + 5*x1_4*s_1*i_0*b0_0*b1_0 + 10*s_3*i_2*x1_0*b0_0*b1_0 + 10*i_3*s_2*x1_0*b0_0*b1_0 + 5*s_4*i_1*x1_0*b0_0*b1_0 + 5*i_4*s_1*x1_0*b0_0*b1_0 + s_5*i_0*x1_0*b0_0*b1_0 + 10*x1_3*i_2*s_0*b0_0*b1_0 + 10*i_3*x1_2*s_0*b0_0*b1_0 + 5*x1_4*i_1*s_0*b0_0*b1_0 + 5*i_4*x1_1*s_0*b0_0*b1_0 + x1_5*i_0*s_0*b0_0*b1_0 + i_5*x1_0*s_0*b0_0*b1_0 + 10*s_3*i_2*b0_0 + 10*i_3*s_2*b0_0 + 5*s_4*i_1*b0_0 + 5*i_4*s_1*b0_0 + s_5*i_0*b0_0 + i_5*s_0*b0_0 + s_5*mu_0 - r_5*g_0 + s_6,
		r_4*mu_0 + r_4*g_0 - i_4*nu_0 + r_5,
		-x1_4*M_0 + x2_5,
		-r_3 + 1980907284473785189641170851198134337368982741823619588405608731926216870350412669575442101206773284360203896562802906556541334498291675365142027021409725292041657649615556406270442256005007,
		-r_4 - 54206129089362883930696454277950174803699911211031756728122505023587240263990878296277168899041750311147134033810176169041315862223918825617211145402687830597121270272023871749257356237747437355149132110621061824820532077000592920768644073270037585843663593053836666673,
		-r_5 - 49558031204652545346777626030940026240861025256105709116936592722961876336612681188563974341930049578859503133848937466546919317378009412551691180915015242198429611872901009432706778153109593527631414887869392477745218450143775744448359595250841885436802129444347180903573750228120479679079199207078168046492010964615738977479894070244433853173,
		-i_7 - 5403945924907994550941906725431287753605728232976187191643474632340040808342928482271869784243767245678418199877057153651688952409681638803110536322735023080147352670290502814007732541829419859682832321439268267505754163827926263207517099233233992747633832462106226712947314038282973572299338129190389700283410263645164312263525798744224912925578456655973884569046018064730817303962920576424143426049285429316591860346155102319156624144345979460323234598284413894856680667347218037584499091142947338270938505676309423889928812016641831450682510505219075832941,
		z_aux - 1
    ]
end

