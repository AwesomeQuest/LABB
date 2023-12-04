close all
clc
%%
x=load('Problem1.txt');
N=length(x);
ck=(1/N)*fft(x);
k=0:N-1;
Ts=1;
omega_k0=2*pi/Ts
omega_k=k*omega_k0

plot(omega_k,abs(ck))

%% problem 2
x=load('Problem2.txt');
N=length(x);
ck=(1/N)*fft(x);
k=0:N-1;
Ts=1;
omega_k0=2*pi/Ts;
omega_k=k*omega_k0;
figure
plot(omega_k,abs(ck))

%% accel problem
x=load('accel.txt');
N=length(x);
ck=(1/N)*fft(x);
k=0:N-1;
Ts=1/1e3;
omega_k0=2*pi/Ts;
omega_k=k*omega_k0;
figure
plot(omega_k,abs(ck))
