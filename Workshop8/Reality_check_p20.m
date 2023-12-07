
close all
clear all
clc
%% 
E=10*1e6; %psi  for aluminum
strain=217e-6;
b=0.9; 
h=0.4; 
Px_min=(1/6)*E*strain*b*h^2;
Sy=40*1e3; % psi
FOS=4; % factor of safety
sigma=Sy/FOS; 
Px_max=(1/6)*sigma*b*h^2;

n=100;
x=3:(30-3)/(n-1):30;
%P=0.2:(9.2-0.2)/99:9.2;



Pmin=Px_min./x;


Pmax=Px_max./x;

plot(x,Pmin,x,Pmax)
hold on
% add limits
plot([3 3],[0 max(Pmax)],'--')
plot([24 24],[0 max(Pmax)],'--')
plot([0 30],[9.2 9.2]) % the maximum load that is avaliable

xlabel('Bar length, x (in)')
ylabel('Applied force, P (lbf)')
title('Design space Px (aluminum)')


