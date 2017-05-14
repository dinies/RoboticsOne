function R=Euler(a,b,c)

theta = sym('theta');
psi = sym('psi');
phi = sym('phi');
zero = sym('0');
one = sym('1');

First=ElementaryRotationMatrix(theta,a);
Second=ElementaryRotationMatrix(psi,b);
Third=ElementaryRotationMatrix(phi,c);

fprintf('Theta is the first rotation angle,psi the second and phi the last\n\n')


%DECOMMENT IF YOU A HAVE A POWERFULL MACHINE

R = First*Second*Third;

return 


