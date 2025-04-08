function [Ad, Bd, Cd, Dd, Ed] = discretization(Cf, Cr, m, vx_des, a, b, Iz)
    %% 连续系统系数矩阵
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
    
    C = [0 0 0 0];
    D = 0;
    sys=ss(A, B, C, D);

    %% 离散系统系数矩阵
    Ts=0.1;
    sys_d=c2d(sys, Ts);

    Ad=sys_d.A;
    Bd=sys_d.B;
    Cd=sys_d.C;
    Dd=sys_d.D;
    Ed=[0; -Ts*(Cf+Cr)/(m*vx_des)-vx_des*Ts; 0; -Ts*(Cf*a^2+Cr*b^2)/(Iz*vx_des)];
end
