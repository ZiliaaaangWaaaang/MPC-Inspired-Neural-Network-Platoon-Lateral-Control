function y = platoon_fsv(x, u)
    m = 18000;
    b = 1.5;
    a = 3.5;
    Iz = 1304218;
    Re = 0.51;
    Cf = 100000; % N·rad-1
    Cr = 100000;
    h = 0.8;
    tau = 1.0;
    Jf = 24;
    Jr = 48;

    vx_des = 20;
    L = 10; % 预瞄距离
    phi_des=0;

    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    x4 = x(4);
    u1 = u(1);

    y = zeros(2, 1);
    y(1) = x2;
    y(2) = x4;
end