function [t_sol, x_sol, u_sol, elapsed, success] = ...
        run_mpc(x0, params)
    load('mpc', 'mpc_obj', 'x_mpc');
    Ts = mpc_obj.MPC.Ts;
    
    Tmax = params.Tmax;
    t_sol = zeros(Tmax/Ts+1 - params.Hp, 1);
    x_sol = zeros(Tmax/Ts+1 - params.Hp, params.Nx);
    u_sol = zeros(Tmax/Ts - params.Hp, params.Nu);
    elapsed = zeros(Tmax/Ts+1 - params.Hp, 1);  % 计算时间
    i_sol = 1;
    t_sim = 0;
    x_sim = x0;
    ref = zeros(2*params.Nx, 1);
    % Run a dummy mpcmove to load the MPC object into memory
    mpcmove(mpc_obj, x_mpc, [], ref, []);
    while i_sol < Tmax / Ts - params.Hp && ...
            norm(x_sim, 2) > params.tolerance
        t_sol(i_sol) = t_sim;
        x_sol(i_sol, :) = x_sim;
        x_mpc.Plant = x_sim;
        
        tic;
        u = mpcmove(mpc_obj, x_mpc, [], ref, []) + params.u_eq;
        elapsed(i_sol) = toc;

        u_sol(i_sol, :) = u;

        [~, x] = ode45(@(t, y) params.ode(t, y, u), [0, Ts], x_sim); % 常微分方程求解
        t_sim = t_sim + Ts;
        x_sim = x(end, :)';
        i_sol = i_sol + 1;
        
        if norm(x_sim, 2) > params.limit
            fprintf('System diverged. Abort at %.2f.\n', norm(x_sim, 2)); % 系统发散，终止于...
            break
        end
    end
    t_sol(i_sol) = t_sim;
    x_sol(i_sol, :) = x_sim;
    success = i_sol <= Tmax / Ts - params.Hp;
%     disp(i_sol);
%     disp('success1=');
%     disp(success);
    success = success && norm(x_sim, 2) <= params.tolerance;
%     disp('norm(x_sim, 2)=');
%     disp(norm(x_sim, 2));
%     disp('success2=');
%     disp(success);
    
    t_sol = t_sol(1:i_sol, :);
    x_sol = x_sol(1:i_sol, :);
    u_sol = u_sol(1:i_sol-1, :);
    elapsed = elapsed(1:i_sol-1, :); %计算时间
end
