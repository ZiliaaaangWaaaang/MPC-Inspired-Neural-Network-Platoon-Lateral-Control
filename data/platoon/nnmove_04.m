function [Y,Xf,Af] = nnmove_04(X,~,~)
%NNMOVE_04 neural network simulation function.
%
% Auto-generated by MATLAB, 18-Jan-2025 09:37:22.
% 
% [Y] = nnmove_04(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.647616379060142;-2.37366072205907;-0.510991349439703;-1.76682920600066];
x1_step1.gain = [1.58326877892889;0.517745986015106;2.12314366372446;0.519634118677897];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.5190485690690542775;-1.9062963268265331607;-1.2179919539078396529;-1.006880169499662081;0.87616504189840527239;1.2208799844863225115;-1.3534429426561023213;0.63149363702568417356;-2.4196034065669489443;-2.4882134519401342132];
IW1_1 = [-2.1562189546154342246 0.079094547629829772828 -0.83987746352337866451 0.10494144884092723724;0.97887330195725086313 -1.7278297523617800469 1.5198611184065118351 -1.6327549027414562932;-0.087326086796074689489 -0.88374732540060707553 -2.4972098256010557549 -0.013694922557923379369;-0.23535384413592302932 -1.0481206081103309202 1.2333415141843488971 1.5330208856901921255;-0.76506795549614903251 0.13715347275393269255 -2.0232685260037106545 -0.25372688304664642311;-0.51579736580297608217 -2.9075401352468110971 -1.9829301173858293605 -1.0821927590003668218;-0.094527005448325152059 -0.46431512915245432005 -2.1554951163115245727 -1.8582519543148701135;0.44771563635487937605 2.7962752838120139565 1.0637921776743426427 1.2498064662080101694;-0.59235222392483122267 -1.6776705253075441249 -0.98160712667707694656 0.83888331624758571969;0.72653995342369226407 -1.7423628624072529103 -1.3929493509190375988 1.1230996220244364725];

% Layer 2
b2 = [-1.629778386917548838;1.7484979426122164714;1.0886114112536497966;0.28339045422773773142;-0.45378213464824501688;-0.08901152801148239091;-0.19504653115327630353;-0.87815781903884260196;-1.3602369033171837209;-1.8245465825209661315];
LW2_1 = [0.42469721155383233224 -0.78266947942618769751 -0.37674399884655623838 -0.68701460302381556211 -0.52461403441193998898 -0.51086826057438750048 -0.94611877901106455901 -0.70801173773325165595 -0.41019353510451128653 -0.47878949049791535986;-0.39853803922044178654 0.67516241447861369274 -0.10453742924306293205 -1.6904848838743353756 -0.37584501923094604248 0.077511542980471359598 -0.37305135083340013047 0.091869269705257564085 -0.40878668071332169287 0.38621383354650229425;-0.29159576060238179274 -0.75484616197272857985 -0.2971635710664276564 0.20197120270093824046 0.58483902620579009124 -0.73266490600870270988 -0.073684942441702649951 0.032962830644219301424 -0.90743117240063120299 -1.3253315952666464561;-0.3298652551074011674 -0.78781151118618464313 1.5896141776320005246 -0.53699054748076047172 -0.38490536962538685062 0.092042448761405493141 -0.6688079866196866563 0.807118938779897932 -1.1027979305364419282 0.18659285980675022198;-0.11016719502129650177 -0.37488265247049357143 0.0087932079468236428593 -0.42672712529286099814 0.21636075882260444314 0.45351987204435234569 -0.14825333842369536885 -1.5643614546135007348 0.63161100477786502605 -0.4705254693984305403;-0.51336009804501536724 1.3355133174895599257 0.060001333469460314818 0.47792099276286492682 -0.4740984671462420974 -1.0589233036872180982 1.1318614311621206792 -0.2234169349099385804 -0.43480544339793303354 0.29955435031907212684;-0.52060038637184657961 0.58299063534748962745 0.36483382010257392469 0.068629204771824325881 -0.045617340771951286893 -0.43675343535013616547 -0.21711407799189849643 -1.2666145566737592176 -1.0247946028028771526 -0.49780614928926758544;-0.18610039738091252448 0.98782832854117030852 -0.13362220505526573033 -0.29283025975411697273 -0.71715331720327391007 -0.27547397340156826173 -0.86093697254844347988 0.36657486383813903119 0.36759393490337216592 0.66433584437910009335;-0.55365730000476953698 0.23803618986668031998 0.75719777524719700246 0.023401388269725723057 0.16697325153593067792 -1.9832108300914046417 -0.051391564630176987671 1.183508279142295283 -0.36381571434144249766 0.28316451733703673632;-0.21776164117619992155 -0.93218733927090491331 -0.74192939159664783588 -0.098581276513475493695 0.36225279113418723531 -0.93724659122165521197 0.90206832699609884596 0.60452551654483310806 -0.28918733485255948557 -0.81637259986258259303];

% Layer 3
b3 = -0.13411752211224459153;
LW3_2 = [-0.28084341832316916943 0.61634934615544878511 0.88480945111316311458 -0.72790407772391874097 0.72123271904084129691 0.70521021728896093883 -0.72120790749671737085 0.12237191326937472968 -0.35192499330538495883 -0.33181241513852149927];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 1.25;
y1_step1.xoffset = -0.8;

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
    a3 = repmat(b3,1,Q) + LW3_2*a2;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a3,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(3,0);

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
