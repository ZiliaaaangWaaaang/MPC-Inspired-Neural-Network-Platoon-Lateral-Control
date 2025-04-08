%% 此程序用于绘制样本图
clear
close all
load('data\platoon\nndata.mat');
i=1;
row_X=size(X,1);

% if i<=row_X
% end
% %% 仅横向
% ii=1;
% for i=1:size(X,1)
%     i
%     scatter3(X(i,1),X(i,2),X(i,3),30,'.');
%     grid on;
%     xlabel('$e^y_i$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
%     ylabel('$e^\psi_i$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
%     zlabel('$\dot{e^y_i}$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
%     hold on
%     
% end

figure
scatter3(X(:,1),X(:,2),X(:,3),30,'.');
axis([-0.7 0.7 -1 1 -0.5 0.5]);
hold on
scatter3(X(:,1), X(:,2),-0.5*ones(row_X,1),10,'.','MarkerEdgeColor',[0.75 0.75 0.75],'MarkerFaceColor',[0.75 0.75 0.75]);
scatter3(X(:,1), ones(row_X,1),X(:,3),10,'.','MarkerEdgeColor',[0.75 0.75 0.75],'MarkerFaceColor',[0.75 0.75 0.75]);
scatter3(0.7*ones(row_X,1), X(:,2),X(:,3),10,'.','MarkerEdgeColor',[0.75 0.75 0.75],'MarkerFaceColor',[0.75 0.75 0.75]);
xlabel('$e^y_i$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
ylabel('$e^\psi_i$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
zlabel('$\dot{e^y_i}$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')

% figure
% scatter3(X(:,1),X(:,2),X(:,3),30,'.');
% view(0,0);
% xlim([-0.7,0.7]); ylim([-0.7,0.7]); zlim([-0.7,0.7]); 
% xlabel('$e^y_i$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
% ylabel('$e^\psi_i$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
% zlabel('$\dot{e^y_i}$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
% 
% figure
% scatter3(X(:,1),X(:,2),X(:,3),30,'.');
% view(90,0);
% xlim([-0.7,0.7]); ylim([-0.7,0.7]); zlim([-0.7,0.7]); 
% xlabel('$e^y_i$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
% ylabel('$e^\psi_i$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
% zlabel('$\dot{e^y_i}$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
