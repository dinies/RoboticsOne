function [ res ] = fun_newton(q0, q_sym, J_sym, p_s, p_sym)
	q_curr= q0;
	p_curr= subs(p_sym, q_sym, q_curr);
    q_succ= q0;

	while ((norm(p_s-p_curr))/norm(p_s)) > 0.1
			p_curr= subs(p_sym, q_sym, q_curr);
			J=subs(J_sym, q_sym, q_curr);
			J_inv= pinv(J);
			q_succ= q_curr + J_inv*(p_s - p_curr);
	end
	res= q_succ;
end