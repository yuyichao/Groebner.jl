#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function HIV2_with_weights(; np=AbstractAlgebra, ordering=:degrevlex, k=np.QQ)
    R, (z_9,w_8,y_8,z_8,x_7,v_7,w_7,y_7,z_7,x_6,v_6,w_6,y_6,z_6,x_5,v_5,w_5,y_5,z_5,x_4,v_4,w_4,y_4,z_4,x_3,v_3,w_3,y_3,z_3,x_2,v_2,w_2,y_2,z_2,x_1,v_1,w_1,y_1,z_1,x_0,v_0,w_0,y_0,z_0,z_aux,lm_0,d_0,beta_0,a_0,k_0,u_0,c_0,q_0,b_0,h_0) = np.PolynomialRing(k, [:z_9,:w_8,:y_8,:z_8,:x_7,:v_7,:w_7,:y_7,:z_7,:x_6,:v_6,:w_6,:y_6,:z_6,:x_5,:v_5,:w_5,:y_5,:z_5,:x_4,:v_4,:w_4,:y_4,:z_4,:x_3,:v_3,:w_3,:y_3,:z_3,:x_2,:v_2,:w_2,:y_2,:z_2,:x_1,:v_1,:w_1,:y_1,:z_1,:x_0,:v_0,:w_0,:y_0,:z_0,:z_aux,:lm_0,:d_0,:beta_0,:a_0,:k_0,:u_0,:c_0,:q_0,:b_0,:h_0], ordering=ordering)
    sys = [
    		-z_0 + 7753100191911095627405452,
		-w_0*y_0^2*c_0*q_0 + z_0*h_0 + z_1,
		-w_0 + 2346330741999744538402447,
		-w_0*y_0^2*z_0*c_0 + w_0*y_0^2*c_0*q_0 + w_0*b_0 + w_1,
		-z_1 + 1140327906841529314426799950057267973660161927141055250832207196860832722045247568184114729276664,
		-y_1^2*w_0*c_0*q_0 - w_1*y_0^2*c_0*q_0 + z_1*h_0 + z_2,
		-x_0^3*v_0^3*beta_0 + y_0^2*a_0 + y_1^2,
		-w_1 + 29401364094538255091594232320157185097415450066543733190652638048409484762098487041744249277159044,
		-z_1*w_0*y_0^2*c_0 - y_1^2*w_0*z_0*c_0 - w_1*y_0^2*z_0*c_0 + y_1^2*w_0*c_0*q_0 + w_1*y_0^2*c_0*q_0 + w_1*b_0 + w_2,
		-z_2 + 14289202871559253762602909225818662701061614038911413090648559651702867967526373167314573814008996215604338867320574208898084726988301470218284598875853385591028635801928,
		-2*w_1*y_1^2*c_0*q_0 - y_2^2*w_0*c_0*q_0 - w_2*y_0^2*c_0*q_0 + z_2*h_0 + z_3,
		-v_1^3*x_0^3*beta_0 - x_1^3*v_0^3*beta_0 + y_1^2*a_0 + y_2^2,
		v_0^3*u_0^4 + v_1^3 - y_0^2*k_0,
		x_0^3*d_0^4 + x_0^3*v_0^3*beta_0 + x_1^3 - lm_0,
		-w_2 + 372914227125085481728047055470115838129793437864524722752962402183575834124260383183257810810495011600589140884126685134420092462148414234479657927750809572986964256300048,
		-2*y_1^2*z_1*w_0*c_0 - 2*w_1*z_1*y_0^2*c_0 - z_2*w_0*y_0^2*c_0 - 2*w_1*y_1^2*z_0*c_0 - y_2^2*w_0*z_0*c_0 - w_2*y_0^2*z_0*c_0 + 2*w_1*y_1^2*c_0*q_0 + y_2^2*w_0*c_0*q_0 + w_2*y_0^2*c_0*q_0 + w_2*b_0 + w_3,
		-z_3 + 181238089088218442101584791564059732196908435647932287771388290206360121604861828625295582087935908002380454258771008922288295237593430141541919456646949440165718850288032648276584819013230811517629262341663340161164368117056467345478427526976,
		-3*y_2^2*w_1*c_0*q_0 - 3*w_2*y_1^2*c_0*q_0 - y_3^2*w_0*c_0*q_0 - w_3*y_0^2*c_0*q_0 + z_3*h_0 + z_4,
		-2*x_1^3*v_1^3*beta_0 - v_2^3*x_0^3*beta_0 - x_2^3*v_0^3*beta_0 + y_2^2*a_0 + y_3^2,
		v_1^3*u_0^4 + v_2^3 - y_1^2*k_0,
		x_1^3*d_0^4 + v_1^3*x_0^3*beta_0 + x_1^3*v_0^3*beta_0 + x_2^3,
		-w_3 + 4841775532189492111817732700857918457516546160503986215925402781246242509830736730606682004877525782284324720425394302111557182406742026253580724311049372582286102115046697004168275938591269022977147629589563506741453098960640647731501889645936,
		-6*w_1*y_1^2*z_1*c_0 - 3*z_2*y_1^2*w_0*c_0 - 3*y_2^2*z_1*w_0*c_0 - 3*z_2*w_1*y_0^2*c_0 - 3*w_2*z_1*y_0^2*c_0 - z_3*w_0*y_0^2*c_0 - 3*y_2^2*w_1*z_0*c_0 - 3*w_2*y_1^2*z_0*c_0 - y_3^2*w_0*z_0*c_0 - w_3*y_0^2*z_0*c_0 + 3*y_2^2*w_1*c_0*q_0 + 3*w_2*y_1^2*c_0*q_0 + y_3^2*w_0*c_0*q_0 + w_3*y_0^2*c_0*q_0 + w_3*b_0 + w_4,
		-z_4 + 2353125950739802527208738166334699472967311681850690742540663846418840936960059135189417990276793595428888871241442575709273344064317004772204061354169932422163483041609282373344093488148172107897165713377492268373211960233468435286644945704769689221542038491428388749895605371530381028627827151209904730208836508912,
		-6*w_2*y_2^2*c_0*q_0 - 4*y_3^2*w_1*c_0*q_0 - 4*w_3*y_1^2*c_0*q_0 - y_4^2*w_0*c_0*q_0 - w_4*y_0^2*c_0*q_0 + z_4*h_0 + z_5,
		-3*v_2^3*x_1^3*beta_0 - 3*x_2^3*v_1^3*beta_0 - v_3^3*x_0^3*beta_0 - x_3^3*v_0^3*beta_0 + y_3^2*a_0 + y_4^2,
		x_2^3*d_0^4 + 2*x_1^3*v_1^3*beta_0 + v_2^3*x_0^3*beta_0 + x_2^3*v_0^3*beta_0 + x_3^3,
		v_2^3*u_0^4 + v_3^3 - y_2^2*k_0,
		-z_5 + 31902852437022403175298387341950965269162068594589892628286857106116646197033191830191363625099339171161219331552528226268915200382949070381900393707514356474610925743469637926924908394986024801842064308026467819052053834451764979721797640094416434510927553237454580341992936068895004481351988693743739357384432208997655893615920693482379916713366500481552177831676732500579208955160167784,
		-10*y_3^2*w_2*c_0*q_0 - 10*w_3*y_2^2*c_0*q_0 - 5*y_4^2*w_1*c_0*q_0 - 5*w_4*y_1^2*c_0*q_0 - y_5^2*w_0*c_0*q_0 - w_5*y_0^2*c_0*q_0 + z_5*h_0 + z_6,
		-6*x_2^3*v_2^3*beta_0 - 4*v_3^3*x_1^3*beta_0 - 4*x_3^3*v_1^3*beta_0 - v_4^3*x_0^3*beta_0 - x_4^3*v_0^3*beta_0 + y_4^2*a_0 + y_5^2,
		-12*z_2*w_1*y_1^2*c_0 - 12*y_2^2*w_1*z_1*c_0 - 12*w_2*y_1^2*z_1*c_0 - 6*y_2^2*z_2*w_0*c_0 - 4*z_3*y_1^2*w_0*c_0 - 4*y_3^2*z_1*w_0*c_0 - 6*w_2*z_2*y_0^2*c_0 - 4*z_3*w_1*y_0^2*c_0 - 4*w_3*z_1*y_0^2*c_0 - z_4*w_0*y_0^2*c_0 - 6*w_2*y_2^2*z_0*c_0 - 4*y_3^2*w_1*z_0*c_0 - 4*w_3*y_1^2*z_0*c_0 - y_4^2*w_0*z_0*c_0 - w_4*y_0^2*z_0*c_0 + 6*w_2*y_2^2*c_0*q_0 + 4*y_3^2*w_1*c_0*q_0 + 4*w_3*y_1^2*c_0*q_0 + y_4^2*w_0*c_0*q_0 + w_4*y_0^2*c_0*q_0 + w_4*b_0 + w_5,
		x_3^3*d_0^4 + 3*v_2^3*x_1^3*beta_0 + 3*x_2^3*v_1^3*beta_0 + v_3^3*x_0^3*beta_0 + x_3^3*v_0^3*beta_0 + x_4^3,
		v_3^3*u_0^4 + v_4^3 - y_3^2*k_0,
		-z_6 + 465772844155007632611743291058771419017830694928075276454142928931229772142012642077010632127210749863137532980268830221772411142089825557639837104615638470794385810992467612551276968911488635905391593391975612738779346181789296057203585730296843206894808588676209798689335254302119388831110546727041803223000040546522955110820560734313647263376569469943725036532051133525691825924352970214295006761118734530129182360449057872768271612159226787371674774314850248,
		-20*w_3*y_3^2*c_0*q_0 - 15*y_4^2*w_2*c_0*q_0 - 15*w_4*y_2^2*c_0*q_0 - 6*y_5^2*w_1*c_0*q_0 - 6*w_5*y_1^2*c_0*q_0 - y_6^2*w_0*c_0*q_0 - w_6*y_0^2*c_0*q_0 + z_6*h_0 + z_7,
		-10*v_3^3*x_2^3*beta_0 - 10*x_3^3*v_2^3*beta_0 - 5*v_4^3*x_1^3*beta_0 - 5*x_4^3*v_1^3*beta_0 - v_5^3*x_0^3*beta_0 - x_5^3*v_0^3*beta_0 + y_5^2*a_0 + y_6^2,
		-30*y_2^2*z_2*w_1*c_0 - 30*w_2*z_2*y_1^2*c_0 - 20*z_3*w_1*y_1^2*c_0 - 30*w_2*y_2^2*z_1*c_0 - 20*y_3^2*w_1*z_1*c_0 - 20*w_3*y_1^2*z_1*c_0 - 10*z_3*y_2^2*w_0*c_0 - 10*y_3^2*z_2*w_0*c_0 - 5*z_4*y_1^2*w_0*c_0 - 5*y_4^2*z_1*w_0*c_0 - 10*z_3*w_2*y_0^2*c_0 - 10*w_3*z_2*y_0^2*c_0 - 5*z_4*w_1*y_0^2*c_0 - 5*w_4*z_1*y_0^2*c_0 - z_5*w_0*y_0^2*c_0 - 10*y_3^2*w_2*z_0*c_0 - 10*w_3*y_2^2*z_0*c_0 - 5*y_4^2*w_1*z_0*c_0 - 5*w_4*y_1^2*z_0*c_0 - y_5^2*w_0*z_0*c_0 - w_5*y_0^2*z_0*c_0 + 10*y_3^2*w_2*c_0*q_0 + 10*w_3*y_2^2*c_0*q_0 + 5*y_4^2*w_1*c_0*q_0 + 5*w_4*y_1^2*c_0*q_0 + y_5^2*w_0*c_0*q_0 + w_5*y_0^2*c_0*q_0 + w_5*b_0 + w_6,
		x_4^3*d_0^4 + 6*x_2^3*v_2^3*beta_0 + 4*v_3^3*x_1^3*beta_0 + 4*x_3^3*v_1^3*beta_0 + v_4^3*x_0^3*beta_0 + x_4^3*v_0^3*beta_0 + x_5^3,
		v_4^3*u_0^4 + v_5^3 - y_4^2*k_0,
		-z_7 + 7601230961628607005589419529227829241415854208903338596808228794588019055668167111158711564176741621670791068878794634710585616006237491804076853363069213573997300795582704304794332817829478002302355541615320327005736591955814279127866073441965231823235255640837644338157304913974478633525791662377002117226464866672655347078980085174523988324058252052366032513687674729803829027844543112546710610858834432612622720502192534807530046052235104161668053661260158930924904628593947311837419973811922802598132265643306119851958199198665056,
		-35*y_4^2*w_3*c_0*q_0 - 35*w_4*y_3^2*c_0*q_0 - 21*y_5^2*w_2*c_0*q_0 - 21*w_5*y_2^2*c_0*q_0 - 7*y_6^2*w_1*c_0*q_0 - 7*w_6*y_1^2*c_0*q_0 - y_7^2*w_0*c_0*q_0 - w_7*y_0^2*c_0*q_0 + z_7*h_0 + z_8,
		-90*w_2*y_2^2*z_2*c_0 - 60*z_3*y_2^2*w_1*c_0 - 60*y_3^2*z_2*w_1*c_0 - 60*z_3*w_2*y_1^2*c_0 - 60*w_3*z_2*y_1^2*c_0 - 30*z_4*w_1*y_1^2*c_0 - 60*y_3^2*w_2*z_1*c_0 - 60*w_3*y_2^2*z_1*c_0 - 30*y_4^2*w_1*z_1*c_0 - 30*w_4*y_1^2*z_1*c_0 - 20*y_3^2*z_3*w_0*c_0 - 15*z_4*y_2^2*w_0*c_0 - 15*y_4^2*z_2*w_0*c_0 - 6*z_5*y_1^2*w_0*c_0 - 6*y_5^2*z_1*w_0*c_0 - 20*w_3*z_3*y_0^2*c_0 - 15*z_4*w_2*y_0^2*c_0 - 15*w_4*z_2*y_0^2*c_0 - 6*z_5*w_1*y_0^2*c_0 - 6*w_5*z_1*y_0^2*c_0 - z_6*w_0*y_0^2*c_0 - 20*w_3*y_3^2*z_0*c_0 - 15*y_4^2*w_2*z_0*c_0 - 15*w_4*y_2^2*z_0*c_0 - 6*y_5^2*w_1*z_0*c_0 - 6*w_5*y_1^2*z_0*c_0 - y_6^2*w_0*z_0*c_0 - w_6*y_0^2*z_0*c_0 + 20*w_3*y_3^2*c_0*q_0 + 15*y_4^2*w_2*c_0*q_0 + 15*w_4*y_2^2*c_0*q_0 + 6*y_5^2*w_1*c_0*q_0 + 6*w_5*y_1^2*c_0*q_0 + y_6^2*w_0*c_0*q_0 + w_6*y_0^2*c_0*q_0 + w_6*b_0 + w_7,
		-20*x_3^3*v_3^3*beta_0 - 15*v_4^3*x_2^3*beta_0 - 15*x_4^3*v_2^3*beta_0 - 6*v_5^3*x_1^3*beta_0 - 6*x_5^3*v_1^3*beta_0 - v_6^3*x_0^3*beta_0 - x_6^3*v_0^3*beta_0 + y_6^2*a_0 + y_7^2,
		x_5^3*d_0^4 + 10*v_3^3*x_2^3*beta_0 + 10*x_3^3*v_2^3*beta_0 + 5*v_4^3*x_1^3*beta_0 + 5*x_4^3*v_1^3*beta_0 + v_5^3*x_0^3*beta_0 + x_5^3*v_0^3*beta_0 + x_6^3,
		v_5^3*u_0^4 + v_6^3 - y_5^2*k_0,
		-z_8 + 142624630779352307152208516448982777464034119012499790851106212436843017828299490868523562318649408258068291467221841101159059663783976890342344489298067722444887777090132969982777851297180281413245667050272787029258602730941348342819696829311991803913851269555162211361956091664308411591771138403617439465777163330942024577413825636773554061651865677137989998527781679549240631208265246185508090349574512821739678616768743661190717937244080618546251244442469259484371766718328279356540011659467817335879205918423482915356476588415108892841714897024044411767086936300566887101200576978872497462096946355228992,
		-70*w_4*y_4^2*c_0*q_0 - 56*y_5^2*w_3*c_0*q_0 - 56*w_5*y_3^2*c_0*q_0 - 28*y_6^2*w_2*c_0*q_0 - 28*w_6*y_2^2*c_0*q_0 - 8*y_7^2*w_1*c_0*q_0 - 8*w_7*y_1^2*c_0*q_0 - y_8^2*w_0*c_0*q_0 - w_8*y_0^2*c_0*q_0 + z_8*h_0 + z_9,
		-35*v_4^3*x_3^3*beta_0 - 35*x_4^3*v_3^3*beta_0 - 21*v_5^3*x_2^3*beta_0 - 21*x_5^3*v_2^3*beta_0 - 7*v_6^3*x_1^3*beta_0 - 7*x_6^3*v_1^3*beta_0 - v_7^3*x_0^3*beta_0 - x_7^3*v_0^3*beta_0 + y_7^2*a_0 + y_8^2,
		-210*z_3*w_2*y_2^2*c_0 - 210*y_3^2*w_2*z_2*c_0 - 210*w_3*y_2^2*z_2*c_0 - 140*y_3^2*z_3*w_1*c_0 - 105*z_4*y_2^2*w_1*c_0 - 105*y_4^2*z_2*w_1*c_0 - 140*w_3*z_3*y_1^2*c_0 - 105*z_4*w_2*y_1^2*c_0 - 105*w_4*z_2*y_1^2*c_0 - 42*z_5*w_1*y_1^2*c_0 - 140*w_3*y_3^2*z_1*c_0 - 105*y_4^2*w_2*z_1*c_0 - 105*w_4*y_2^2*z_1*c_0 - 42*y_5^2*w_1*z_1*c_0 - 42*w_5*y_1^2*z_1*c_0 - 35*z_4*y_3^2*w_0*c_0 - 35*y_4^2*z_3*w_0*c_0 - 21*z_5*y_2^2*w_0*c_0 - 21*y_5^2*z_2*w_0*c_0 - 7*z_6*y_1^2*w_0*c_0 - 7*y_6^2*z_1*w_0*c_0 - 35*z_4*w_3*y_0^2*c_0 - 35*w_4*z_3*y_0^2*c_0 - 21*z_5*w_2*y_0^2*c_0 - 21*w_5*z_2*y_0^2*c_0 - 7*z_6*w_1*y_0^2*c_0 - 7*w_6*z_1*y_0^2*c_0 - z_7*w_0*y_0^2*c_0 - 35*y_4^2*w_3*z_0*c_0 - 35*w_4*y_3^2*z_0*c_0 - 21*y_5^2*w_2*z_0*c_0 - 21*w_5*y_2^2*z_0*c_0 - 7*y_6^2*w_1*z_0*c_0 - 7*w_6*y_1^2*z_0*c_0 - y_7^2*w_0*z_0*c_0 - w_7*y_0^2*z_0*c_0 + 35*y_4^2*w_3*c_0*q_0 + 35*w_4*y_3^2*c_0*q_0 + 21*y_5^2*w_2*c_0*q_0 + 21*w_5*y_2^2*c_0*q_0 + 7*y_6^2*w_1*c_0*q_0 + 7*w_6*y_1^2*c_0*q_0 + y_7^2*w_0*c_0*q_0 + w_7*y_0^2*c_0*q_0 + w_7*b_0 + w_8,
		v_6^3*u_0^4 + v_7^3 - y_6^2*k_0,
		x_6^3*d_0^4 + 20*x_3^3*v_3^3*beta_0 + 15*v_4^3*x_2^3*beta_0 + 15*x_4^3*v_2^3*beta_0 + 6*v_5^3*x_1^3*beta_0 + 6*x_5^3*v_1^3*beta_0 + v_6^3*x_0^3*beta_0 + x_6^3*v_0^3*beta_0 + x_7^3,
		-z_9 + 3085490172466570146677196442100228621963770957217521184311267550191397209849349338641440760904754939184324081695004835281465408822996239307132531261112316384457920610217065376615992919189496817516809727848148412946646472305085733772380329102046085269402845735723441514617654110572373873266297568912435123736744789073316814265191083542267312033269575544480506224959873286586220664138192746973007707059978276928629996065960478537224997867216826596039124897724077936620260655212592626187032780756041629872015294785738890303583563939634667378072188699615530020666835517582137321858885674410280216551185869180006015382404422979018694817346703507538216781130988936305983040201873250186304,
		-w_4 + 65643086502898011142443850879616561681985137962759661559149427131914048643750653255308409026598026417577434228592984421321027874577530782547266863021726415095161467967493565297394995791492364350481891207689224163252679512091588812832128841357297742918547172918191619556352115106955671580882003843885855980793315591632,
		-w_5 + 958370953190593218159535909399899319094253190860810657689910200734019109596242482954621569205602452100823491848067765529672022506123901574587492976799003224385116260693155318755225377270501057812005029410394957462351548677516812027299574603314527091400632713648049985776178098550162123067594000148855105184020011577878435646430187944790310485481635960813521855051455821266762326327492604944,
		-w_6 + 15640239772530622369946288179071963121315159735369030565822829522020313792570972261011413842141063808450557936415097872749607226197732399981065642773665580888301940207560489624580588846716011057942334160222706836450613694990284261506259348440380112968293469326444367868059857221159866334120418236131619764073204838320769376435150195106229739236393624844553865979149734562614361933141690219406625637998417626940450609330550130685073572999905018247617880776005252688,
		-w_7 + 293463444818125156429082250423924913751416182132231865964362360736164357509078712530503111575111227450678900439538726067001940693542453246018715066300092220708364331650641223860767892515384769776006547840244523790752144438021951958112983892726741638055125045617324522587573596557837158803491142480729117176415968683800628507747861263937236175520675051950692833575252380697428120826764476005213934289669400529790129069871884912287914652904526210480702053232106106135688785117464598376537611747073710548350743107375262578905375748725418176,
		-w_8 + 6348683043150751753490553466959130984486397475174298581475494593414534145053717618657902465307205608439512522488322374613621128850567595740614298013545887318222939170855200675222882127266852314721077816583264704503747421171027979235341524801380341144560432980062945018123880543664237948729606318302346530831002327252001798387084934093788950418607191469821769307003397831451054202046659866900372025414088879424997447652796120681182531965509620825083142117530356181402205890022688097458338832583887295054607855055869644184898175031850977614535872005420462245686227936490265288302604964077872063245831189421342592,
		z_aux - 1
    ]
end

