% Subspaces (images and kernels) of the Jacobian of a robot and their dimensions
% Example: planar 3R robot with equal (unitary) links
% by A. De Luca, 25 Nov 2011

clear all
clc

syms q1 q2 q3 real

disp('direct kinematics of planar 3R robot (unitary links): end-effector position in the plane')
p=[cos(q1) + cos(q1+q2) + cos(q1+q2+q3);
   sin(q1) + sin(q1+q2) + sin(q1+q2+q3)]
pause

q=[q1 q2 q3]';

disp('Jacobian of planar 3R robot')
Jac=jacobian(p,q)
pause

% first case: a configuration that is regular

disp('in the configuration q=(0, pi/2, pi/4)')
pause
J=subs(Jac,{q1,q2,q3},{0,pi/2,pi/4})
pause

% second case: a configuration that is singular

% disp('in the configuration q=(pi/2, 0, pi)')
% pause
% J=subs(Jac,{q1,q2,q3},{pi/2,0, pi})
% pause

rankJ=rank(J)
pause

NullSpaceJ=null(J);
NullSpaceJ=NullSpaceJ/norm(NullSpaceJ)
pause

dimNullSpaceJ=size(NullSpaceJ,2)
pause

disp('check null-space joint velocity: J*NullSpaceJ')
pause
J*NullSpaceJ
pause

RangeJ=orth(J)
pause

dimRangeSpaceJ=size(RangeJ,2)
pause

disp('working with the Jacobian transpose')
JT=J'
pause

rankJT=rank(JT)
pause

NullSpaceJT=null(JT);
NullSpaceJT=NullSpaceJT/norm(NullSpaceJT)
pause

dimNullSpaceJT=size(NullSpaceJT,2)
pause

RangeJT=orth(JT)
pause

dimRangeSpaceJT=size(RangeJT,2)
pause

disp('final check on subspaces dimensions')

disp(' ')
disp('dim Range(J) + dim Null(J^T) ?')
pause 
dimRangeSpaceJ+dimNullSpaceJT
disp('..equal to the task-space dimension')
pause

disp(' ')
disp('dim Range(J^T) + dim Null(J) ?')
pause
dimRangeSpaceJT+dimNullSpaceJ
disp('..equal to the joint-space dimension')

% end