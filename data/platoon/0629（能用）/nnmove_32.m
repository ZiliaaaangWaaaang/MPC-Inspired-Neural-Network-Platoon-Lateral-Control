function [Y,Xf,Af] = nnmove_32(X,~,~)
%NNMOVE_32 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Jun-2024 12:53:52.
% 
% [Y] = nnmove_32(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.644786415382709;-2.24855099234896;-0.581789816284725;-1.89546903030855];
x1_step1.gain = [1.42933908693485;0.45598879896227;1.88894161457496;0.499777584457468];
x1_step1.ymin = -1;

% Layer 1
b1 = [-3.0633284933152133966;2.541672174252225691;-2.4406232804266694281;2.552392318291954787;1.640547263082282603;-1.108979803901111616;1.2454559812578545053;0.6877818189704635321;0.954881637826582641;0.15897759166808198006;-0.050674234210814350643;0.27923305109581647576;-1.0970394268196206333;-1.7457861006948869331;1.8187924680972369362;1.9882584039861410652;2.2821154102355416526;-2.6072369136947037838;-2.2614118036366721576;-2.7883177172009037115];
IW1_1 = [1.2026465740374470137 -1.860995792800317794 -0.98300853593443959788 -1.5576000815393875598;0.20528988738624964761 2.4373974562068996264 -0.89207198158928124876 1.3233046532715104782;1.1305543532756185954 1.2866763439388650969 -1.7537297983676136681 1.5729730915498976174;-0.95637129933114251035 -0.63775365106894532641 -2.9203108003327367115 0.74532304606932253677;-2.1863111476641088338 -0.80972389456859006351 1.0962950838003417964 1.4388671496838729702;0.24680878002292241935 1.581338040789454169 -2.4769685177181703928 -0.24352789063895344257;-1.4013155184729717551 -2.2525245570450840304 -1.3070240423613581626 -0.01075136268608732279;-0.97985690500174538187 -1.1468358245366330195 2.1116091628295095006 -1.0878501302751446556;-0.57388714886121261483 1.4729851232779682668 1.7443339112562015192 -0.95905771158048680469;-1.0948671305384209962 2.1360800394608365771 0.90582734255033925397 1.4857061487596039395;0.026907969786797658607 -1.1487499763971709132 1.6269486133605775002 1.4246258292537015144;0.47796774994455748509 1.7734964363739036397 1.0443996167212621362 0.80195643363915258828;-0.75600536613480684434 -1.9523016449583057152 1.0647240068443484251 1.2104625059154576761;-0.9572472650572073638 -1.6394106948709705751 -1.0831416941584759428 1.0072910550698384036;1.2901967297142495905 2.0738037294608462346 -0.089103011313120095149 -1.657338809954027381;-0.18962980159184197881 -2.0019012978616399501 -0.38822721703190787856 -2.0668729545635988742;1.3147372462210513699 0.83261640474034293025 -0.93800365804439400641 -1.8863877736111320793;-0.78538744498201551458 1.9282933921870155647 -1.5892748194797097216 -0.97473023267886049759;-1.6041588044568366733 -1.0619958076927549229 0.30539779790118620761 -2.5259378522092412744;-1.3312177325638552272 -0.69271547809568700949 2.5075183167916246241 1.2059332723571172252];

% Layer 2
b2 = [1.4340501503040528064;-1.3301919946636495684;-0.85411668513386418411;0.63295935637402367391;-0.0266244704356233923;-0.1350399070611741914;0.48912296881256656089;0.72403641069422985943;-1.2595221461202710245;1.6743879256454992088];
LW2_1 = [0.37873172588927028759 -0.38055491719706691089 0.48796468168503898122 0.50232857755657911447 -0.62458486458190698443 0.74053635167305820186 -0.27814065720701663942 0.15500069875745858816 0.68699547236894287217 0.10556871711243115408 -0.1239260452017344194 -0.050352866991951683584 -0.12457207684692213345 0.17028826724194418007 0.22662567508106107317 0.48134255586629492996 -0.24290934879111514277 0.48517290037630478317 0.85719621337336537881 0.21039455591600667028;-0.079334712927871253729 0.010383576608085007958 0.15988341922124010841 -0.52665338897688562803 0.5768355952207886439 -0.22939853254749356659 0.33537684992257255079 0.016963841712861790767 0.33469687284169613584 -0.7476678591623941994 -0.033016419148639092329 -0.17218266732097167737 0.14601368364349523454 -0.30476468735008011013 0.30585554633151812443 0.10534007045591570195 -0.067498879224490673789 0.075464273127182235346 0.86905756637205799908 0.25346481161583694908;0.50041675557735310065 -0.59094679547076844894 -0.25787748475727789721 -0.2223108227724682473 -0.22514699172922830739 -0.30784899537096505062 -0.20393771823832190782 -0.56297194621001234172 0.15344280709502461368 -0.46224855269310377581 -0.21068992447319495609 -0.42792901714303499539 0.31991100884961870543 0.044689993663965081605 -4.4060301450707205348e-05 -0.41818329304463675022 -0.14993234947874847784 0.39243696332196803533 0.51468694680956073029 -0.078189690216970531011;0.12790974809057695238 0.80389238360160508723 -0.018158872006650717684 -0.90143861749209541756 0.16377499866837569309 -0.14322415819935030434 -0.18628738373923037219 -0.38683020816875246517 0.43209459994767812629 0.15160911188620521117 -0.22762185659740391541 0.6937382369002526028 -0.15363656969677638719 -0.61724275178271992282 -0.26599405114410901163 -1.2151410328757650259 0.43247741763975788842 -0.22271043938963344666 -0.056097698243305779697 1.0743526235906177835;-0.46964704857023303886 0.089619249443079404549 0.24869110948026751373 -0.3976125279900717957 -0.27757824318102630734 0.16729841624843094783 0.50954769686996703726 -0.53771414963434938095 0.5326551991164101274 -0.12207134688465293149 0.10906158128607965074 -0.29233490933969419334 -0.11779596533879028997 -0.44729578901078048681 0.47228911947042556685 -0.37292611310925288803 -0.65976028812466325224 -0.43355763488842768982 0.11104198706167553445 0.40070768770164888473;-0.45917496911811989113 0.46655925603568365601 -0.073169833890457017245 -0.86538158365650175163 -0.5517395716695920882 0.036581466192196057663 -0.39231055396120223522 0.042633055930909484477 0.044380455770980570263 -0.42055465563081434466 0.19870737820500694593 0.2017032835519920464 -0.28287968686287134901 -0.20580672504649563659 0.70602819618343326535 0.49044783937456432055 -0.27513375474469559112 -0.11009940097754991606 0.43193442756569122576 -0.35318989381046611564;0.59149407423535838024 0.26650874841859711895 -0.51770757617027807207 0.074938472187947163805 0.20153428858431954307 -0.36428593659918484526 -0.40653043117208459423 0.22279168707733126853 0.1468594899328307668 0.38103000164313044484 0.37784555065145486452 0.24753740327078457839 -0.48683863834288942929 -0.4167599366810491035 -0.43701437981013080414 -0.38044507722883680323 0.54999462845730517913 -0.2706614538307797746 -0.10162432422117924358 -0.27481931306962303907;0.37509044180922779255 0.11719996754560875474 0.18764191745434308234 -0.30256899671120002226 0.30029029112462546358 0.74735281391094554593 0.70973730846449023524 -0.38827085282176942993 -0.1207928745548142585 -0.77717989830936606843 0.089315166745993296304 -0.53510295162144072556 -0.16244820773766630029 -0.41969049914047096284 0.25299518777530916047 -0.19386885125617603354 0.2722549582553347447 -0.14567524304499274157 -0.4839326020015267682 -0.33302989953332773343;-0.26114339598965335965 -0.15276281193212803977 0.53627891908627900452 -0.44772580443844356424 0.061384008554350194542 0.33986422336951704892 -0.24013769827091352438 -0.41509686454914529463 0.40732946483640664059 -0.26107058316636017059 0.81580942355501417929 -0.22585689895825708517 -0.044525344108183706471 -0.35621158106416350719 0.40258410739415922963 0.25379002616658236091 -0.13651315165417182707 0.5164711048221439782 -0.014072137533507753787 0.40367101931837645612;0.15431216734527583578 0.55158552545275141288 -0.010607374078843682594 0.57521294163837910496 -0.31139732930478281059 -0.020910830238878044124 0.34288973933338651179 0.2309636163516342322 0.29194209256312730894 -0.49455854475647775814 -0.1097142448544793647 -0.14661048975298082708 0.41356673176251323998 0.55999101292936015462 0.51660429823704889785 -0.027594038110977291145 0.52520549133813121401 -0.2379596537951338131 -0.31612143003351911297 0.14586101359953215773];

% Layer 3
b3 = [1.8077178038347017086;1.6623246189294591524;-1.5019582123959782649;1.25523163642079294;-1.176446773391754963;-0.79128152315450328569;-0.59646473415628120662;-0.64347117818942167755;0.1324453806315409321;-0.064356889458277874438;-0.14151141729105440326;0.21691068887133718723;-0.45483477384600423665;0.73498349445550514858;-0.89489107028319059278;-1.2431332942992172619;-1.2829296550684852196;-1.4929310598086316109;1.6747472082350152167;2.0575550762280037098];
LW3_2 = [-0.34785622716584918557 0.12111620281943519251 1.2121605351908391057 -1.0350386431261839881 -0.29592267397617566527 -0.0080403740736324016969 -0.545041464800310127 -0.7223206774152109988 0.26293431662836508345 -0.53592732313459656712;-0.43342596890390738817 0.8109205198336759679 -0.55994521451273926438 1.1669353124563208723 -0.16722332246596352534 -0.12384342563630000578 -0.48739727562715295939 -0.76349497107841535204 0.083009530247416335458 0.94573575176868085457;0.63057729142048679627 0.82454611921583820244 -0.67560902657616273004 -0.64914302731121453771 0.23199161934816639463 -0.71935518031225320623 -0.60327542141911605356 -0.71851416933049072622 -0.054954036094676445012 -0.35016531436502901231;-0.21735534630769620668 -0.58726320552454436275 0.99223272531290329646 0.79933317423166039273 0.097884767168352870836 0.57351210212145831147 0.24517109049333887794 0.90688511275528138622 -0.40183616099989843962 -0.52561571605813439678;0.95611112815453447311 -0.50174913281612754101 -0.69078126316446819555 0.35298879496148122259 0.10105284483364554426 -0.59697990508174170188 0.74739388035688425482 -0.3315645530009254105 0.15995422178293394744 -0.074123809691799616428;0.55769531424160112554 0.58872665297254722638 -0.46039243694707721044 -0.69702809306248225685 0.0062413081886254218045 0.46843732670684029573 -0.11533536975988382955 1.1636667035770857925 -0.98289199496268575551 -0.10523964609334307552;0.87004003346759906101 0.14951261098566026586 0.14382616113042476225 0.99980200159634546875 -0.10383113876005178877 -0.76419608884182221864 0.41316226271280026561 0.22292645335613511803 0.91449378630162703185 0.91565628870211412949;0.51706066663177774334 -0.059774246996506533169 0.25993772259623298959 0.64975174156460613339 -0.45393064594596288508 0.15840269634595338655 1.1031915402365908285 0.48407045735852133328 -0.8349712251614953562 -1.123322396603788631;-0.39620923341582658939 0.43491579855578954561 -0.58138615137999538618 -0.36264417720768266085 0.37439697633324209303 -1.0566874249745528136 0.47336001370327512872 0.11274879060192469216 1.0324938106482739464 0.3800001163600718046;0.88378468260194065209 -0.48702767452305156803 0.20983627160351597807 -0.79286834797959759857 -0.34309398069822655275 1.0491997089164901702 -0.36010100772927278179 -0.72965678623948504455 0.36068425985498375752 -0.81823325881384101343;-0.57980625337366165084 -0.58174476452881673794 -0.77385576443277914738 -0.21195652106998710829 0.18069621422167075897 0.22314884405377449772 -0.83535487404131192335 -0.84152532101897337125 -0.1539590415508859389 -0.49654505000860038599;0.48948989632903860958 0.79918332698503158351 0.34849457300326253106 -0.34629406428110814931 0.86094560806545550324 0.50113148006327001838 0.064809166117110572625 0.64200088300523971974 -0.35581972971396069738 0.84026866232414731961;-0.3620336837245280992 0.72608242148443546959 -0.053983344071040433032 -0.48753351638884961927 0.85760676675677371961 -0.77232272201177554205 0.42297046134094046232 0.30902919539254730674 0.84431912651111284962 0.78883040326102904505;0.24754805260264384215 -0.0069402200251288091726 -0.40911702777720182489 0.77603754994416862534 0.42595034950977339605 -1.1999766057347138748 0.41389659129861794407 -0.74551807406991377203 -0.23112942223374363659 0.41936637974475837742;-0.0015173625826907571543 -0.7267366997751333324 0.077844139345768365024 -0.80633773664606001041 -0.86108837902270984888 -0.027250380175385249121 -0.48962569605848699217 -0.6333001102087562062 -0.65461489204788492202 0.88151061508476147299;-0.6032372798218446075 -0.54217065776054196302 -0.16367674776396895497 0.99964984733268891226 -0.26783506131570877784 0.31101397352562620835 0.45884069084149664564 0.42743313142179006903 0.70614862785515908339 0.53155799922700941451;-0.81424377789081081591 -0.62078239845564953114 -0.60890236047306967038 0.16685515170461981405 0.77383510221327034273 0.018177100408548588911 -0.14620581272815785789 -0.8582174178042526469 -0.57914681474278939532 -0.63714337110933016994;-0.052541587960535061919 -0.31657708262881317784 0.35140191302123463535 0.90369845635446588439 -0.36642298384018517909 0.40281408571412330444 -0.13144833622382343097 -0.42521475995812346715 0.93233059080716640388 -1.0875209102197436195;0.70417344388525460186 -0.62496624685853363612 -0.80291595509615065751 -0.81864752895161518875 -0.17086299811953103989 -0.3119356224530534516 0.30543734596608945742 0.17129290196431179449 0.75928794123769227653 -0.8021700171816947833;0.80722283820424767242 0.56466895302585218275 0.053603543343333406868 -0.77004733594225827087 0.20508890300079271607 0.53968013820581683948 0.46234704511939389571 0.41527192105449250992 0.56593190614292621099 0.55723704231854520597];

% Layer 4
b4 = 0.0029977951797501476393;
LW4_3 = [0.25193564385554279017 -0.64301315775309419998 -0.42605732720014688475 -0.33476089536683778514 -0.10755072441464083588 0.3982659488270364756 -0.70090969452127627193 0.65307680555356262264 0.68224030978836613937 0.73044067077329510873 0.31514300536704453748 0.058806632147896699403 0.54587001892115538659 -0.15719581557911255221 -0.074703418734756166231 -0.32142435666289159713 0.41439061038569963147 -0.68172137401168775295 -0.26239432913184490559 0.77047373949540620686];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 1.25;
y1_step1.xoffset = -0.800000000000002;

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
