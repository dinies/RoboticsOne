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
interv = 25;

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
s = zeroes(interv,1);
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

%inverse kinematic computation
%PSEUDOCODE
% given an array of desired positions linked with time --> I need to find the right q
q_current= q0;
i = 1;
q_f = [;];
for S=1:(length(s))
    
    
    J_sym=jacobian(p_sym,q_sym);
    J_T = J_sym';
    
    
    J_PS = pinv(J);
    
    p_s = p0 + (p_d-p0)/L*s(i);
    q_g = gradient_method(q0, q, J_T, p_s, p, 0.5);
    q_f(:,i) = newton(q_g, q, J_PS, p_s, p);
    i = i+1;
    disp('---iterazione---')
    disp(S);
end

% for s=double(linspace(0,norm(p_d-p0), 10))
%     p_s=p0+(p_d-p0)*s/norm(p_d-p0);
%     q_g = gradient_method(q0, q, J_T, p_s, p, 0.5);
%     q_f(:,i) = newton(q_g, q, J_PS, p_s, p);
%     i=i+1;
% end

%Desired trajectory of E-E
figure(1)
axis square
axis equal
axis([-3 3 -3 3])
grid on
line([p0(1), p_d(1)], [p0(2), p_d(2)], 'Color', 'red', 'LineStyle', '-.', 'LineWidth', 2); hold on;
p_b = plot(0,0,'.', 'Color', 'black');
time = [1:length(q_f(1,:))];
for i = time
    joint1=[cos(q_f(1,i));
        sin(q_f(1,i))];
    joint2=[cos(q_f(1,i))+ cos(q_f(1,i)+q_f(2,i));
        sin(q_f(1,i))+ sin(q_f(1,i)+q_f(2,i))];
    joint3=[cos(q_f(1,i))+ cos(q_f(1,i)+q_f(2,i))+ cos(q_f(1,i)+q_f(2,i)+q_f(3,i));
        sin(q_f(1,i))+ sin(q_f(1,i)+q_f(2,i))+ sin(q_f(1,i)+q_f(2,i)+q_f(3,i))];
    joint4=[cos(q_f(1,i))+ cos(q_f(1,i)+q_f(2,i))+ cos(q_f(1,i)+q_f(2,i)+q_f(3,i))+ cos(q_f(1,i)+q_f(2,i)+q_f(3,i)+q_f(4,i));
        sin(q_f(1,i))+ sin(q_f(1,i)+q_f(2,i))+ sin(q_f(1,i)+q_f(2,i)+q_f(3,i))+ sin(q_f(1,i)+q_f(2,i)+q_f(3,i)+q_f(4,i))];
    
    % Plot
    figure(1)
    l1 = line([0,joint1(1)], [0, joint1(2)], 'LineWidth', 2); hold on;
    l2 = line([joint1(1), joint2(1)],[joint1(2), joint2(2)], 'LineWidth', 2);
    l3 = line([joint2(1), joint3(1)],[joint2(2), joint3(2)], 'LineWidth', 2);
    l4 = line([joint3(1), joint4(1)],[joint3(2), joint4(2)], 'LineWidth', 2);
    p1 = plot(joint1(1), joint1(2), 'o', 'Color', 'red');
    p2 = plot(joint2(1), joint2(2), 'o', 'Color', 'red');
    p3 = plot(joint3(1), joint3(2), 'o', 'Color', 'red');
    p4 = plot(joint4(1), joint4(2), '>', 'Color', 'black');
    pause(0.5)
    if i ~= length(q_f(1,:))
        delete(l1), delete(l2), delete(l3), delete(l4), delete(p1), delete(p2), delete(p3), delete(p4)
    end
end