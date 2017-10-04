% initialization for unicyle odometric localization
% to be used with Simulink model
% unicycle_with_odoloc.mdl 
%
% G. Oriolo
% DIAG, Sapienza University of Rome
% 2016

clear all;

% open-loop velocity inputs v, omega
v_bar=10;                 % v is linear in t: v_bar + k_v t 
k_v=0;                    % choose k_v=0 for constant v=v_bar

flag=1;                   % flag=1 for linear omega, flag=0 for sinusoidal omega

omega_bar=1;              % omega linear in t: omega_bar + k_om t 
k_om=0;                   % choose k_om=0 for constant omega=omega_bar
freq=1;                   % omega sinusoidal: omega_bar sin (freq t)

% simulation time
T=pi/2   % quarter circle if constant v and omega
%T=pi;   %half circle
%T=2*pi; %full circle

% initial configuration of the unicycle
x_0=-1;y_0=-2;theta_0=pi/2; 

% sampling interval for odometric localization
T_s=0.1;     