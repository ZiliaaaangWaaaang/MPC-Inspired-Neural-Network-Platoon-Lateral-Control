clear;

syms m b a Iz Re Cf Cr h tau vx_des L phi_des a1_des
syms x1 x2 x3 x4
syms u1;

A = jacobian([x1, x2, x3, x4], ...
             [x1, x2, x3, x4]);
B = jacobian([x1, x2, x3, x4], ...
             u1);