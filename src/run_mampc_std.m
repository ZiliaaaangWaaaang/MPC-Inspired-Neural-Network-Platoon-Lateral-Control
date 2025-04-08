function [t_sol, x_sol, u_sol, utype_sol, elapsed, success] = ...
        run_mampc_std(x0, nnmove, params) % mampc控制器主程序
    load('mpc', 'mpc_obj', 'x_mpc');
    load('lqr', 'K');
    Ts = mpc_obj.MPC.Ts;
    
    Tmax = params.Tmax;
    t_sol = zeros(Tmax/Ts+1 - params.Hp, 1);
    x_sol = zeros(Tmax/Ts+1 - params.Hp, params.Nx);
    u_sol = zeros(Tmax/Ts - params.Hp, params.Nu);
    utype_sol = strings(Tmax/Ts - params.Hp, 1);
    elapsed = zeros(Tmax/Ts+1 - params.Hp, 1);
    i_sol = 1;
    t_sim = 0;
    x_sim = x0;
    ref = zeros(2*params.Nx, 1);
    % Run a dummy mpcmove to load the MPC object into memory
    mpcmove(mpc_obj, x_mpc, [], ref, []); % 计算MPC控制器的输出（假）
    while i_sol < Tmax / Ts - params.Hp && ...
            norm(x_sim, 2) > params.tolerance
        t_sol(i_sol) = t_sim;
        x_sol(i_sol, :) = x_sim;
        x_mpc.Plant = x_sim;
        
%         disp('norm(x_sim, 2)=');
%         disp(norm(x_sim, 2));
        lqr_switch = norm(x_sim, 2) < params.rlqr;
%         disp('lqr_switch=');
%         disp(lqr_switch);
        tic;
        if lqr_switch
            u = -K*x_sim + params.u_eq; % lqr运算
            utype = 'lqr';
        else
            [unn, nn_switch, ~] = is_converge(...
                x_sim, params.rlqr, params.Hlqr, nnmove, params); % 用NN控制量计算
%             disp('nn_switch=')
%             disp(nn_switch)
            if nn_switch
                u = unn; % NN运算
                utype = 'nn';
            else
                u = mpcmove(mpc_obj, x_mpc, [], ref, []) + params.u_eq; % MPC运算
                utype = 'mpc';
            end
        end
        elapsed(i_sol) = toc; % 总计算时间

        u_sol(i_sol, :) = u;
        utype_sol(i_sol, 1) = utype;

        [~, x] = ode45(@(t, y) params.ode(t, y, u), [0, Ts], x_sim);
        t_sim = t_sim + Ts;
        x_sim = x(end, :)';
        i_sol = i_sol + 1;
        
        if norm(x_sim, 2) > params.limit
            fprintf('System diverged. Abort at %.2f.\n', norm(x_sim, 2));
            break
        end
    end
    t_sol(i_sol) = t_sim;
    x_sol(i_sol, :) = x_sim;
    success = i_sol <= Tmax / Ts - params.Hp;
%     disp('success4=');
%     disp(success);
    success = success && norm(x_sim, 2) <= params.tolerance;
%     disp('success5=');
%     disp(success);
    
    t_sol = t_sol(1:i_sol, :);
    x_sol = x_sol(1:i_sol, :);
    u_sol = u_sol(1:i_sol-1, :);
    utype_sol = utype_sol(1:i_sol-1, :);
    elapsed = elapsed(1:i_sol-1, :);
end
