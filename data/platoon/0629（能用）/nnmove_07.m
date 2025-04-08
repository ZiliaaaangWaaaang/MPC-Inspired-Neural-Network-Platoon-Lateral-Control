function [Y,Xf,Af] = nnmove_07(X,~,~)
%NNMOVE_07 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Jun-2024 12:53:29.
% 
% [Y] = nnmove_07(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 4xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.2432837396787;-1.77671183213846;-0.522218457189092;-1.87191152625995];
x1_step1.gain = [2.00451934292179;0.567049054539722;2.07268153958104;0.53194555728415];
x1_step1.ymin = -1;

% Layer 1
b1 = [3.198366969856267783;-2.6996128411019113535;-2.5380370545470705146;1.7303801535246230436;-1.5678073103987593129;2.0768746722727677856;0.96877695095709637219;0.90900325998828768181;-0.84664060705002297524;0.11764676301516753532;-0.051398824932440426161;-0.11380339725290045116;0.8787541205171045533;0.51439951020265839432;1.3664096241946022126;-1.4166673804309830587;1.8155077173633562548;1.832518908137998892;-2.5813802310342941482;-2.8831839851737650626];
IW1_1 = [-0.39427563291788825239 2.4172948143943173704 -1.3526979170475139647 0.31822409468330359328;1.9592299903379148951 -1.9627076849537887782 1.0913251756815995908 -0.81868731749064249659;0.89712309693174507874 2.0045782935222828947 -0.6244396902904421065 -1.4184354949470687757;0.20649012574856512314 -2.4962256318790436715 -1.4897607241428163505 0.98253008606735059427;0.35408765277213649636 2.1892861948341262313 1.735223800728106891 -1.1119962709862767358;-1.4809549592174424681 0.029057800471514010077 -1.2878923833862643278 1.9430413700671296251;-1.2142449027907693537 1.3055464506893512677 -2.2552379169156271388 0.16953183638417174128;-0.98294892648982412631 2.1097302684899386094 1.5575714610835502683 0.51809266750033677873;1.9022978179649738806 -1.5545008330403224939 0.40096958979453273253 0.5293104522476168583;-2.1169381040959995843 -2.0878317668115835559 0.2255826381070147324 0.56623530268860400305;0.068019559586303582344 2.7460353845582421428 -0.37337705825717104613 1.5853105944205576616;-1.1432543357684092911 -0.40822964578215714671 -1.179885411726329103 2.0949361382855276048;0.74949713314151744648 -1.8654266966812003137 1.5392672193548253556 -1.6404310309743059815;0.35680260102802285882 -1.9202065426328347453 -1.0791697850862917996 -1.4199276012290662496;1.1472558954986451507 -2.5121661551709313365 -0.13882524187518319181 -0.99762466260090476577;-1.5774655042683225492 -2.6028382564824603662 0.1089079050403648774 0.79096747360636843194;1.1918185887025267711 2.1433617024789599625 1.9465408871204605834 -0.77878390396719798794;1.3712869729442569433 -1.0058041555347794205 -1.2983430699309386203 2.1603850459472813128;-1.1931305084131178518 0.41919115275752916183 -1.3511551811961521885 -2.3770061361143577372;-0.97311590597954733539 1.5684213745463539968 -0.81830315406274933832 2.300908702750465995];

% Layer 2
b2 = [-1.70410061683133085;-1.0098948256242354926;0.85688154375343561497;0.62211266911036378069;-0.075072996616716972107;-0.45823374085011459034;0.58593546126411832908;-0.88509390409765420493;-1.2608803619508111016;1.548131917365459298];
LW2_1 = [0.045196112651002873228 -0.18656416349891052908 0.46218725834880153291 0.52151298830190817579 -0.62055302707734605328 0.25243043447000002022 -0.19784201685634644763 0.57211594275147770183 0.4319341347066187331 -0.056705555266306793827 0.23419163830379285951 0.48479704044007287944 -0.46981793654045467257 -0.58376324303213078526 -0.048473300029226909502 0.06842761779501811692 -0.39836757569195374584 -0.048454115734363492618 0.35670283794922030829 -0.19909407878218673971;0.34298328291939811363 0.68607133825101052071 -0.038487899915146478458 -0.2164709457600957343 0.6232360638742683312 0.47943513841641910433 -0.0050268581500396425366 0.91713159170629687811 0.61997874359934401767 0.36340286110309949485 0.60914756207859654946 -0.32963512116316490141 0.011644542066919019718 0.21281460954401257291 0.1212740414704705505 -0.16279593035895351116 0.81480559827763698877 0.48544696859251201815 -0.67162147910875658052 0.0056927059813359770502;-0.45099582636705626282 -0.27405067098747781795 -0.034780080515167323407 -0.0021821600804503779591 0.24564968815438581462 0.21262911590953520458 0.50807632633790233978 0.44253003658238931894 -0.2028518862853111171 0.15107705531953538602 -0.64130019884446587408 -0.28340380954534921676 -0.42953418215590177809 -0.6188140438222637929 0.25700551655307257715 -0.24506548954244586347 -0.75112611041784960175 0.65968315177074077216 -0.1065281312751778231 -0.062842540624983969644;-0.42048626509893005654 -0.27746670971663101035 0.3673926670254004101 -0.15615439030379268948 -0.32161337629190095422 -0.099252825891442159056 0.35403554404812298539 -0.19030934015688266703 -0.27440121985663401549 -0.8028406262976112151 0.48811887753273519586 0.29319532904900991177 -0.76209008618809859215 0.55093399356920003118 -0.61516664561784706322 0.061660383832050053021 0.12712235040627792304 0.11899073540730895071 0.51811069904303663769 0.44543393662289748614;0.17695913780716798769 0.65986746622273151353 0.12348514334777435653 0.96748648035148032687 -0.15977614253046523718 0.3800552473960338018 0.28955331776235176955 0.41181416956813077235 -0.53574419667494277419 -0.44482080928280509635 0.040961640621872491552 -0.29133074014268534047 -0.13873327691176856602 -0.16078075721953011268 0.39994998028569128667 0.67994326913844060911 0.17673266146847496638 -0.068650514595754413838 0.19358453681316034611 -0.12088780983660313284;-0.80216440182866888264 -0.30709516429404537519 -0.50738464629332391542 0.25965322108045663096 -0.40668762654748202845 -0.17090667818724891713 0.13903731301478927662 0.36254016354270640621 0.30745402754137979295 0.24618494526859718841 -0.37849567127768274366 0.21150092427512703908 -0.36268318951868483424 0.41973115102956465305 0.24085544704485190026 -0.39438788450003692265 0.49064931913218989834 -0.20951970181332701948 0.7189406675582639128 -0.097649975847997588785;0.3098729299548946825 -0.40727511855419640252 -0.37415734255265487018 0.48062990686233847404 -0.1346681630487655823 -0.54215935948428040092 0.11976607602871733316 -0.22942607945424520199 -0.39122174550269084303 -0.51388807009428305594 -0.082506579919408351564 0.12875942865955272709 0.48207320125761765617 -0.30268147798606870325 0.47299195531764237632 -0.4984916220333060477 -0.47985566561374504158 -0.10580799396571904936 -0.12012224276244753973 -0.079305225981041019279;-0.2859921867196786871 0.11976143818655761442 -0.29531546373760392266 -0.33092151059793101231 -0.52584377896385692264 -0.415706731412534225 0.72131448039537815475 -0.20315921423090343989 -0.32562728745780350481 0.41976181053970579304 0.2358171268633538209 -0.027960891961693407071 -0.55442236201148176189 -0.053172876229383103652 -0.040085919146690116022 0.11035263025868552456 0.095442701150032407953 0.13210866914133945205 0.26907746083472744436 0.30050777544128398633;-0.32054743823454123763 0.19208829586694961544 0.36748317829876803176 0.48638116841873846319 -0.3754292913869470838 0.16190854714281252558 0.01421749891648290548 -0.27930035956116161522 -0.51655891350691918174 -0.10833977551234123815 0.38085702545522925888 0.16211506149873528004 -0.40353105420314244745 0.15426391766238453651 -0.35847544199484815408 0.41695292185582849553 -0.38474689345730977985 -0.42954768475002158556 0.27864196489362685893 -0.56824638399119931087;0.43177119864818008788 0.40633702000090171635 -0.070609667716050622532 -0.46911932185449667365 0.075258867580458244095 0.072905406709179276792 -0.17659828155520210236 0.26724653742132203904 -0.51067364653694125032 -0.30563470832165107183 0.45160644143336725609 0.0037925714609118449383 0.28101262493310258384 -0.863346077586692906 -0.45454752152258320885 -0.076065121078841946289 -0.34104299902718826498 -0.32319940414910619531 -0.021404774792305486519 -0.44060770534376969554];

% Layer 3
b3 = [-1.908395605775196513;1.6806095310201283333;1.5045228337527225548;1.2697348535775252465;-0.95335897356678322989;-0.80033887888457388993;0.81848646509450462272;0.50834385182020336291;0.32716105418364221924;0.14903958666993924465;0.08413059482164012004;0.23909348885799386331;0.80216840726147486951;0.66274947216753610224;0.80876380828066118944;1.1030449458857551903;-1.1595866571850055315;-1.41095592583506102;-1.6962125112670576321;-1.8830134763464021486];
LW3_2 = [0.51760937120697958491 -1.0079229216035472394 -0.031494532515540782369 -1.0253633036466454076 -0.75846674604322050772 -0.48031429936315450657 -0.42427025408490898206 0.18757112729314032173 -0.23174385290396365411 0.34223418563028717987;-0.92991954691512102027 -0.64364578772618952218 -0.5755419566572347323 -0.64099993312499448095 0.51426714570507525703 -0.023047137393062570865 0.72492411790275723682 -0.40576729085987800483 0.1914833751760877667 0.74305946307831305386;-0.79885706153950397646 -0.56186040291528127621 -0.45134185047700220439 0.88303292325071280899 -0.38673668921021675526 0.60632839977342578575 0.62555564038722022424 -0.33357918571354105985 -0.30807101932727781746 -0.53350515946542087509;-0.4058426490988633617 0.02236783549173762542 0.52845042185428459103 0.80259689164289238494 -0.81665031710619440108 0.15368696039437548806 -0.26672579275601027149 -0.76545715840042827249 -0.89631001428817946852 -0.70304213349292343782;0.71248450862982259935 0.056516759070360127193 -0.44263320531277000613 -0.78728638516777627032 -0.61591247067407861593 -0.59804984412585882048 0.73176513628508799147 0.64041931472026969452 -0.38481751970943578467 0.97828054333145275656;0.17849778375038916067 0.018189162442543493209 0.76206921593181942143 0.32696721905326531221 1.0996185212315354729 -0.77475640492917763336 -0.14198704440733775356 -0.70775490412308117438 -0.79068577275359785972 0.1024779700291109652;-1.0973412295735367472 -0.4171377731776768627 -0.53128829820700884667 -0.8546563849319631645 0.77283696139853541585 -0.72414566597958418548 0.090585720281324721981 -0.61224728423301733038 0.14105468990306330168 -0.26393983243227064905;-0.37659795921185429401 0.27065654224569440922 1.1360002875524064514 -0.88413516835003813643 -0.20003111927540861981 -0.57882109530479419757 -0.17315331844802048233 0.36667197427650777275 0.66844829846872122481 0.35360553708875508416;-0.64493730132450788339 0.1869027694348568136 0.34047667725275659878 -0.6379441237961567257 -0.95516266894339596494 -0.12321228770451732315 -0.06200193664050720338 -0.99942629623853829202 -0.1645395281343616789 0.81545637510655044622;-0.40976487352346785409 -0.79592922052198977756 -0.58910347532897133771 0.43610668236835475886 -0.42680724394045471692 -0.29488442619109223042 0.48657077956944150277 -1.0017182105412898441 0.27365044494763696159 0.76419125484436689622;-0.78998319143578099588 -0.51291630748194250167 0.69995942501275143499 0.47828285715909574227 -0.81016726398568417178 -0.34724981080318090276 -0.57402908006969599608 -0.63098872451278742446 -0.52266719299926533981 0.75652251632656219993;0.51697801565463652462 -0.94420162195952395123 -1.0123692169525413398 0.55145983760066541457 0.5131364137177738538 0.30304496523374102601 0.42129987502578908343 -0.37817284234005821286 -0.042891248323357653027 0.15810052614231567825;0.27319922922210609917 -0.64657089626724839615 0.96788833296933018957 -0.19992883823961143941 -0.74194479183810124745 0.1696866147329081087 -0.51420079976675703293 0.30677524747454432141 -0.73508853562307296947 -0.61958402536370293934;0.56632165834104186697 -0.0079622396048488683351 0.77631426812341763899 0.55524024556301809774 0.87724395239616681508 -1.0105572254057635373 -0.051486154785604559825 0.49291247753775796481 0.71594492643681273414 0.081236319875255147416;0.67676574646226561605 0.7797254549149308378 0.14564569804884214266 -0.24790444075430312365 0.70680150977246214428 -0.84082487036200226349 -0.50423356408233843684 0.72821238329194981631 0.55913503415914234118 0.54303023184433418802;0.65345925195270593289 -0.39961401282708364224 0.45641531555476694271 1.1039947351061141223 0.56556844761052504911 -0.2859228230794955139 0.20138349958611428958 0.13191758166720907175 -0.81180997486146555531 -0.58637307990542542058;-0.79987343865013249555 -0.44860605045493184839 0.049587464862050109615 0.6981361509183777736 0.5518909097812718656 0.81577007846951377079 -0.32026594877530278893 -0.012835818359794689408 -0.85967416324424628105 0.36664375046330843766;-0.32922816172689994829 -0.89815700504006323879 0.69551015622929923676 -0.74612750364292079741 -0.67208362409808775073 0.086506036456535290169 0.96953184564782879384 0.072175079955913046259 0.02808839897381996964 0.69406295960813257917;-0.729619129111807041 0.67174726698016917759 -0.77531967162455450726 -0.25814154694135349466 0.73142913081754079574 0.64317220121036089431 -0.68888885727342541454 0.57031020599659154602 0.38886631485608713632 -0.058415691738456100579;-1.0030711138711085884 -0.51171775922079643095 -0.60453851366134125911 -0.468083491650199357 -0.86098393100045211845 -0.35659576225223060808 -0.62903300296459896401 -0.11726544929855967081 0.66515227639801133286 -0.084803245586686754054];

% Layer 4
b4 = 0.10946551637981463689;
LW4_3 = [0.69819993777515154676 0.40922060963563194891 0.77860814883671680686 -0.27308699790489543435 -0.31082018372006070539 -0.10959681681532949804 0.63310627787377526943 -0.37253362496358016775 0.14659510681140905386 -0.59105110758771073343 -0.62307369049041216869 0.70109386063505219067 0.22639935749261838605 -0.087129427871170728181 0.019805155686221279088 0.2678589021610102705 -0.16915296343964528192 0.65430319935846159574 0.052827584137553992849 0.12480058923067591237];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 1.25;
y1_step1.xoffset = -0.800000000000001;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = tansig_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Layer 3
    a3 = tansig_apply(repmat(b3,1,Q) + LW3_2*a2);
    
    % Layer 4
    a4 = repmat(b4,1,Q) + LW4_3*a3;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a4,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(4,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end
