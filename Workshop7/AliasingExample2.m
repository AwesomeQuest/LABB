% This script demonstrates the effects of aliasing by generating a
% simulated signal across a range of frequencies while sampling at a fixed
% frequency.
%


clear all; close all; clc;

T_rec = 10; % Record length (sec)

f_samp = 5; % Sampling frequency (Hz)

f_phys_min = 1; % Minimum frequency for sweep (Hz)
delta_f_phys = 0.1; % Frequency sweep step size (Hz)
f_phys_max = 20; % Maximum frequency for sweep (Hz)

f_phys_vec = (f_phys_min:delta_f_phys:f_phys_max);

pause;

for ii = 1:length(f_phys_vec)

f_phys = f_phys_vec(ii); % Frequency of physical signal (Hz)
t_phys = linspace(0,T_rec,10000); % Vector of time elements (sec)
x_phys = sin(2*pi*f_phys.*t_phys); % Physical signal

figure(1)
% set(1,'Position' , [120 50 920 640])

subplot(3,1,1)
plot(t_phys,x_phys)
ylim([-1.1, 1.1])
title(sprintf('Physical Signal and Sampled Data Points \n Physical Frequency = %0.1f Hz, Sampling Frequency = %0.1f Hz',f_phys,f_samp))
xlabel('Time (sec)')
ylabel('Amplitude')
hold on;

delta_t = 1/f_samp;
t_samp = (0:delta_t:T_rec); % Vector of sampling times
x_samp = sin(2*pi*f_phys.*t_samp); % Sampled signal

subplot(3,1,1)
plot(t_samp,x_samp,'ro') % This adds the sampled data points to the above plot
hold off;

subplot(3,1,2)
plot(t_samp,x_samp,'ro--') % This shows the apparent sampled data signal
ylim([-1.1,1.1])
title('Apparent Sampled Signal')
xlabel('Time (sec)')
ylabel('Amplitude')

N_samp = length(t_samp);

delta_f = 1/T_rec; % Frequency step size (Hz)
f_vec = (0:delta_f:(N_samp-1)*delta_f); % Vector of frequencies (Hz)

c_k = 1/N_samp*fft(x_samp); % Complex Fourier coefficients

subplot(3,1,3)
stem(f_vec,abs(c_k))
% xlim([0 f_samp/2]) % limits plot to Nyquist frequency
xlim([0 f_samp]) % shows all frequencies
ylim([0 0.6])
title('Frequency Spectrum')
xlabel('Frequency (Hz)')
ylabel('|c_n|')
pause(2 )

end

