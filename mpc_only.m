function [] = mpc_only(model)
    clc; restoredefaultpath;    
    set_path(model);
    params = set_params();

    load('mpc', 'mpc_obj', 'x_mpc');
    Ts = params.Ts;
    Tmax = params.Tmax;
    Hp = params.Hp;

    load('driving_condition_2/FYY_YAW_2.mat');
    time=YAW0.time(1:100:65000);
    YAW0=YAW0.signals.values(1:100:65000);
    YAW0=YAW0*3.14/180;
    YAW0(size(time,1)-1:1000)=0;
    
    for i=1:3 % 代表第1-3辆跟随车
        YAW=zeros(1000,1);
        for ii=1:1000
            YAW(ii+16*i)=YAW0(ii);
        end % 第i辆跟随车理想航向角
        for jj=2:1001
            dot_YAW(jj-1)=YAW(jj)-YAW(jj-1);
        end % 理想情况下各车的横摆角速度

        if i >= 2
            filename = sprintf('results/platoon/results_nn/following_vehicle_%d_nn.mat', i-1);
            loaded_data = load(filename);
            x_data = loaded_data.(['nn_', num2str(i-1), '_x']);
            YAW=zeros(1000,1);
            for ii=1:1000
                YAW(ii+16*i)=YAW0(ii);
            end % 第i辆跟随车理想航向角
            for ii=1:size(x_data,1)
                YAW(ii)=YAW(ii)+x_data(ii,3); % 第i辆跟随车实际航向角
            end
            for jj=2:1001
                dot_YAW(jj-1)=YAW(jj)-YAW(jj-1);
            end 
        end
        t_sol = zeros(Tmax/Ts+1 - params.Hp, 1);
        x_sol = zeros(Tmax/Ts+1 - params.Hp, params.Nx);
        u_sol = zeros(Tmax/Ts - params.Hp, params.Nu);
        elapsed = zeros(Tmax/Ts+1 - params.Hp, 1);  % 计算时间
        i_sol = 1;
        t_sim = 0;
        x_sim = params.x0;
        ref = zeros(2*params.Nx, 1);
        % Run a dummy mpcmove to load the MPC object into memory
        mpcmove(mpc_obj, x_mpc, [], ref, []);
        while i_sol < Tmax / Ts - params.Hp
            tic;
            t_sol(i_sol) = t_sim;
            x_sol(i_sol, :) = x_sim;
            x_mpc.Plant = x_sim;
            
            [u,info] = mpcmove(mpc_obj, x_mpc, [], ref, []);
            info
            elapsed(i_sol) = toc;
            
            u_sol(i_sol, :) = u;
            
            [~, x] = ode45(@(t, y) params.ode(t, y, u, dot_YAW(i_sol)), [0, Ts], x_sim);
            t_sim = t_sim + Ts;
            x_sim = x(end, :)';
            x_pred = x_sim;
            for i_pred = i_sol + 1 : i_sol + Hp
                [~, X_pred] = ode45(@(t, y) params.ode(t, y, u, dot_YAW(i_pred)), [0, Ts], x_pred);
                x_pred = X_pred(end, :)';
                x_mpc.Plant = x_pred;
                u = mpcmove(mpc_obj, x_mpc, [], ref, []) + params.u_eq;
            end % 控制序列
            i_sol = i_sol + 1;
        end
        t_sol(i_sol) = t_sim;
        x_sol(i_sol, :) = x_sim;
        disp('norm(x_sim,2)=');
        disp(norm(x_sim,2));
        success = i_sol <= Tmax / Ts - params.Hp;
        success = success && norm(x_sim, 2) <= params.tolerance;
        if success
            disp(['mpc_',num2str(i), ' finished.']);
        else
            disp(['mpc_',num2str(i), ' failed.']);
        end
    
        %% 变量存储
        % 为每个变量创建结构体
        data_struct = struct();
        data_struct.(['mpc_', num2str(i), '_t']) = t_sol(1:i_sol, :);
        data_struct.(['mpc_', num2str(i), '_x']) = x_sol(1:i_sol, :);
        data_struct.(['mpc_', num2str(i), '_u']) = u_sol(1:i_sol-1, :);
        data_struct.(['mpc_', num2str(i), '_elapsed']) = elapsed(1:i_sol-1, :);
        
        % 保存数据到单独的 MAT 文件中，指定变量名前缀
        save(sprintf('results/%s/results_mpc/following_vehicle_%d_mpc.mat', model, i), ...
            '-struct', 'data_struct');
    end
end
