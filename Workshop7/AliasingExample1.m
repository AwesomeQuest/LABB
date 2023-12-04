% This script demonstrates the effects of aliasing by allowing the user to
% generate a simulated signal and sampling it at a defined frequency.
%


clear all; clc;
close all; 

playagain = 'Yes'

while strcmp(playagain,'Yes');

answer = inputdlg({'Physical Frequency (Hz):','Sampling Frequency (Hz):'},'Settings',1,{'10','100'}); 
f_phys = str2num(answer{1});
f_samp = str2num(answer{2});

% construct physical signal

N_per = 20; % Number of periods
T = N_per*1/f_phys; % Period of signal (sec)
t_phys = linspace(0,T,10000); % Vector of time elements
phase_delay = rand(1)*2*pi;
x_phys = sin(2*pi*f_phys.*t_phys-phase_delay); % Physical signal

figure(1)
% set(1,'Position' , [120 50 720 640])

subplot(2,1,1)
plot(t_phys,x_phys)
ylim([-1.1, 1.1])
title('Physical Signal and Sampled Data Points')
xlabel('Time (sec)')
ylabel('Amplitude')
hold on;

% construct sampled signal

t_samp = (0:1/f_samp:T); % Vector of sampling times
x_samp = sin(2*pi*f_phys.*t_samp-phase_delay); % Sampled signal

plot(t_samp,x_samp,'ro')
hold off;

subplot(2,1,2)
plot(t_samp,x_samp,'ro--')
ylim([-1.1,1.1])
title('Apparent Sampled Signal')
xlabel('Time (sec)')
ylabel('Amplitude')

playagain = questdlg('Would you like to play again?','Yes','No ');

end


