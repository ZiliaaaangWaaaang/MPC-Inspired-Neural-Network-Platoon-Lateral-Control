%% 该程序用于绘制仿真结果
clear
close all
set_path platoon
load('results\platoon\results_mpc\following_vehicle_1_mpc.mat')
load('results\platoon\results_mpc\following_vehicle_2_mpc.mat')
load('results\platoon\results_mpc\following_vehicle_3_mpc.mat')

load('results\platoon\results_nn\following_vehicle_1_nn.mat')
load('results\platoon\results_nn\following_vehicle_2_nn.mat')
load('results\platoon\results_nn\following_vehicle_3_nn.mat')

params = set_params();
Ts = params.Ts;
Tmax = params.Tmax;

for t1=size(mpc_1_elapsed,1):Tmax/Ts
    mpc_1_elapsed(t1)=0;
    mpc_1_x(t1,:)=0;
    mpc_1_u(t1)=0;
    mpc_1_t(t1)=mpc_1_t(t1-1)+Ts;

    mpc_2_elapsed(t1)=0;
    mpc_2_x(t1,:)=0;
    mpc_2_u(t1)=0;
    mpc_2_t(t1)=mpc_2_t(t1-1)+Ts;

    mpc_3_elapsed(t1)=0;
    mpc_3_x(t1,:)=0;
    mpc_3_u(t1)=0;
    mpc_3_t(t1)=mpc_3_t(t1-1)+Ts;
end

for t3=size(nn_1_elapsed,1):Tmax/Ts
    nn_1_elapsed(t3)=0;
    nn_1_x(t3,:)=0;
    nn_1_u(t3)=0;
    nn_1_t(t3)=nn_1_t(t3-1)+Ts;

    nn_2_elapsed(t3)=0;
    nn_2_x(t3,:)=0;
    nn_2_u(t3)=0;
    nn_2_t(t3)=nn_2_t(t3-1)+Ts;

    nn_3_elapsed(t3)=0;
    nn_3_x(t3,:)=0;
    nn_3_u(t3)=0;
    nn_3_t(t3)=nn_3_t(t3-1)+Ts;
end

%% 仅横向（x1-x3）算法之间的对比
figure
plot(mpc_1_x(:,1),'LineWidth',2.0)
hold on
plot(nn_1_x(:,1),'-.','LineWidth',2.0)
yline(0, 'k--', 'LineWidth', 2.0)
ylabel('$e_{y,1-2}(m)$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
legend('MPC','MPC-NN','location','northeast')

figure
plot(mpc_1_x(:,3),'LineWidth',2.0)
hold on
plot(nn_1_x(:,3),'-.','LineWidth',2.0)
yline(0, 'k--', 'LineWidth', 2.0)
ylabel('$e^{\psi}_{1-2}(rad)$', 'Interpreter', 'latex', 'FontSize', 16, 'FontWeight', 'bold')
legend('MPC','MPC-NN','location','northeast')

%% 控制输入对比（横向）
tt=0:0.1:99.9;
figure
plot(tt,nn_1_u(:,1),'LineWidth',2.0,'Color',[0 0.4470 0.7410])
hold on
plot(tt,nn_2_u(:,1),'-.','LineWidth',2.0,'Color',[0.8500 0.3250 0.0980])
hold on
plot(tt,nn_3_u(:,1),'--','LineWidth',2.0,'Color',[0.4660 0.6740 0.1880])
grid on
xlabel('t(s)', 'FontSize', 12, 'FontWeight', 'bold')
ylabel('$\delta$(rad)', 'Interpreter', 'latex', 'FontSize', 12, 'FontWeight', 'bold')
legend('MPC','MPC-NN','location','northeast')

%% 计算时间对比
figure
plot(mpc_1_elapsed*1e3,'LineWidth',2.0)
hold on
plot(nn_1_elapsed*1e3,'-.','LineWidth',2.0)
% zp = BaseZoom();
% zp.plot;
ylim([0,3])
ylabel('calculation time(ms)',  'Interpreter', 'latex', 'FontSize', 12, 'FontWeight', 'bold')
legend('MPC','MPC-NN','location','northeast')

%% 车辆编队(1辆领航车，3辆跟随车)
tt=0:0.1:99.9;
figure
plot(tt,nn_1_x(:,1),'LineWidth',2.0,'Color',[0 0.4470 0.7410])
hold on
plot(tt,nn_2_x(:,1),'-.','LineWidth',2.0,'Color',[0.8500 0.3250 0.0980])
hold on
plot(tt,nn_3_x(:,1),'--','LineWidth',2.0,'Color',[0.4660 0.6740 0.1880])
ylim([-0.018 0.018])
grid on
xlabel('t(s)', 'Interpreter', 'latex','FontSize', 12, 'FontWeight', 'bold')
ylabel('$e^y$(m)', 'Interpreter', 'latex', 'FontSize', 12, 'FontWeight', 'bold')
legend('\fontname{宋体}领航车-\fontname{宋体}跟随车\fontname{Times new roman}1','\fontname{宋体}跟随车\fontname{Times new roman}1-\fontname{宋体}跟随车\fontname{Times new roman}2','\fontname{宋体}跟随车\fontname{Times new roman}2-\fontname{宋体}跟随车\fontname{Times new roman}3','location','northeast')

figure
plot(tt,nn_1_x(:,3),'-.','LineWidth',2.0,'Color',[0 0.4470 0.7410])
hold on
plot(tt,nn_2_x(:,3),'LineWidth',2.0,'Color',[0.8500 0.3250 0.0980])
hold on
plot(tt,nn_3_x(:,3),'--','LineWidth',2.0,'Color',[0.4660 0.6740 0.1880])
ylim([-0.008 0.008])
grid on
xlabel('t(s)', 'Interpreter', 'latex','FontSize', 12, 'FontWeight', 'bold')
ylabel('$e^{\psi}$(rad)', 'Interpreter', 'latex', 'FontSize', 12, 'FontWeight', 'bold')
legend('\fontname{宋体}领航车-\fontname{宋体}跟随车\fontname{Times new roman}1','\fontname{宋体}跟随车\fontname{Times new roman}1-\fontname{宋体}跟随车\fontname{Times new roman}2','\fontname{宋体}跟随车\fontname{Times new roman}2-\fontname{宋体}跟随车\fontname{Times new roman}3','location','northeast')

%% 车辆横向位置
% load('driving_condition_2/FYY_Y0_2.mat');
% FYY_Y_2=FYY_Y_2(1:100:65000);
% FYY_Y_2(size(FYY_Y_2,1)-1:1000)=FYY_Y_2(size(FYY_Y_2,1));
% FYY_Y_2_1=FYY_Y_2+nn_1_x(:,1);
% FYY_Y_2_2=FYY_Y_2_1+nn_2_x(:,1);
% FYY_Y_2_3=FYY_Y_2_2+nn_3_x(:,1);
% figure
% plot(tt,FYY_Y_2,'LineWidth',2.0,'Color',[0 0.39216 0])
% hold on
% plot(tt,FYY_Y_2_1,'LineWidth',2.0,'Color',[0.8549 0.64706 0.12549])
% hold on
% plot(tt,FYY_Y_2_2,'LineWidth',2.0,'Color',[0.2549 0.41176 0.88235])
% hold on
% plot(tt,FYY_Y_2_3,'LineWidth',2.0, 'Color', [1 0 0])
% xlabel('time(s)', 'Interpreter', 'latex','FontSize', 12, 'FontWeight', 'bold')
% ylabel('y(m)', 'Interpreter', 'latex', 'FontSize', 12, 'FontWeight', 'bold')
% legend('following vehicle 1','following vehicle 2','following vehicle 3','following vehicle 4','Interpreter', 'latex','location','northeast','FontWeight', 'bold')

%% 车辆航向角
load('driving_condition_2/FYY_YAW_2.mat');
time=YAW0.time(1:100:65000);
YAW0=YAW0.signals.values(1:100:65000);
YAW0=YAW0*3.14/180;
YAW0(size(time,1)-1:1000)=0;
YAW1=YAW0+nn_1_x(:,3);
YAW2=YAW1+nn_2_x(:,3);
YAW3=YAW2+nn_3_x(:,3);
figure
plot(tt,YAW0,'LineWidth',2.0,'Color',[0 0.4470 0.7410])
hold on
plot(tt,YAW1,'LineWidth',2.0,'Color',[0.8500 0.3250 0.0980])
hold on
plot(tt,YAW2,'--','LineWidth',2.0,'Color',[0.4660 0.6740 0.1880])
hold on
plot(tt,YAW3,':','LineWidth',2.0, 'Color', [0.6350 0.0780 0.1840])
ylim([-0.2 0.5])
grid on
xlabel('t(s)', 'Interpreter', 'latex','FontSize', 12, 'FontWeight', 'bold')
ylabel('$\psi$(rad)', 'Interpreter', 'latex', 'FontSize', 12, 'FontWeight', 'bold')
legend('\fontname{宋体}领航车','\fontname{宋体}跟随车\fontname{Times new roman}1','\fontname{宋体}跟随车\fontname{Times new roman}2','\fontname{宋体}跟随车\fontname{Times new roman}3','location','southeast')


%% 车辆行驶路径
% for i=1:65001
%     FYY_X_2(i)=FYY_X_2(i)-64;
% end
% plot(FYY_X_2,FYY_Y_2,'LineWidth',2.0)
% xlim([0 1000])
% xlabel('x(m)', 'Interpreter', 'latex','FontSize', 12, 'FontWeight', 'bold')
% ylabel('y(m)', 'Interpreter', 'latex', 'FontSize', 12, 'FontWeight', 'bold')