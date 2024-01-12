#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function Pharm_with_weights(; np=AbstractAlgebra, ordering=:degrevlex, k=np.QQ)
    R, (x1_10,x1_9,x2_9,x3_9,x1_8,x2_8,x3_8,x4_8,x1_7,x2_7,x3_7,x4_7,x1_6,x2_6,x3_6,x4_6,x1_5,x2_5,x3_5,x4_5,x1_4,x2_4,x3_4,x4_4,x1_3,x2_3,x3_3,x4_3,x1_2,x2_2,x3_2,x4_2,x1_1,x2_1,x3_1,x4_1,x1_0,x2_0,x3_0,x4_0,z_aux,a1_0,ka_0,n_0,kc_0,b1_0,b2_0) = np.PolynomialRing(k, [:x1_10,:x1_9,:x2_9,:x3_9,:x1_8,:x2_8,:x3_8,:x4_8,:x1_7,:x2_7,:x3_7,:x4_7,:x1_6,:x2_6,:x3_6,:x4_6,:x1_5,:x2_5,:x3_5,:x4_5,:x1_4,:x2_4,:x3_4,:x4_4,:x1_3,:x2_3,:x3_3,:x4_3,:x1_2,:x2_2,:x3_2,:x4_2,:x1_1,:x2_1,:x3_1,:x4_1,:x1_0,:x2_0,:x3_0,:x4_0,:z_aux,:a1_0,:ka_0,:n_0,:kc_0,:b1_0,:b2_0], ordering=ordering)
    sys = [
    		-x1_0 + 17429503050366457311700,
		-x2_0^2*x3_0^2*a1_0*kc_0 - x1_0*x2_0^2*a1_0*ka_0 + x1_0*x3_0^2*a1_0*kc_0 - x2_0^2*a1_0*ka_0*kc_0 + x1_0^2*a1_0*ka_0 + x1_1*x3_0^2*kc_0 + x1_0*a1_0*ka_0*kc_0 + x1_1*x1_0*ka_0 + x1_0*ka_0*n_0 + x1_1*ka_0*kc_0,
		-x1_1 + k(1463022506029574912756425579589728146224695160681295548074595837186440460257165453204339)//k(76616329669440113899464316052548042171749577),
		-x3_1^2*x2_0^2*a1_0*kc_0 - x2_1^2*x3_0^2*a1_0*kc_0 - x2_1^2*x1_0*a1_0*ka_0 - x1_1*x2_0^2*a1_0*ka_0 + x3_1^2*x1_0*a1_0*kc_0 + x1_1*x3_0^2*a1_0*kc_0 - x2_1^2*a1_0*ka_0*kc_0 + 2*x1_1*x1_0*a1_0*ka_0 + x1_1*x3_1^2*kc_0 + x1_2*x3_0^2*kc_0 + x1_1*a1_0*ka_0*kc_0 + x1_1^2*ka_0 + x1_2*x1_0*ka_0 + x1_1*ka_0*n_0 + x1_2*ka_0*kc_0,
		-x3_0^2*x4_0^3*kc_0*b1_0 - x1_0*x4_0^3*ka_0*b1_0 + x3_0^4*kc_0*b1_0 - x4_0^3*ka_0*kc_0*b1_0 + x3_1^2*x3_0^2*kc_0 + x1_0*x3_0^2*ka_0*b1_0 + x3_0^2*ka_0*kc_0*b1_0 + x3_1^2*x1_0*ka_0 + x3_1^2*ka_0*kc_0 + x3_0^2*n_0*kc_0,
		x2_0^2*a1_0 + x2_1^2 - x1_0*a1_0,
		-x1_2 - k(237428970202255495811685108182268307429805707336626404202721659344646702764262106741994777063421509108081913641939971536164387248817830207142740908908839442786576759256562335876653020256777202794222)//k(449742603228046847403026834296928366653094027285734677561128305880334410503244102755568379592806400747747974776183044246934591563033),
		-2*x2_1^2*x3_1^2*a1_0*kc_0 - x3_2^2*x2_0^2*a1_0*kc_0 - x2_2^2*x3_0^2*a1_0*kc_0 - 2*x1_1*x2_1^2*a1_0*ka_0 - x2_2^2*x1_0*a1_0*ka_0 - x1_2*x2_0^2*a1_0*ka_0 + 2*x1_1*x3_1^2*a1_0*kc_0 + x3_2^2*x1_0*a1_0*kc_0 + x1_2*x3_0^2*a1_0*kc_0 - x2_2^2*a1_0*ka_0*kc_0 + 2*x1_1^2*a1_0*ka_0 + 2*x1_2*x1_0*a1_0*ka_0 + x3_2^2*x1_1*kc_0 + 2*x1_2*x3_1^2*kc_0 + x1_3*x3_0^2*kc_0 + x1_2*a1_0*ka_0*kc_0 + 3*x1_2*x1_1*ka_0 + x1_3*x1_0*ka_0 + x1_2*ka_0*n_0 + x1_3*ka_0*kc_0,
		-x4_1^3*x3_0^2*kc_0*b1_0 - x3_1^2*x4_0^3*kc_0*b1_0 - x4_1^3*x1_0*ka_0*b1_0 - x1_1*x4_0^3*ka_0*b1_0 + 2*x3_1^2*x3_0^2*kc_0*b1_0 - x4_1^3*ka_0*kc_0*b1_0 + x3_1^4*kc_0 + x3_2^2*x3_0^2*kc_0 + x3_1^2*x1_0*ka_0*b1_0 + x1_1*x3_0^2*ka_0*b1_0 + x3_1^2*ka_0*kc_0*b1_0 + x1_1*x3_1^2*ka_0 + x3_2^2*x1_0*ka_0 + x3_2^2*ka_0*kc_0 + x3_1^2*n_0*kc_0,
		x2_1^2*a1_0 + x2_2^2 - x1_1*a1_0,
		x4_0^3*b2_0^4 - x3_0^2*b2_0^4 + x4_1^3,
		-x1_3 + k(38531543881912067514727182532953999854172941107362203344606120981485840296089471429345964156786777510876058435741146050165415919897484734122664725122898998976215052078823552805640755457750455410683917724901080195432289640901880127905906259741802671809354538753245953761060477882583080806275825505544848548296)//k(2640016952404586302375889129836395586279104702659075485380253108224058220350945749555920530168750806548284004321680195469675080371615442551418422216141242252158183731597023554066782427964783049596259188092726063865431657),
		-3*x3_2^2*x2_1^2*a1_0*kc_0 - 3*x2_2^2*x3_1^2*a1_0*kc_0 - x3_3^2*x2_0^2*a1_0*kc_0 - x2_3^2*x3_0^2*a1_0*kc_0 - 3*x2_2^2*x1_1*a1_0*ka_0 - 3*x1_2*x2_1^2*a1_0*ka_0 - x2_3^2*x1_0*a1_0*ka_0 - x1_3*x2_0^2*a1_0*ka_0 + 3*x3_2^2*x1_1*a1_0*kc_0 + 3*x1_2*x3_1^2*a1_0*kc_0 + x3_3^2*x1_0*a1_0*kc_0 + x1_3*x3_0^2*a1_0*kc_0 - x2_3^2*a1_0*ka_0*kc_0 + 6*x1_2*x1_1*a1_0*ka_0 + 2*x1_3*x1_0*a1_0*ka_0 + 3*x1_2*x3_2^2*kc_0 + x3_3^2*x1_1*kc_0 + 3*x1_3*x3_1^2*kc_0 + x1_4*x3_0^2*kc_0 + x1_3*a1_0*ka_0*kc_0 + 3*x1_2^2*ka_0 + 4*x1_3*x1_1*ka_0 + x1_4*x1_0*ka_0 + x1_3*ka_0*n_0 + x1_4*ka_0*kc_0,
		-2*x3_1^2*x4_1^3*kc_0*b1_0 - x4_2^3*x3_0^2*kc_0*b1_0 - x3_2^2*x4_0^3*kc_0*b1_0 - 2*x1_1*x4_1^3*ka_0*b1_0 - x4_2^3*x1_0*ka_0*b1_0 - x1_2*x4_0^3*ka_0*b1_0 + 2*x3_1^4*kc_0*b1_0 + 2*x3_2^2*x3_0^2*kc_0*b1_0 - x4_2^3*ka_0*kc_0*b1_0 + 3*x3_2^2*x3_1^2*kc_0 + x3_3^2*x3_0^2*kc_0 + 2*x1_1*x3_1^2*ka_0*b1_0 + x3_2^2*x1_0*ka_0*b1_0 + x1_2*x3_0^2*ka_0*b1_0 + x3_2^2*ka_0*kc_0*b1_0 + 2*x3_2^2*x1_1*ka_0 + x1_2*x3_1^2*ka_0 + x3_3^2*x1_0*ka_0 + x3_3^2*ka_0*kc_0 + x3_2^2*n_0*kc_0,
		x2_2^2*a1_0 + x2_3^2 - x1_2*a1_0,
		x4_1^3*b2_0^4 - x3_1^2*b2_0^4 + x4_2^3,
		-x1_4 - k(6253153828106909418861659860882522434369502753669053362727858780405551599937921966880321376963438583873887930933373704154738460666669589692665065984948884929065202124081525294807470622174934072925542126489853872999771803804764808436536166714763334136918831517862312783930872732870148984548273767365039809541633472094887749645242929587831547848725240102934530073346903519826890001057904724693097505206214068436809593796)//k(15497063117788606096952231389016218561272753918007819126282993152104833739909713082801407107000718355737649215391770782197266222601075920623553169398812495261044672764083908016736557428354782752604366538686012389379001170394080217338250359120270174507804698655723021397942019279559763078611949300938392455353),
		-6*x2_2^2*x3_2^2*a1_0*kc_0 - 4*x3_3^2*x2_1^2*a1_0*kc_0 - 4*x2_3^2*x3_1^2*a1_0*kc_0 - x3_4^2*x2_0^2*a1_0*kc_0 - x2_4^2*x3_0^2*a1_0*kc_0 - 6*x1_2*x2_2^2*a1_0*ka_0 - 4*x2_3^2*x1_1*a1_0*ka_0 - 4*x1_3*x2_1^2*a1_0*ka_0 - x2_4^2*x1_0*a1_0*ka_0 - x1_4*x2_0^2*a1_0*ka_0 + 6*x1_2*x3_2^2*a1_0*kc_0 + 4*x3_3^2*x1_1*a1_0*kc_0 + 4*x1_3*x3_1^2*a1_0*kc_0 + x3_4^2*x1_0*a1_0*kc_0 + x1_4*x3_0^2*a1_0*kc_0 - x2_4^2*a1_0*ka_0*kc_0 + 6*x1_2^2*a1_0*ka_0 + 8*x1_3*x1_1*a1_0*ka_0 + 2*x1_4*x1_0*a1_0*ka_0 + 4*x3_3^2*x1_2*kc_0 + 6*x1_3*x3_2^2*kc_0 + x3_4^2*x1_1*kc_0 + 4*x1_4*x3_1^2*kc_0 + x1_5*x3_0^2*kc_0 + x1_4*a1_0*ka_0*kc_0 + 10*x1_3*x1_2*ka_0 + 5*x1_4*x1_1*ka_0 + x1_5*x1_0*ka_0 + x1_4*ka_0*n_0 + x1_5*ka_0*kc_0,
		-3*x4_2^3*x3_1^2*kc_0*b1_0 - 3*x3_2^2*x4_1^3*kc_0*b1_0 - x4_3^3*x3_0^2*kc_0*b1_0 - x3_3^2*x4_0^3*kc_0*b1_0 - 3*x4_2^3*x1_1*ka_0*b1_0 - 3*x1_2*x4_1^3*ka_0*b1_0 - x4_3^3*x1_0*ka_0*b1_0 - x1_3*x4_0^3*ka_0*b1_0 + 6*x3_2^2*x3_1^2*kc_0*b1_0 + 2*x3_3^2*x3_0^2*kc_0*b1_0 - x4_3^3*ka_0*kc_0*b1_0 + 3*x3_2^4*kc_0 + 4*x3_3^2*x3_1^2*kc_0 + x3_4^2*x3_0^2*kc_0 + 3*x3_2^2*x1_1*ka_0*b1_0 + 3*x1_2*x3_1^2*ka_0*b1_0 + x3_3^2*x1_0*ka_0*b1_0 + x1_3*x3_0^2*ka_0*b1_0 + x3_3^2*ka_0*kc_0*b1_0 + 3*x1_2*x3_2^2*ka_0 + 3*x3_3^2*x1_1*ka_0 + x1_3*x3_1^2*ka_0 + x3_4^2*x1_0*ka_0 + x3_4^2*ka_0*kc_0 + x3_3^2*n_0*kc_0,
		x2_3^2*a1_0 + x2_4^2 - x1_3*a1_0,
		x4_2^3*b2_0^4 - x3_2^2*b2_0^4 + x4_3^3,
		-x1_5 + k(144971881137936171584421294250859940169848212355642574525673139313669891701315539926066166535246367466446316781119126656247731343168839484130420038488354990090102336338767435243339297711561457080402952838039102081671866972153780497228621540182149952729489810177992576619636022147072087393936447107494779720712080471015210900926628134905827003167271471683750122781371657397347515639978901214391536463935639473090709632896014943970697930908952560845333367972570984975489063706840490891653841992581855895436323132993382770914220916)//k(12995531555095387465011181601207617185281962315081081595251217085497580028989421093476737794236281097345206364527260003966355426803545198819356540868973887197801265450898745864164001562640422648576210020325111792663925457524778550272106037109616195433547608131997698581587087083354070297285157051310608564352385806354094278464534967318738823780362572386625600829534252167387422806239053081050991),
		-10*x3_3^2*x2_2^2*a1_0*kc_0 - 10*x2_3^2*x3_2^2*a1_0*kc_0 - 5*x3_4^2*x2_1^2*a1_0*kc_0 - 5*x2_4^2*x3_1^2*a1_0*kc_0 - x3_5^2*x2_0^2*a1_0*kc_0 - x2_5^2*x3_0^2*a1_0*kc_0 - 10*x2_3^2*x1_2*a1_0*ka_0 - 10*x1_3*x2_2^2*a1_0*ka_0 - 5*x2_4^2*x1_1*a1_0*ka_0 - 5*x1_4*x2_1^2*a1_0*ka_0 - x2_5^2*x1_0*a1_0*ka_0 - x1_5*x2_0^2*a1_0*ka_0 + 10*x3_3^2*x1_2*a1_0*kc_0 + 10*x1_3*x3_2^2*a1_0*kc_0 + 5*x3_4^2*x1_1*a1_0*kc_0 + 5*x1_4*x3_1^2*a1_0*kc_0 + x3_5^2*x1_0*a1_0*kc_0 + x1_5*x3_0^2*a1_0*kc_0 - x2_5^2*a1_0*ka_0*kc_0 + 20*x1_3*x1_2*a1_0*ka_0 + 10*x1_4*x1_1*a1_0*ka_0 + 2*x1_5*x1_0*a1_0*ka_0 + 10*x1_3*x3_3^2*kc_0 + 5*x3_4^2*x1_2*kc_0 + 10*x1_4*x3_2^2*kc_0 + x3_5^2*x1_1*kc_0 + 5*x1_5*x3_1^2*kc_0 + x1_6*x3_0^2*kc_0 + x1_5*a1_0*ka_0*kc_0 + 10*x1_3^2*ka_0 + 15*x1_4*x1_2*ka_0 + 6*x1_5*x1_1*ka_0 + x1_6*x1_0*ka_0 + x1_5*ka_0*n_0 + x1_6*ka_0*kc_0,
		-6*x3_2^2*x4_2^3*kc_0*b1_0 - 4*x4_3^3*x3_1^2*kc_0*b1_0 - 4*x3_3^2*x4_1^3*kc_0*b1_0 - x4_4^3*x3_0^2*kc_0*b1_0 - x3_4^2*x4_0^3*kc_0*b1_0 - 6*x1_2*x4_2^3*ka_0*b1_0 - 4*x4_3^3*x1_1*ka_0*b1_0 - 4*x1_3*x4_1^3*ka_0*b1_0 - x4_4^3*x1_0*ka_0*b1_0 - x1_4*x4_0^3*ka_0*b1_0 + 6*x3_2^4*kc_0*b1_0 + 8*x3_3^2*x3_1^2*kc_0*b1_0 + 2*x3_4^2*x3_0^2*kc_0*b1_0 - x4_4^3*ka_0*kc_0*b1_0 + 10*x3_3^2*x3_2^2*kc_0 + 5*x3_4^2*x3_1^2*kc_0 + x3_5^2*x3_0^2*kc_0 + 6*x1_2*x3_2^2*ka_0*b1_0 + 4*x3_3^2*x1_1*ka_0*b1_0 + 4*x1_3*x3_1^2*ka_0*b1_0 + x3_4^2*x1_0*ka_0*b1_0 + x1_4*x3_0^2*ka_0*b1_0 + x3_4^2*ka_0*kc_0*b1_0 + 6*x3_3^2*x1_2*ka_0 + 4*x1_3*x3_2^2*ka_0 + 4*x3_4^2*x1_1*ka_0 + x1_4*x3_1^2*ka_0 + x3_5^2*x1_0*ka_0 + x3_5^2*ka_0*kc_0 + x3_4^2*n_0*kc_0,
		x2_4^2*a1_0 + x2_5^2 - x1_4*a1_0,
		x4_3^3*b2_0^4 - x3_3^2*b2_0^4 + x4_4^3,
		-x1_6 - k(23526995863020690942989692208867538174440770675671218101372207985747373974768134515569951304362498542801616032130114178075177301061231854873240934826262532610468941208343371512198674348685202416947137134385797266283328159547452469834314409830440657746466529575125809866131351998801096973507422961592842561688286252428583582256326157398947079689424078888569731490330019170397055407216289847393047766133216138230838810133762680327359135966934617325242297894671170258542719281468137363294790845776896763640455341792882599334664839688688913247001024241002921280223774830355437844669427760806363775529112974924347752382478858433640924319077188)//k(76284575587703666969858608633657983563724353141170721082551094594729326595500930248286166869924768024414038624806303833837538858925492927134925830399140709677532386167639127397076358861905493189503841478081311285619374393643864820010400793139280131783328577089228487619889432703356194110997381982488266840329143425144114798491860557985171749825844402159178992360790040938000130432581516226891148636240529088156020872591802392722344302155074820803202570779270368918388143947077268639),
		-20*x2_3^2*x3_3^2*a1_0*kc_0 - 15*x3_4^2*x2_2^2*a1_0*kc_0 - 15*x2_4^2*x3_2^2*a1_0*kc_0 - 6*x3_5^2*x2_1^2*a1_0*kc_0 - 6*x2_5^2*x3_1^2*a1_0*kc_0 - x3_6^2*x2_0^2*a1_0*kc_0 - x2_6^2*x3_0^2*a1_0*kc_0 - 20*x1_3*x2_3^2*a1_0*ka_0 - 15*x2_4^2*x1_2*a1_0*ka_0 - 15*x1_4*x2_2^2*a1_0*ka_0 - 6*x2_5^2*x1_1*a1_0*ka_0 - 6*x1_5*x2_1^2*a1_0*ka_0 - x2_6^2*x1_0*a1_0*ka_0 - x1_6*x2_0^2*a1_0*ka_0 + 20*x1_3*x3_3^2*a1_0*kc_0 + 15*x3_4^2*x1_2*a1_0*kc_0 + 15*x1_4*x3_2^2*a1_0*kc_0 + 6*x3_5^2*x1_1*a1_0*kc_0 + 6*x1_5*x3_1^2*a1_0*kc_0 + x3_6^2*x1_0*a1_0*kc_0 + x1_6*x3_0^2*a1_0*kc_0 - x2_6^2*a1_0*ka_0*kc_0 + 20*x1_3^2*a1_0*ka_0 + 30*x1_4*x1_2*a1_0*ka_0 + 12*x1_5*x1_1*a1_0*ka_0 + 2*x1_6*x1_0*a1_0*ka_0 + 15*x3_4^2*x1_3*kc_0 + 20*x1_4*x3_3^2*kc_0 + 6*x3_5^2*x1_2*kc_0 + 15*x1_5*x3_2^2*kc_0 + x3_6^2*x1_1*kc_0 + 6*x1_6*x3_1^2*kc_0 + x1_7*x3_0^2*kc_0 + x1_6*a1_0*ka_0*kc_0 + 35*x1_4*x1_3*ka_0 + 21*x1_5*x1_2*ka_0 + 7*x1_6*x1_1*ka_0 + x1_7*x1_0*ka_0 + x1_6*ka_0*n_0 + x1_7*ka_0*kc_0,
		-10*x4_3^3*x3_2^2*kc_0*b1_0 - 10*x3_3^2*x4_2^3*kc_0*b1_0 - 5*x4_4^3*x3_1^2*kc_0*b1_0 - 5*x3_4^2*x4_1^3*kc_0*b1_0 - x4_5^3*x3_0^2*kc_0*b1_0 - x3_5^2*x4_0^3*kc_0*b1_0 - 10*x4_3^3*x1_2*ka_0*b1_0 - 10*x1_3*x4_2^3*ka_0*b1_0 - 5*x4_4^3*x1_1*ka_0*b1_0 - 5*x1_4*x4_1^3*ka_0*b1_0 - x4_5^3*x1_0*ka_0*b1_0 - x1_5*x4_0^3*ka_0*b1_0 + 20*x3_3^2*x3_2^2*kc_0*b1_0 + 10*x3_4^2*x3_1^2*kc_0*b1_0 + 2*x3_5^2*x3_0^2*kc_0*b1_0 - x4_5^3*ka_0*kc_0*b1_0 + 10*x3_3^4*kc_0 + 15*x3_4^2*x3_2^2*kc_0 + 6*x3_5^2*x3_1^2*kc_0 + x3_6^2*x3_0^2*kc_0 + 10*x3_3^2*x1_2*ka_0*b1_0 + 10*x1_3*x3_2^2*ka_0*b1_0 + 5*x3_4^2*x1_1*ka_0*b1_0 + 5*x1_4*x3_1^2*ka_0*b1_0 + x3_5^2*x1_0*ka_0*b1_0 + x1_5*x3_0^2*ka_0*b1_0 + x3_5^2*ka_0*kc_0*b1_0 + 10*x1_3*x3_3^2*ka_0 + 10*x3_4^2*x1_2*ka_0 + 5*x1_4*x3_2^2*ka_0 + 5*x3_5^2*x1_1*ka_0 + x1_5*x3_1^2*ka_0 + x3_6^2*x1_0*ka_0 + x3_6^2*ka_0*kc_0 + x3_5^2*n_0*kc_0,
		x2_5^2*a1_0 + x2_6^2 - x1_5*a1_0,
		x4_4^3*b2_0^4 - x3_4^2*b2_0^4 + x4_5^3,
		-x1_7 + k(3818116520209435171557991022427231893644386155822988973441873864764235796236786413828798607351070969874801184975280256339036893838651508395521459413844531788513081005292153089711419324082459670577547811637168997100284549267971575588325389292318400103738301541848777367989279906554481792659100420887605466276930863391821985524833727283814439336980949283928472747648119658651362950351379773282331922821397997217152279625408175852046549958887669926649369989607534327202134175045973159141015551949127754143588155630075343855366102213419818154938677957694251903447940609169768364447582801031946994652147340549236567550497448944713363391924957658346492852623183715205666193704739281849757962483526724357933789882047471638585601461943933449282923086674260)//k(447795186208784533185902277214827445011534681474768748220551058832022793695608451683845678272068934686967020035657938018753473845758015657461840068723008809999158824854308289760012173260711109537840482209488117382086717502188172707533379952161400433505779262978411118560632128225177278338661672243367499517132708817821659264031366736631850711648452207273052725521255741093356961482504153950303524831610013035091542977860611744907800840943078636858227109569084810359076558532512558676186610915573187722755982829729595080472195565236952337445959702519005816353697080807631),
		-35*x3_4^2*x2_3^2*a1_0*kc_0 - 35*x2_4^2*x3_3^2*a1_0*kc_0 - 21*x3_5^2*x2_2^2*a1_0*kc_0 - 21*x2_5^2*x3_2^2*a1_0*kc_0 - 7*x3_6^2*x2_1^2*a1_0*kc_0 - 7*x2_6^2*x3_1^2*a1_0*kc_0 - x3_7^2*x2_0^2*a1_0*kc_0 - x2_7^2*x3_0^2*a1_0*kc_0 - 35*x2_4^2*x1_3*a1_0*ka_0 - 35*x1_4*x2_3^2*a1_0*ka_0 - 21*x2_5^2*x1_2*a1_0*ka_0 - 21*x1_5*x2_2^2*a1_0*ka_0 - 7*x2_6^2*x1_1*a1_0*ka_0 - 7*x1_6*x2_1^2*a1_0*ka_0 - x2_7^2*x1_0*a1_0*ka_0 - x1_7*x2_0^2*a1_0*ka_0 + 35*x3_4^2*x1_3*a1_0*kc_0 + 35*x1_4*x3_3^2*a1_0*kc_0 + 21*x3_5^2*x1_2*a1_0*kc_0 + 21*x1_5*x3_2^2*a1_0*kc_0 + 7*x3_6^2*x1_1*a1_0*kc_0 + 7*x1_6*x3_1^2*a1_0*kc_0 + x3_7^2*x1_0*a1_0*kc_0 + x1_7*x3_0^2*a1_0*kc_0 - x2_7^2*a1_0*ka_0*kc_0 + 70*x1_4*x1_3*a1_0*ka_0 + 42*x1_5*x1_2*a1_0*ka_0 + 14*x1_6*x1_1*a1_0*ka_0 + 2*x1_7*x1_0*a1_0*ka_0 + 35*x1_4*x3_4^2*kc_0 + 21*x3_5^2*x1_3*kc_0 + 35*x1_5*x3_3^2*kc_0 + 7*x3_6^2*x1_2*kc_0 + 21*x1_6*x3_2^2*kc_0 + x3_7^2*x1_1*kc_0 + 7*x1_7*x3_1^2*kc_0 + x1_8*x3_0^2*kc_0 + x1_7*a1_0*ka_0*kc_0 + 35*x1_4^2*ka_0 + 56*x1_5*x1_3*ka_0 + 28*x1_6*x1_2*ka_0 + 8*x1_7*x1_1*ka_0 + x1_8*x1_0*ka_0 + x1_7*ka_0*n_0 + x1_8*ka_0*kc_0,
		x2_6^2*a1_0 + x2_7^2 - x1_6*a1_0,
		-20*x3_3^2*x4_3^3*kc_0*b1_0 - 15*x4_4^3*x3_2^2*kc_0*b1_0 - 15*x3_4^2*x4_2^3*kc_0*b1_0 - 6*x4_5^3*x3_1^2*kc_0*b1_0 - 6*x3_5^2*x4_1^3*kc_0*b1_0 - x4_6^3*x3_0^2*kc_0*b1_0 - x3_6^2*x4_0^3*kc_0*b1_0 - 20*x1_3*x4_3^3*ka_0*b1_0 - 15*x4_4^3*x1_2*ka_0*b1_0 - 15*x1_4*x4_2^3*ka_0*b1_0 - 6*x4_5^3*x1_1*ka_0*b1_0 - 6*x1_5*x4_1^3*ka_0*b1_0 - x4_6^3*x1_0*ka_0*b1_0 - x1_6*x4_0^3*ka_0*b1_0 + 20*x3_3^4*kc_0*b1_0 + 30*x3_4^2*x3_2^2*kc_0*b1_0 + 12*x3_5^2*x3_1^2*kc_0*b1_0 + 2*x3_6^2*x3_0^2*kc_0*b1_0 - x4_6^3*ka_0*kc_0*b1_0 + 35*x3_4^2*x3_3^2*kc_0 + 21*x3_5^2*x3_2^2*kc_0 + 7*x3_6^2*x3_1^2*kc_0 + x3_7^2*x3_0^2*kc_0 + 20*x1_3*x3_3^2*ka_0*b1_0 + 15*x3_4^2*x1_2*ka_0*b1_0 + 15*x1_4*x3_2^2*ka_0*b1_0 + 6*x3_5^2*x1_1*ka_0*b1_0 + 6*x1_5*x3_1^2*ka_0*b1_0 + x3_6^2*x1_0*ka_0*b1_0 + x1_6*x3_0^2*ka_0*b1_0 + x3_6^2*ka_0*kc_0*b1_0 + 20*x3_4^2*x1_3*ka_0 + 15*x1_4*x3_3^2*ka_0 + 15*x3_5^2*x1_2*ka_0 + 6*x1_5*x3_2^2*ka_0 + 6*x3_6^2*x1_1*ka_0 + x1_6*x3_1^2*ka_0 + x3_7^2*x1_0*ka_0 + x3_7^2*ka_0*kc_0 + x3_6^2*n_0*kc_0,
		x4_5^3*b2_0^4 - x3_5^2*b2_0^4 + x4_6^3,
		-x1_8 - k(619629205818396307857624437408365533417405972572154852254319681008577184389186734150774654311342618877908218128822295534477634822110188548153422533668619044343912119945563789467848545964941374515241729823823983278339328043702055464540535668207387201145494780878089659022273671025185495465785486987583475341587708820546471501443688656651782038224549618327569224296426881770664830344998055601306300862911242399071153452946070818894483974947163673539774842372702645611962731683849173606063802664522525691096591766734237069228280066232873531239853980795402082894383751489176034003606209656090427987230151726149153846924405662177634432227277657936940796029421289518053555807530724017383981335645877282432642592552841244641965695861321626230857319605289717449339480066436625159508279338933051007944818959204958833899659165021090704022275342530677157778393966834452)//k(2628585493816157199904008913742963954957051355334154306447529128693992803861281879851938697075064676902347792747276331294821942834335549450907939124935215980034244978912168424134877641399720665617864212582981767005464350736483941956700609201882907423300300672493707819783459165697056586841811525157848506338721807847989970971396638580537375039386836179882147074635236087080646430186291475560403738567812982153719023982230816218781731778967264659761400420828559177930872530034345643136349985048981368762585762140227415860350979772586414217056436378507413029796033198184966920423668450074331159146864672808025464322948993360498504532491319978746098029213107199),
		-70*x2_4^2*x3_4^2*a1_0*kc_0 - 56*x3_5^2*x2_3^2*a1_0*kc_0 - 56*x2_5^2*x3_3^2*a1_0*kc_0 - 28*x3_6^2*x2_2^2*a1_0*kc_0 - 28*x2_6^2*x3_2^2*a1_0*kc_0 - 8*x3_7^2*x2_1^2*a1_0*kc_0 - 8*x2_7^2*x3_1^2*a1_0*kc_0 - x3_8^2*x2_0^2*a1_0*kc_0 - x2_8^2*x3_0^2*a1_0*kc_0 - 70*x1_4*x2_4^2*a1_0*ka_0 - 56*x2_5^2*x1_3*a1_0*ka_0 - 56*x1_5*x2_3^2*a1_0*ka_0 - 28*x2_6^2*x1_2*a1_0*ka_0 - 28*x1_6*x2_2^2*a1_0*ka_0 - 8*x2_7^2*x1_1*a1_0*ka_0 - 8*x1_7*x2_1^2*a1_0*ka_0 - x2_8^2*x1_0*a1_0*ka_0 - x1_8*x2_0^2*a1_0*ka_0 + 70*x1_4*x3_4^2*a1_0*kc_0 + 56*x3_5^2*x1_3*a1_0*kc_0 + 56*x1_5*x3_3^2*a1_0*kc_0 + 28*x3_6^2*x1_2*a1_0*kc_0 + 28*x1_6*x3_2^2*a1_0*kc_0 + 8*x3_7^2*x1_1*a1_0*kc_0 + 8*x1_7*x3_1^2*a1_0*kc_0 + x3_8^2*x1_0*a1_0*kc_0 + x1_8*x3_0^2*a1_0*kc_0 - x2_8^2*a1_0*ka_0*kc_0 + 70*x1_4^2*a1_0*ka_0 + 112*x1_5*x1_3*a1_0*ka_0 + 56*x1_6*x1_2*a1_0*ka_0 + 16*x1_7*x1_1*a1_0*ka_0 + 2*x1_8*x1_0*a1_0*ka_0 + 56*x3_5^2*x1_4*kc_0 + 70*x1_5*x3_4^2*kc_0 + 28*x3_6^2*x1_3*kc_0 + 56*x1_6*x3_3^2*kc_0 + 8*x3_7^2*x1_2*kc_0 + 28*x1_7*x3_2^2*kc_0 + x3_8^2*x1_1*kc_0 + 8*x1_8*x3_1^2*kc_0 + x1_9*x3_0^2*kc_0 + x1_8*a1_0*ka_0*kc_0 + 126*x1_5*x1_4*ka_0 + 84*x1_6*x1_3*ka_0 + 36*x1_7*x1_2*ka_0 + 9*x1_8*x1_1*ka_0 + x1_9*x1_0*ka_0 + x1_8*ka_0*n_0 + x1_9*ka_0*kc_0,
		-35*x4_4^3*x3_3^2*kc_0*b1_0 - 35*x3_4^2*x4_3^3*kc_0*b1_0 - 21*x4_5^3*x3_2^2*kc_0*b1_0 - 21*x3_5^2*x4_2^3*kc_0*b1_0 - 7*x4_6^3*x3_1^2*kc_0*b1_0 - 7*x3_6^2*x4_1^3*kc_0*b1_0 - x4_7^3*x3_0^2*kc_0*b1_0 - x3_7^2*x4_0^3*kc_0*b1_0 - 35*x4_4^3*x1_3*ka_0*b1_0 - 35*x1_4*x4_3^3*ka_0*b1_0 - 21*x4_5^3*x1_2*ka_0*b1_0 - 21*x1_5*x4_2^3*ka_0*b1_0 - 7*x4_6^3*x1_1*ka_0*b1_0 - 7*x1_6*x4_1^3*ka_0*b1_0 - x4_7^3*x1_0*ka_0*b1_0 - x1_7*x4_0^3*ka_0*b1_0 + 70*x3_4^2*x3_3^2*kc_0*b1_0 + 42*x3_5^2*x3_2^2*kc_0*b1_0 + 14*x3_6^2*x3_1^2*kc_0*b1_0 + 2*x3_7^2*x3_0^2*kc_0*b1_0 - x4_7^3*ka_0*kc_0*b1_0 + 35*x3_4^4*kc_0 + 56*x3_5^2*x3_3^2*kc_0 + 28*x3_6^2*x3_2^2*kc_0 + 8*x3_7^2*x3_1^2*kc_0 + x3_8^2*x3_0^2*kc_0 + 35*x3_4^2*x1_3*ka_0*b1_0 + 35*x1_4*x3_3^2*ka_0*b1_0 + 21*x3_5^2*x1_2*ka_0*b1_0 + 21*x1_5*x3_2^2*ka_0*b1_0 + 7*x3_6^2*x1_1*ka_0*b1_0 + 7*x1_6*x3_1^2*ka_0*b1_0 + x3_7^2*x1_0*ka_0*b1_0 + x1_7*x3_0^2*ka_0*b1_0 + x3_7^2*ka_0*kc_0*b1_0 + 35*x1_4*x3_4^2*ka_0 + 35*x3_5^2*x1_3*ka_0 + 21*x1_5*x3_3^2*ka_0 + 21*x3_6^2*x1_2*ka_0 + 7*x1_6*x3_2^2*ka_0 + 7*x3_7^2*x1_1*ka_0 + x1_7*x3_1^2*ka_0 + x3_8^2*x1_0*ka_0 + x3_8^2*ka_0*kc_0 + x3_7^2*n_0*kc_0,
		x2_7^2*a1_0 + x2_8^2 - x1_7*a1_0,
		x4_6^3*b2_0^4 - x3_6^2*b2_0^4 + x4_7^3,
		-x1_9 + k(100557526380068738736771347007393162479586859686104458226670588687370013605637815999249620874661632770405508430896310420195423529608310297396686893099153834353507984855375103831148833066890332022429868063790496397298743231162001941874411657393479316065269650535650199300481563738889602703369160519004507386663148503537849450182034368537585453042225839272595476151388562056468954036231301089316983751744990957482252452068593169832843820089145850603387685885230674458848634847265681292974628491296341878554431216249145445115070569687612868958672516598844406938521554556817989938662118245039196065060387679176367821523329420019313480971004015833883366294745123749970649215923587190412318309315700631688815556600490011493002356297072364525157510679342323523480888535607550862414300393575925729630235100681912663563028232026891452452424165019332057508977886393729956896536573594111171225485357692160003549964770168468723527711007708708008733768315178111362757257956640319940)//k(15429959747443988953622012340364791957958960246665544445523601010748039946607509556818775132131116545458709533925796599585001078132027549228660833619357566463379139260246307818018143075292399708069969936166735045802206186192005623950916732831898852060755628748785199589726178531144967072637251651461222132488955171840697508720160633456128152783311112897347302428761228277372489996227366336001773711214181604452980562767449040941044408438757551054145916451211144773603500497408674203929191403104030398801646725617042532025137457621239007331848439497724074229279075151327261528915772644280927474983236331102986265397728755929102681082422804282541818209110767005064142249065208738064525147829158824510626306903941009620242476319421996501573258509871),
		-126*x3_5^2*x2_4^2*a1_0*kc_0 - 126*x2_5^2*x3_4^2*a1_0*kc_0 - 84*x3_6^2*x2_3^2*a1_0*kc_0 - 84*x2_6^2*x3_3^2*a1_0*kc_0 - 36*x3_7^2*x2_2^2*a1_0*kc_0 - 36*x2_7^2*x3_2^2*a1_0*kc_0 - 9*x3_8^2*x2_1^2*a1_0*kc_0 - 9*x2_8^2*x3_1^2*a1_0*kc_0 - x3_9^2*x2_0^2*a1_0*kc_0 - x2_9^2*x3_0^2*a1_0*kc_0 - 126*x2_5^2*x1_4*a1_0*ka_0 - 126*x1_5*x2_4^2*a1_0*ka_0 - 84*x2_6^2*x1_3*a1_0*ka_0 - 84*x1_6*x2_3^2*a1_0*ka_0 - 36*x2_7^2*x1_2*a1_0*ka_0 - 36*x1_7*x2_2^2*a1_0*ka_0 - 9*x2_8^2*x1_1*a1_0*ka_0 - 9*x1_8*x2_1^2*a1_0*ka_0 - x2_9^2*x1_0*a1_0*ka_0 - x1_9*x2_0^2*a1_0*ka_0 + 126*x3_5^2*x1_4*a1_0*kc_0 + 126*x1_5*x3_4^2*a1_0*kc_0 + 84*x3_6^2*x1_3*a1_0*kc_0 + 84*x1_6*x3_3^2*a1_0*kc_0 + 36*x3_7^2*x1_2*a1_0*kc_0 + 36*x1_7*x3_2^2*a1_0*kc_0 + 9*x3_8^2*x1_1*a1_0*kc_0 + 9*x1_8*x3_1^2*a1_0*kc_0 + x3_9^2*x1_0*a1_0*kc_0 + x1_9*x3_0^2*a1_0*kc_0 - x2_9^2*a1_0*ka_0*kc_0 + 252*x1_5*x1_4*a1_0*ka_0 + 168*x1_6*x1_3*a1_0*ka_0 + 72*x1_7*x1_2*a1_0*ka_0 + 18*x1_8*x1_1*a1_0*ka_0 + 2*x1_9*x1_0*a1_0*ka_0 + 126*x1_5*x3_5^2*kc_0 + 84*x3_6^2*x1_4*kc_0 + 126*x1_6*x3_4^2*kc_0 + 36*x3_7^2*x1_3*kc_0 + 84*x1_7*x3_3^2*kc_0 + 9*x3_8^2*x1_2*kc_0 + 36*x1_8*x3_2^2*kc_0 + x3_9^2*x1_1*kc_0 + 9*x1_9*x3_1^2*kc_0 + x1_10*x3_0^2*kc_0 + x1_9*a1_0*ka_0*kc_0 + 126*x1_5^2*ka_0 + 210*x1_6*x1_4*ka_0 + 120*x1_7*x1_3*ka_0 + 45*x1_8*x1_2*ka_0 + 10*x1_9*x1_1*ka_0 + x1_10*x1_0*ka_0 + x1_9*ka_0*n_0 + x1_10*ka_0*kc_0,
		x2_8^2*a1_0 + x2_9^2 - x1_8*a1_0,
		-70*x3_4^2*x4_4^3*kc_0*b1_0 - 56*x4_5^3*x3_3^2*kc_0*b1_0 - 56*x3_5^2*x4_3^3*kc_0*b1_0 - 28*x4_6^3*x3_2^2*kc_0*b1_0 - 28*x3_6^2*x4_2^3*kc_0*b1_0 - 8*x4_7^3*x3_1^2*kc_0*b1_0 - 8*x3_7^2*x4_1^3*kc_0*b1_0 - x4_8^3*x3_0^2*kc_0*b1_0 - x3_8^2*x4_0^3*kc_0*b1_0 - 70*x1_4*x4_4^3*ka_0*b1_0 - 56*x4_5^3*x1_3*ka_0*b1_0 - 56*x1_5*x4_3^3*ka_0*b1_0 - 28*x4_6^3*x1_2*ka_0*b1_0 - 28*x1_6*x4_2^3*ka_0*b1_0 - 8*x4_7^3*x1_1*ka_0*b1_0 - 8*x1_7*x4_1^3*ka_0*b1_0 - x4_8^3*x1_0*ka_0*b1_0 - x1_8*x4_0^3*ka_0*b1_0 + 70*x3_4^4*kc_0*b1_0 + 112*x3_5^2*x3_3^2*kc_0*b1_0 + 56*x3_6^2*x3_2^2*kc_0*b1_0 + 16*x3_7^2*x3_1^2*kc_0*b1_0 + 2*x3_8^2*x3_0^2*kc_0*b1_0 - x4_8^3*ka_0*kc_0*b1_0 + 126*x3_5^2*x3_4^2*kc_0 + 84*x3_6^2*x3_3^2*kc_0 + 36*x3_7^2*x3_2^2*kc_0 + 9*x3_8^2*x3_1^2*kc_0 + x3_9^2*x3_0^2*kc_0 + 70*x1_4*x3_4^2*ka_0*b1_0 + 56*x3_5^2*x1_3*ka_0*b1_0 + 56*x1_5*x3_3^2*ka_0*b1_0 + 28*x3_6^2*x1_2*ka_0*b1_0 + 28*x1_6*x3_2^2*ka_0*b1_0 + 8*x3_7^2*x1_1*ka_0*b1_0 + 8*x1_7*x3_1^2*ka_0*b1_0 + x3_8^2*x1_0*ka_0*b1_0 + x1_8*x3_0^2*ka_0*b1_0 + x3_8^2*ka_0*kc_0*b1_0 + 70*x3_5^2*x1_4*ka_0 + 56*x1_5*x3_4^2*ka_0 + 56*x3_6^2*x1_3*ka_0 + 28*x1_6*x3_3^2*ka_0 + 28*x3_7^2*x1_2*ka_0 + 8*x1_7*x3_2^2*ka_0 + 8*x3_8^2*x1_1*ka_0 + x1_8*x3_1^2*ka_0 + x3_9^2*x1_0*ka_0 + x3_9^2*ka_0*kc_0 + x3_8^2*n_0*kc_0,
		x4_7^3*b2_0^4 - x3_7^2*b2_0^4 + x4_8^3,
		-x1_10 - k(16319140571049577800833646031713529629464063158958282369474537239135857854445544954122314739420927540076421320251170697879993340918712185269380026767693576559900949759351028227859030593093248895034460922910974971931791740082156763254918740497956950703379537659908673351072854063573398637551280612275915658118207930703596347711801818460116691614873295836632727506475413349761624774303554930614399764131629482261401213297473252746658859810141531591903672497917726162225532508503234459513990941606572874597318276239377604601856278930764659344626571092332709548349202408676762482588409162951293118064509271744741842271997063497167457399699764518831725056093722800343677182008001892891656931528251143028069549441309084904855824449805573287404156435140579284722910225914376382558561606819796726338060237157079197487227631404983640488804813918128723911644194734235690724404572671480625010373889735014246183115722797572340447484815928544961422796194315358537189273259147411429117975760942027451885309612556139502799672344892958344243921884482537385514283616626871285307138006868429582020)//k(90574819943213646864456271671309682382503881568478278691390585437973787477712837429725953719774949105165657681300118673731657023760461867362393239842374304073249436719874663296344446074950419334404706712725481534448720335628355892869924014456911711127801728784488993788613474031947284977007981869104294410879770950295731102725222923129252754240904641532143906122643403743694250332953386261439877482995258503329888067095821538279454695104028897429547411082970437690641987011739107985836857977330148013444191714777487658204779579647805194703902234611321495176569803994770023113556975279076799625171248179851117980580215124507941023567383939172458814972384668908946066907106430579122190515235839836591621470038908114147525735923423599379860104281193051368948007706681874244527258135585934479450043339812419818925018903851208626177208159),
		x3_0^2*z_aux*kc_0 + x1_0*z_aux*ka_0 + z_aux*ka_0*kc_0 - 1
    ]
end

