clear
    m = 1500;
    b = 1.4;
    a = 1.4;
    Iz = 3000;
    Re = 0.3;
    Cf = 1.0;
    Cr = 1.0;
    h = 0.8;
    tau = 1.0;
%     Jf = 24;
%     Jr = 48;
%     kf=0.15;
%     kr=0.15;
%     alpha_f=0.0436;
%     alpha_r=0.0436;
%     Fxf=2574.8*sin(1.56*atan(11.275*kf-0.4109*(11.275*kf-atan(11.275*kf))));
%     Fyf=1749.6*sin(1.56*atan(11.275*alpha_f-0.4108*(11.275*alpha_f-atan(11.275*alpha_f))));
%     Fxr=1749.6*sin(1.56*atan(18.631*kf-0.4108*(18.631*kf-atan(18.631*kf))));
%     Fyr=1749.7*sin(1.56*atan(18.631*alpha_r+1.7908*(18.631*alpha_r-atan(18.631*alpha_r))));
%     if Fxr>Fxf
%         Fxf=Fxr;
%     end
%     if Fxr<Fxf
%         Fxr=Fxf;
%     end
%     if Fyr<Fyf
%         Fyr=Fyf;
%     end
%     if Fyr>Fyf
%         Fyf=Fyr;
%     end

    vx_des = 21;
    L = vx_des*0.99;
    phi_des = 0;
    a1_des = 0;

    A = zeros(5, 5);
    A(1, :) = [0 1 -h 0 0];
    A(2, :) = [0 0 -1 0 0];
    A(3, :) = [0 0 -1/tau 0 0];
    %A(4, :) = [0 0 0 -(Cf+Cr)/(vx_des*m) -(Cf*a-Cr*b)/(vx_des*m)-vx_des 0 0];
    A(4, :) = [0 0 0 -(Cf*a^2+Cr*b^2)/(Iz*vx_des) 0];
    A(5, :) = [0 -phi_des 0 vx_des-L 0];
%     A(6, :) = [0 0 0 -L vx_des 0];

    B = zeros(5, 2);
    B(1, :) = [0 0];
    B(2, :) = [0 0];
    B(3, :) = [1/tau 0];
%     B(4, :) = [0 Cf];
    B(4, :) = [0 a*Cf];
    B(5, :) = [0 0];
% M=[B,A*B,A^2*B,A^3*B,A^4*B,A^5*B,A^6*B,A^7*B]; % 判断可控
Q = [3, 3, 1, 1, 3];
R = [1, 1];
Q = diag(Q);
R = diag(R);
Ts= 0.1;
[K, P, e]=lqrd(A, B, Q, R, Ts);
% [~, Qf, ~] = lqrd(A, B, Q, R, Ts);
% L = chol(P);
