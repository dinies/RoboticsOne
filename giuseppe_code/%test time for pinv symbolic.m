%test time for pinv symbolic
clear all 
clc
format long

syms q1 q2 q3 q4 real

p =[cos(q1)+cos(q1+q2)+cos(q1+q2+q3)+cos(q1+q2+q3+q4);
    sin(q1)+sin(q1+q2)+sin(q1+q2+q3)+sin(q1+q2+q3+q4)];

q=[q1 q2 q3 q4]';

J=jacobian(p,q);
J_T = J';
J_PS = pinv(J);

%Initial configuration
disp('---Initial configuration---')