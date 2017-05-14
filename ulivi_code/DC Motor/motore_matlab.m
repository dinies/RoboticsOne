%% Script per l'analisi del modello del motore 
%  a corrente continua alimentato sull'armatura

clear all
close all
clc 

% Parametri del sistema
Lm = 0.5;   % Induttanza elettrica del motore in Henri
Rm = 1;     % Resistenza elettrica del motore in Ohm
J = 0.01;   % Momento d'inerzia del rotore in kg m^2
B =  0.1;   % Attrito viscoso in N m s
kt= 0.01;   % Costante per la coppia
kb = 0.01;  % Costante della forza elettromotrice

G_cd = tf (kt, conv([Lm Rm], [J B]))
G_cc = feedback(G_cd, kb)

G_a = tf(1, [1 0]) * G_cc

G_cc.InputName = 'Voltaggio';
G_cc.OutputName = 'Velocita';
G_a.InputName = 'Voltaggio';
G_a.OutputName = 'Angolo';

G = [G_cc; G_a]

figure(1)
step(G, 10)

figure(2)
impulse(G, 10)
