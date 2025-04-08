function [A, B] = platoon_jac(x, u)
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

    A = zeros(4, 4);
    A(1, :) = [0 1 0 0];
    A(2, :) = [0 -(Cf+Cr)/(m*vx_des) (Cf+Cr)/m -(Cf*a-Cr*b)/(m*vx_des)];
    A(3, :) = [0 0 0 1];
    A(4, :) = [0 -(Cf*a-Cr*b)/(Iz*vx_des) (Cf*a-Cr*b)/Iz -(Cf*a^2+Cr*b^2)/(Iz*vx_des)];

    B = zeros(4, 1);
    B(1, :) = 0;
    B(2, :) = Cf/m;
    B(3, :) = 0;
    B(4, :) = Cf*a/Iz;
end

