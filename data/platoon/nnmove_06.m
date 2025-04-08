function [Y,Xf,Af] = nnmove_06(X,~,~)
%NNMOVE_06 neural network simulation function.
%
% Auto-generated by MATLAB, 18-Jan-2025 09:37:23.
% 
% [Y] = nnmove_06(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.692826738054503;-2.37366072205907;-0.510991349439703;-1.97100986088565];
x1_step1.gain = [1.52856145008017;0.474936694026657;1.8804872999334;0.493456443199078];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.7889744925108432838;-1.5216618861442818833;1.3744490112742491217;-0.92061693785984977101;0.40313115310036662375;0.64229236367401587593;1.2228232476056297706;-0.32850277077361972333;1.9800020806711267074;2.5026876852355273151];
IW1_1 = [0.15714930796149018111 -1.2460445505623631846 1.4543811185494626148 0.91212889101688321425;-0.30165626307342552348 0.57268021966720406013 0.13963596591418514503 2.0966813658674681164;-1.2496725437491373878 -1.7379565691320375542 -1.1471447432402637201 -1.1411179091340386549;-0.36213857166424168188 0.80202196544712167636 -2.0678330070160386711 -0.92413413020102386231;-0.22800029290805259863 -2.4115757429229325304 0.025772942439483449706 0.22204258856207947925;1.0436573205523824726 0.47709551827203505736 -1.5200585131744916989 1.1794439549587245608;1.8667884088988904168 -1.137971167538962769 -0.50229918479921242813 0.99933223954787298027;-0.13575046187271661013 -1.5318670797692022223 -1.7829757701999697783 -0.72842395034666362896;1.9545490696789422636 1.3474441270459733833 0.93432919690496030185 0.49716266556916799413;0.48310203984073291084 1.358926072395168827 -1.3029330828417968746 -1.5256168836671628597];

% Layer 2
b2 = [1.5832990478727690942;-1.3512915248461487838;-1.2056474133547916416;-0.56896387364078382376;-0.035375045156970888471;0.11444098874064086158;-1.0033328062376674072;-0.88359889368442978697;-1.5451713148162580236;-1.798877669196500273];
LW2_1 = [-0.74051870486439630437 0.087557556445799600287 -0.14175244295217345747 0.83991390565788259792 0.20465299517290139186 -0.37856923114656187979 -0.95215292804103179858 0.62237746667794613398 0.51914915602769762248 -0.061333684703967043805;0.19860499936725847792 0.40254965454633312438 -0.48887458038340053657 0.5743059457898057607 -0.46865288971509888594 1.120253115217258566 0.41469275890481188673 -0.57335405318459664592 -0.73551753382276541249 -0.35318285866575921395;0.25723696776581567169 -0.82438284516566895377 -0.54362734909380516779 -1.2102554778323151297 0.81340758651576439142 0.76300136609755864203 0.37690675174139182113 -0.67875818574771396019 0.64200871082824106928 0.42701198962606451426;0.31008193159009816986 -0.54164637954002103903 -0.43609647879713525631 0.89457220584001384545 0.1771814293657194006 0.078525235713284374794 -1.011748656098443 -0.83269119542020586522 -0.098767920932888095265 0.63647533122423038954;-0.34386454807629762698 0.75897287064799467959 0.49928160545998223618 0.57413228749946632057 -0.20206968892997145826 0.024643098220491765904 0.78648586868220293766 -0.77628653469321062808 -0.76392874180809478002 -0.77330856393346147915;0.65878373392425548793 -0.32619382285904452434 -0.5083782094802536955 -0.46803866878730449042 0.57038929320349052166 -0.083567959527655957808 0.80218278447942636955 0.58125576099879294745 -0.20578348488072642497 0.94927443850414727766;-0.69843699131962566629 0.62498714729141424673 0.11615628744656104898 -0.38243294449986348083 -0.14810941979660063872 -0.70152735063670756954 0.46196999939461602658 -1.1920552144432263741 0.47176405278779159902 -0.53198928425592229008;-0.4405468896922498101 0.45411897637400455707 -0.37412378406521079599 0.84844329477478130919 -0.23165007892526295885 0.86204469388887761117 0.32421637621638416116 -0.91772753191487410618 0.2642939721309941481 1.0272192601038574455;-0.97293479610137911795 0.80268777461475948609 -0.041557855590761479114 -0.48029278114057089022 -0.55081122965719320206 0.88999036240826534527 0.041710541457427446899 -0.42399917598956443632 0.048816924081613602415 -0.32420723599636347423;-0.95351211710923189369 -0.10489517638396124444 -0.5086759041105851642 -0.6691486780831507053 0.17881665348299766172 0.42589733578646710166 -0.88685945780395181171 0.52892512230683463859 0.3816015779250321871 -0.2042394175897658537];

% Layer 3
b3 = -0.73262000621157863378;
LW3_2 = [0.53699749905968952035 0.8827818992630588335 -0.36947992978105270723 -0.71844276569014287048 0.26989682252425722941 0.85607140505093615168 -1.4254101629477591295 -0.49619024620809532022 0.74297714490473976134 -0.696240491151554175];

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
