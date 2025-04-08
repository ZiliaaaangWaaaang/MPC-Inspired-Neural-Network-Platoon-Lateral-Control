function [] = gen_nn(params, data_path)
    load('nndata', 'X', 'U');
    X = X';
    U = U';
    net = feedforwardnet(params.nnarch); % 前馈神经网络
    net = configure(net, X, U); % 配置NN输入及输出
    net = init(net); % 初始化
    nnmove_path = sprintf('%s/nnmove_%02d', data_path, 0);
    genFunction(net, nnmove_path); % 通过Neural Network自动生成NN仿真函数保存在nnmove_0中
    nn_path = sprintf('%s/nn_%02d', data_path, 0);
    save(nn_path, 'net'); % nn_0用于存储神经网络
    clear net;
    indices = params.ls:params.ls:length(X); % ls,2*ls,3*ls...
    iter_num = 1;
    for index = indices
        X_train = X(:, 1:index);
        U_train = U(:, 1:index);
        net = feedforwardnet(params.nnarch);
        net = configure(net, X_train, U_train);
        net = train(net, X_train, U_train);
        nnmove_path = sprintf('%s/nnmove_%02d', data_path, iter_num);
        genFunction(net, nnmove_path);
        nn_path = sprintf('%s/nn_%02d', data_path, iter_num);
        save(nn_path, 'net');
        clear net;
        iter_num = iter_num + 1;
    end
end
