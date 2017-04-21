matlab symbolic calculus
 DECLARATION:
	syms f(x, y)
	or
	syms x y   ;  f(x, y) = x^3*y^3

usage:

	f(y + 1, y)

MATRICES:
	syms a b c
	A = [a b c; c a b; b c a]

	examples:
	1.1) sum(A(1,:))
	1.2) isAlways(sum(A(1,:)) == sum(A(:,2)))

	creation:
	1.3) A = sym('A', [2 4])
	1.4) A = sym('A%d%d', [2 4])
	1.5) A = hilb(3) ;  A = sym(A)

calculus:

DERIVATIVES: 
	
	derivative plain
	2.1) 	syms x
		f = sin(x)^2;
		diff(f)

	partial derivative
	2.2)	syms x y
		f = sin(x)^2 + cos(y)^2;
		diff(f)

	2.3)  syms x y
		f = sin(x)^2 + cos(y)^2;
		diff(f, y)

	'second order' partial derivatives
	2.4)	syms x y
		f = sin(x)^2 + cos(y)^2;	
		diff(f, y, 2)

	mixed case:
	2.5)	syms x y
		f = sin(x)^2 + cos(y)^2;
		diff(diff(f, y), x)

	'determine the default var of differentiation'
	2.6)	symvar(f, 1)
	
	elem by elem 'diff' of a matrix:
	2.7)	syms a x
A = [cos(a*x),sin(a*x);-sin(a*x),cos(a*x)]
		diff(A)

	'jacobian' computation:
	2.8)	syms r l f
		x = r*cos(l)*cos(f);
		y = r*cos(l)*sin(f);
		z = r*sin(l);
		J = jacobian([x; y; z], [r l f])
		detJ = simplify(det(J)) 'determinant'


INTEGRALS:

	indefinite:
	3.1) 	syms x
		f = sin(x)^2;
		int(f)

	indefinite with multivariables:
	3.2)	syms x y n
		f = x^n + y^n;
		int(f)

	partial by variable:
	3.3)	syms x y n
		f = x^n + y^n;
		int(f, y)

	definite:
	3.4) 	syms x y n
		f = x^n + y^n;
		int(f, 1, 10)

EQUATIONS:
	
	solving plain:
	4.1)	syms x
		solve(x^3 - 6*x^2 == 6 - 11*x)
		'If you do not specify the right
		 side of the equation,
		 solve assumes that it is zero'

	solving wtr. perticular variable:
	4.2)  	syms x y
solve(6*x^2 - 6*x^2*y + x*y^2 - x*y + y^3 - y^2 == 0, y)
	
	'parse' results:
	4.3)	syms x y z
[x, y, z] = solve(z == 4*x, x == y, z == x^2 + y^2)
	
	'simplify' terms:
	4.4)	phi = (1 + sqrt(sym(5)))/2;
		f = phi^2 - phi - 1
		simplify(f)

	'standard polynomial form with all the
	 parentheses multiplied out and all the
	  similar terms summed up':
	4.6) 	syms x
f = (x ^2- 1)*(x^4 + x^3 + x^2 + x + 1)*(x^4 - x^3 + x^2 - x + 1);
expand(f)
	
	'The factor simplification 
	function shows the polynomial roots':
	4.7) 	syms x
		g = x^3 + 6*x^2 + 11*x + 6;
		factor(g)

	nested representation:
	4.8)	syms x
		h = x^5 + x^4 + x^3 + x^2 + x;
		horner(h)

SUBSTITUTIONS:
	
	from sym_var to number:
	5.1)	syms x y
		f = x^2*y + 5*x*sqrt(y);
		subs(f, x, 3)

	from sym_var to sym_var:
	5.2)	subs(f, y, x)

	matrix into polynomial:
		-Element-by-Element Substitution:
		5.3.1)		syms x
				f = x^3 - 15*x^2 - 24*x + 350;
				A = [1 2 3; 4 5 6];
				subs(f,A)
		-Substitution in a Matrix Sense:
		'matrix must be square'
		5.3.2)		syms x
f = x^3 - 15*x^2 - 24*x + 350;
A = magic(3) 'magic 3 by 3 matrix'
b = sym2poly(f) 'row vector containing the numeric
 coefficients of the polynomial f'
polyvalm(b,A) 'same as A^3 - 15*A^2 - 24*A + 350*eye(3)'

	Substitute the Elements of a Symbolic Matrix:
	5.4)	syms a b c
		A = [a b c; c a b; b c a]
		alpha = sym('alpha');
		beta = sym('beta');
		A(2,1) = beta;
		A = subs(A,b,alpha)
		'A =
		[     a, alpha,     c]
		[  beta,     a, alpha]
		[ alpha,     c,     a]'


PLOTTING: 
	
	6.1):	syms x
		f = x^3 - 6*x^2 + 11*x - 6;
		xlabel('x')
		ylabel('y')
		title(texlabel(f))
		grid on
		fplot(f)


	impicit fun:
	6.2)	syms x y
		eqn = (x^2 + y^2)^4 == (x^2 - y^2)^2;
		fimplicit(eqn, [-1 1])


	three_dimensions:
	6.3) 	syms t
		fplot3(t^2*sin(10*t), t^2*cos(10*t), t)

	surfaces:
	6.4)	syms x y
		fsurf(x^2 + y^2)




