% initialization for cartesian or posture regulation
% G. Oriolo
% DIAG, Sapienza University of Rome
% 2016

clear all;

global k_1 k_2 k_3

% total simulation time
T=20;

% initial configuration of the unicycle

% fwd parking
%x_0=-2;
%y_0=-2;
% theta_0=pi/8;    % for cartesian regulation, unmodified
%theta_0=pi/8+pi;  % for cartesian regulation, unmodified first and modified then 

% parallel parking, for posture regulation, with no reversals
%  x_0=0;
%  y_0=2;
%  theta_0=0;    

% backward parking, for posture regulation, with one reversal
x_0=2;
y_0=0;
theta_0=0;    

% controller gains 
% k3 only used in posture regulation

k_1=1;
k_2=2.5;
k_3=3;