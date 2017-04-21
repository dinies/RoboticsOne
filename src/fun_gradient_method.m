function [ res ] = fun_gradient_method(q0, q_sym, J_T_sym, p_s, p_sym, alpha)
	q_curr= q0;
	q_succ= q0;
	p_curr= subs(p_sym, q_sym, q_curr);

	while ((norm(p_s-p_curr))/norm(p_s)) > 0.8
			p_curr= subs(p_sym, q_sym, q_curr);
			J_T=subs(J_T_sym, q_sym, q_curr);
			q_succ= q_curr + ( alpha * J_T*(p_s - p_curr));
	end
	res= q_succ;
end
