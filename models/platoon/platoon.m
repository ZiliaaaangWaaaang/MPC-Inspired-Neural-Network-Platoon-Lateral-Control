function dxdt = platoon(t, x, u, dot_YAW0)
    m = 18000;
    b = 1.5;
    a = 3.5;
    Iz = 130235.8; %kg·m2
    Cf = 271127.22; % N·rad-1
    Cr = 533145.17;

    phi_des=dot_YAW0;
    vx_des=80/3.6;

    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    x4 = x(4);
    u1 = u(1);

    dxdt = zeros(4, 1);
    dxdt(1) = x2;
    dxdt(2) = -(Cf+Cr)*x2/(m*vx_des)+(Cf+Cr)*x3/m-(Cf*a-Cr*b)*x4/(m*vx_des)+Cf*u1/m-((Cf+Cr)/(m*vx_des)+vx_des)*phi_des;
    dxdt(3) = x4;
    dxdt(4) = -(Cf*a-Cr*b)*x2/(Iz*vx_des)+(Cf*a-Cr*b)*x3/Iz-(Cf*a^2+Cr*b^2)*x4/(Iz*vx_des)+Cf*a*u1/Iz-(Cf*a^2+Cr*b^2)*phi_des/(Iz*vx_des);
%     [Ad, Bd, Cd, Dd, Ed] = discretization(Cf, Cr, m, vx_des, a, b, Iz);
%     dxdt=Ad*x+Bd*u+Ed*dot_YAW0;
end