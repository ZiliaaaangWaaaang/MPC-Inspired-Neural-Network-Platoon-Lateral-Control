function params = set_params()
    %% System params
    params.ode = @platoon_ode;
    params.jac = @platoon_jac;
    %% Simulation params
    params.Ts = 0.1;
    params.Tmax = 100; % 决定NN_data数目
    params.tolerance = 5e-2;
    params.limit = 25; % 判断是否发散
    params.x0 = [0; 0; 0; 0];
    %% MPC params
    params.Hp = 8; % 预测时域
    params.Hc = 8; % 控制时域
    params.Nx = 4;
    params.Nu = 1;
    params.u1max = 0.8;
    params.u1min = -0.8;
    params.x_eq = zeros(params.Nx, 1); % 平衡点
    fp = @(u) platoon_fsv(params.x_eq, u);
    u_guess = zeros(params.Nu, 1);
    params.u_eq = fsolve(fp, u_guess, ...
        optimset('Display', 'off', 'Algorithm', 'levenberg-marquardt'));
    [A, B] = params.jac(params.x_eq, params.u_eq);
    params.A = A;
    params.B = B;
    params.Q = [20, 20, 20, 20];
    params.R = 10;
    params.xmin = [-0.7,-0.7,-0.7,-0.7];
    params.xmax = [0.7,0.7,0.7,0.7];
    params.umin = -0.8;
    params.umax = 0.8;
    params.xmin = params.xmin - params.x_eq';
    params.xmax = params.xmax - params.x_eq';
    params.umin = params.umin - params.u_eq';
    params.umax = params.umax - params.u_eq';
    %% NN params
    params.nnrange = [0.7,0.7,0.7,0.7];
    params.nnarch = [10, 10]; % 隐含层及各层神经元个数
    params.maxepoch = 50;
    params.ls = 200; % 决定nn迭代次数
end
