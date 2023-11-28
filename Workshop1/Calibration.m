clear all
clc
close all
load('calibr_data.mat')

xy=reproData;

y=xy(:,2:end);
% plot(XY(:,1),XY(:,2:end),'x')
n=size(xy);
for i=1:n(2)-1
    x(:,i)=xy(:,1);
end

 
[fitresult, gof] = createFit(x,y);



Y=fitresult.p1*x+fitresult.p2;

delta=y-Y; % deviation

%% plot deviations
figure 
line([min(min(x)) max(max(x))],[max(max(delta)) max(max(delta))],'LineStyle','--')
hold on
line([min(min(x)) max(max(x))],[min(min(delta)) min(min(delta))],'LineStyle','--')

plot(x,delta,'o')

%% output span
xmin=min(min(x));
xmax=max(max(x));
Ymin=fitresult.p1*xmin+fitresult.p2;
Ymax=fitresult.p1*xmax+fitresult.p2;

deltamin=min(min(delta));
deltamax=max(max(delta));
span=Ymax-Ymin;

%% accuracy
Accuracy1=deltamin*100/span;
Accuracy2=deltamax*100/span;

Accuracy=max(abs(Accuracy1),abs(Accuracy2));

%% average deviation 
% sort all deviations according to the test point;
xtest(:,1)=3:3:27;
for i=1:length(xtest)
    index=find(x(:,1)==xtest(i));
    deltatemp=delta(index,:);
    deltatemp(isnan(deltatemp))=[]; % removing NaN;
    delta_av(i,1)=mean(deltatemp);
    
end  
figure
%plot average deviation
plot(xtest,delta_av,'o')
hold on
%% linearity optimization problem
coeff=polyfit(xtest,delta_av,1);

[P,L]=fminsearch('Indeplinearity',coeff,[],xtest,delta_av);

z=P(1)*xtest+P(2);
L=abs(delta_av-z);
plot(xtest,z)

