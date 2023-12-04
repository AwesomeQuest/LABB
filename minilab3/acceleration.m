
%% Theoretical natural frequency
b=0.04; % width of the aluminium bar in meter
h=0.005; % thickness of the bar
l1=0.895; %0.895;
I=b*h^3/12; % moment of inertia
rho=7800;% density of Al in kg/m^3
E= 0.69e+11; % modulus of elasticity in N/m^2

V=l1*h*b;  % volume
m=rho*V;  % masss in kg
k=3*E*I/l1^3; % stiffness

wn=sqrt(k/m) % natural frequency in rad/s
fn=wn/(2*pi)

w1=1.875^2*sqrt(E*I/(m*l1^3))
f1=w1/(2*pi)



w2=4.694^2*sqrt(E*I/(m*l1^3))
f2=w2/(2*pi)

w3=7.885^2*sqrt(E*I/(m*l1^4))   
f3=w3/(2*pi)

%%

Fs=20000; % sampling frequency in Hertz
dt=1/Fs; % sampling time in second

filename1='r.txt';
[x,y,z] = importfile(filename1);

N=length(y(1:24990));
ck=(1/N)*fft(y(1:24990));
Ts = 1
w=1:N;
f=w*2*3.14/Ts;
 plot(f,abs(ck))

