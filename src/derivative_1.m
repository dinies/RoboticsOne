clear all
clc

syms x l;
fun= tan(x);
symvar(fun,1)
f=diff(fun);
xlabel('x')
ylabel('y')
title(texlabel(f))
grid on
fplot(f)

figure
g= 1/(cos(l)^2);
xlabel('w')
ylabel('z')
title(texlabel(g))
grid on
fplot(g)

F= [ simplify(f), expand(f) , horner(f) ];
G= [ simplify(g), expand(g) , horner(g) ];
