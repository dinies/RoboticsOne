% initialization for posture regulation with odometric localization
% to be used with Simulink models
% posture_reg_with_odoloc_Euler.mdl or posture_reg_with_odoloc_RK.mdl
%
% G. Oriolo
% DIAG, Sapienza University of Rome
% 2016

clear all;
global k_1 k_2 k_3

% simulation time
T=10;

% initial configuration of the unicycle
x_0=-1;y_0=-2;theta_0=pi/2; 

% controller gains 
k_1=1;k_2=2.5;k_3=3;

% sampling interval for odometric localization
%T_s=0.15;     % note the final error (for the actual configuration)
               % larger for Euler
T_s=0.01;     % better accuracy
%T_s=0.6;      % will destabilize using Euler! but the estimate still converges