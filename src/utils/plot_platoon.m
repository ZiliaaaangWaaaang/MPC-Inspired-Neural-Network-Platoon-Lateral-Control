function [] = plot_platoon( ...
        elapsed_mpc, elapsed_nn, elapsed_mampc, ...
        t_sol, x_sol, u_sol, utype_sol, params, index)
    figure
%     set(gcf, 'position', [100, 100, 800, 200]);
%     ax1 = axes('Position', [0.08, 0.175, 0.32, 0.7]);
%     axes(ax1);
    box on;
    hold on;
    for i = 1:length(t_sol)-1
        [t, x] = ode45(@(t, y) params.ode(t, y, u_sol(i, :)), ...
                       [0, params.Ts], x_sol(i, :));
        plot(t_sol(i) + t, x(:, 1), 'b', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 2), 'r', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 3), 'm', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
        plot(t_sol(i) + t, x(:, 4), 'g', 'LineWidth', 2, ...
             'HandleVisibility', 'off');
%         plot(t_sol(i) + t, x(:, 5), 'k', 'LineWidth', 2, ...
%              'HandleVisibility', 'off'); % 关闭对象句柄
    end

    plot(t_sol, x_sol(:, 1), 'b', 'LineWidth', 3, 'HandleVisibility', 'off');
    plot(nan, nan, 'b-', 'LineWidth', 3, 'DisplayName', '$x1$');
    plot(t_sol, x_sol(:, 2), 'r', 'LineWidth', 3, 'HandleVisibility', 'off');
    plot(nan, nan, 'r-', 'LineWidth', 3, 'DisplayName', '$x2$');
    plot(t_sol, x_sol(:, 3), 'm', 'LineWidth', 3, 'HandleVisibility', 'off');
    plot(nan, nan, 'm-', 'LineWidth', 3, 'DisplayName', '$x3$');
    plot(t_sol, x_sol(:, 4), 'g', 'LineWidth', 3, 'HandleVisibility', 'off');
    plot(nan, nan, 'g-', 'LineWidth', 3, 'DisplayName', '$x4$');
%     plot(t_sol, x_sol(:, 5), 'k', 'LineWidth', 3, 'HandleVisibility', 'off');
%     plot(nan, nan, 'k-', 'LineWidth', 3, 'DisplayName', '$x5$');
    yline(0, 'k:', 'LineWidth', 3, 'HandleVisibility', 'off');
    hold off;
    xlabel('Time (s)');
    ylabel('States');
    legend('Location', 'eastoutside', 'Box', 'off', 'Interpreter', 'latex');

%     ax2 = axes('Position', [0.525, 0.175, 0.46, 0.7]);
%     axes(ax2);
    mpc_indices = find(utype_sol == 'mpc');
    dilute_indices = 1:2:length(mpc_indices);
    if dilute_indices(end) ~= length(mpc_indices)
        dilute_indices(end + 1) = length(mpc_indices);
    end
    mpc_indices = mpc_indices(dilute_indices);
    nn_indices = find(utype_sol == 'nn');
    disp(nn_indices);
    lqr_indices = find(utype_sol == 'lqr');
%     disp(lqr_indices);
    dilute_indices = 1:2:length(lqr_indices);
    if dilute_indices(end) ~= length(lqr_indices)
        dilute_indices(end + 1) = length(lqr_indices);
    end
    lqr_indices = lqr_indices(dilute_indices);
%     set(gca, 'FontSize', 16);
%     set(gca, 'linewidth', 2);
    
    figure
    box on;
    hold on;
    plot(t_sol(mpc_indices), elapsed_mampc(mpc_indices), 'rs', ...
        'MarkerSize', 4, 'LineWidth', 1, 'HandleVisibility', 'off');
    plot(nan, nan, 'rs-', 'MarkerSize', 4, 'LineWidth', 1, ...
         'DisplayName', 'MAMPC-MPC');
    plot(t_sol(nn_indices), elapsed_mampc(nn_indices), 'r^', ...
        'MarkerSize', 4, 'LineWidth', 1, 'HandleVisibility', 'off');
    plot(nan, nan, 'r^-', 'MarkerSize', 4, 'LineWidth', 1, ...
         'DisplayName', 'MAMPC-NN');
    plot(t_sol(lqr_indices), elapsed_mampc(lqr_indices), 'rp', ...
        'MarkerSize', 4, 'LineWidth', 1, 'HandleVisibility', 'off');
    plot(nan, nan, 'rp-', 'MarkerSize', 4, 'LineWidth', 1, ...
         'DisplayName', 'MAMPC-LQR');
    yline(elapsed_mpc, 'k--', 'LineWidth', 2, 'DisplayName', 'Imp. MPC');
    yline(elapsed_nn, 'k:', 'LineWidth', 2, 'DisplayName', 'NN');
    plot(t_sol(1:end-1), elapsed_mampc(1:end), 'r', ...
        'LineWidth', 2, 'HandleVisibility', 'off');
    hold off;
    set(gca, 'YScale', 'log');
    xlabel('Time (s)');
    ylabel('Running Time (s)');
    legend('Location', 'eastoutside', 'Box', 'off');

    export_csv(t_sol(1:end-1), elapsed_mampc, ...
        sprintf('results/platoon/platoon_elapsed_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 1), ...
        sprintf('results/platoon/platoon_state0_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 2), ...
        sprintf('results/platoon/platoon_state1_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 3), ...
        sprintf('results/platoon/platoon_state2_%d.csv', params.ls * index));
    export_csv(t_sol, x_sol(:, 4), ...
        sprintf('results/platoon/platoon_state3_%d.csv', params.ls * index));
%     export_csv(t_sol, x_sol(:, 5), ...
%         sprintf('results/platoon/platoon_state4_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol(:, 1), ...
        sprintf('results/platoon/platoon_input0_%d.csv', params.ls * index));
    export_csv(t_sol(1:end-1), u_sol(:, 2), ...
        sprintf('results/platoon/platoon_input1_%d.csv', params.ls * index));
end