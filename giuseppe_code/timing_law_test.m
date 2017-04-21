%%Giuseppe L'Erario - 4-R arm robot

clear all
clc
format long



%PARAMETERS

%Initial configuration
q0=[pi/2 pi/2 -pi/2 -pi/2]'
%Final Position
p_d=[2 1]'

V_max = 1;
a_max = 2;
interv = 100;

syms q1 q2 q3 q4 real
q_sym=[q1 q2 q3 q4]';

p_sym =[cos(q1)+cos(q1+q2)+cos(q1+q2+q3)+cos(q1+q2+q3+q4);
    sin(q1)+sin(q1+q2)+sin(q1+q2+q3)+sin(q1+q2+q3+q4)];

p0=subs(p_sym, q_sym, q0);

%Path-length
L = norm(p_d-p0);

%TRAJECTORY Bang-coast-bang
t = 0;
%Vector of desired positions
s = zeros(interv,1);
%POSITIVE SIGNS IN THE THREE EXPRESSION OF THE TIMING LAW (- EXPECTED)
%trapezoidal profile check
if L >(V_max^2/a_max)
    T_s = V_max/a_max;
    T_tot = (L*a_max+V_max^2)/(a_max*V_max);
    dt = (T_tot/interv);

    for	i = 1:interv
        if t <= T_s
            s = [, 0.5*a_max*t^2];
            t= t+dt;

        elseif (t > T_s) &&  (t <= (T_tot - T_s))
            s = [s, (V_max*t) - (V_max^2/2*a_max) ];   %0.5*a_max*T_s^2 + V_max*(t-T_s)]
            t = t+dt;

        else (t > (T_tot - T_s)) && (t < T_tot)
            s = [s, (((-1)*a_max*(t-T_tot)^2)/2) + V_max*T_tot - V_max^2/a_max ]; %0.5*a_max*T_s^2 + V_max*(T_tot - T_s) + 0.5*a_max*(t-T_tot+T_s)^2
            t = t+dt;
        end
    end
else
    T_tot = 2*(sqrt(L/a_max));
    dt = T_tot/interv;
    for 	i= 1:interv

        if t <= T_tot/2
            s = [s, 0.5*a_max*t^2];
            t = t+dt;
        else (t > T_tot/2) &&  (t <= T_tot)
            s = [s, 0.5*a_max*(T_max/2)^2 + 0.5*a_max*(t-T_tot/2)^2];
            t = t+dt;
        end
    end
end

s
L
