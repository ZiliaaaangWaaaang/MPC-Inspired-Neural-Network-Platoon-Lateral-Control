function [] = gen_nndata(params, data_path)
    hbar = waitbar(0, 'NN Data Generation'); % 创建图形进度条
    maxepoch = params.maxepoch;
    X = [];
    U = [];
    i = 1;
    for epoch = 1:maxepoch
        x0 = 2 * (rand(1, params.Nx) - 0.5) .* params.nnrange;
        [~, x_sol, u_sol, ~, success] = run_mpc(x0, params); %%
        if success
%         if i<=500
            X = [X; x_sol(1:end-1, :)];
            U = [U; u_sol];
            i = i+1;
        else
            disp(x0); % 输出到命令行
            disp(x_sol);
        end
        waitbar(epoch/maxepoch, hbar); % 图像进度条
    end
    close(hbar);
    nndata_path = sprintf('%s/nndata', data_path);
    save(nndata_path, 'X', 'U');
end
