
%% if you have any questione about this, ask me via mail: gio.corvini@hotmail.it 

%%INVERSE KINEMATICS FOR 2R
% we should put your value of l1,l2,px and py
 l1= 1 ;
 l2= 0.5 ;
 px= 0.4;
 py= 1.2;
 c2= (px^2 + py^2 -l1^2 -l2^2)/(2*l1*l2);
 s2A= sqrt(1-(c2^2));
 c1A= ((px*(l1+l2*c2)+ (py*l2*s2A))/(l1^2+l2^2+(2*l1*l2)));
 s1A= ((py*(l1+l2*c2)- (px*l2*s2A))/(l1^2+l2^2+(2*l1*l2)));
 q1AI= atan2(s1A,c1A)
 q2AI= atan2 (s2A,c2)
 
 s2B= -(sqrt(1-(c2^2)));
 c1B=((px*(l1+l2*c2)+ (py*l2*s2B))/(l1^2+l2^2+(2*l1*l2)));
 s1B=((py*(l1+l2*c2)- (px*l2*s2B))/(l1^2+l2^2+(2*l1*l2)));
 q1B= atan2d(s1B,c1B)
 q2B= atan2d (s2B,c2)
 %%end
 %% INVERSE FOR RRP
 
 %px= q3*c2*c1;
 %py= q3*c2*s1;
 %pz= d1+q3*s2;
 
 px=5;
 py=2;
 pz=1.5;
 d1=0;
 
 q3A= +sqrt(px^2 + py^2+(pz-d1)^2)
 q3B= -sqrt(px^2 + py^2+(pz-d1)^2)
 
 q2A1= atan2d(((pz-d1)/q3A),+ sqrt((px^2 + py^2)/q3A^2))
 q2A2= atan2d(((pz-d1)/q3A),- sqrt((px^2 + py^2)/q3A^2))
 q2B1= atan2d(((pz-d1)/q3B),+ sqrt((px^2 + py^2)/q3B^2))
 q2B2= atan2d(((pz-d1)/q3B),- sqrt((px^2 + py^2)/q3B^2))
 
 c2A1= cos(q2A1);
 c2A2= cos(q2A2);
 c2B1= cos(q2B1);
 c2B2= cos(q2B2);
 q1A1= atan2d (py/c2A1,px/c2A1)
 q1A2= atan2d (py/c2A2,px/c2A2)
 q1B1= atan2d (py/c2B1,px/c2B1)
 q1B2= atan2d (py/c2B2,px/c2B2)
 
 %%end
 
 %% for spherical wrist after computing direct kinematic
  % VEDI TEST 21 NOVEMBRE 2014!!!!!
 %T3=A1*A2*A3;
 %p03= T3([1:3],4);
 %R1=A1([1:3],[1:3]);
 %R2=A2([1:3],[1:3]);
 %R3=A3([1:3],[1:3]);
 %R4=A4([1:3],[1:3]);
 %R5=A5([1:3],[1:3]);
 %R6=A6([1:3],[1:3]);
 %R06=R1*R2*R3*R4*R5*R6;
 %a6=(R06(:,3));
 %pW=p- (d6*a6);
 %in general we compute R36 in order to avoi the dependence from%q1,q2,q3..
 %R03= R1 *R2 *R3;
 %R36= (R03.')*R06
 
%after we have the final matrix, well'organize in order to compute q4,q5,q6

%% General inverse 
%syms r11 r12 r13 r21 r22 r23 r31 r32 r33
%R=[r11 r12 r13; r21 r22 r23; r31 r32 r33]
