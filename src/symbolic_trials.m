clear all
clc


syms q1 q2 q3
M= [ cos(q1) , cos(q1+q2) ; sin(q1) , sin(q1+q2)];
%pretty(M)
%expand(M)
%null(M)
%qr(M)
vars = [ q1 , q2 ,q3 ];
valu = [ pi/6 , pi , 0 ];
M_sub= subs(M, vars, valu);




syms l1 l2 l3

H= [ 1 , 0 , 0 ;
     0 , 1 , 0 ;
     l1, l2, l3 ];
pretty(M)

l= [l1 l2 l3];
l_T= l';

[ eval, autov , evec] = svd(M_sub);
pretty(eval)

M_inv= inv(M_sub);
pretty(M_inv)
