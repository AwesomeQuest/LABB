clear all
clc
close all

A=load('Example1.txt');
n=size(A);
format short
Deviation=zeros(n(1),6);
TW2345=A(:,1);
C1=A(5:end,2);
TW1=A(5:end,1);

C2=A(:,3);
C3=A(:,4);
C4=A(:,5);
C5=A(:,6);

TW6=A(1:5,1);
C6=A(1:5,7);
%% Curve fitting
x=[A(5:end,1); A(:,1); A(:,1); A(:,1); A(:,1); A(1:5,1)];
y=[A(5:end,2); A(:,3); A(:,4); A(:,5); A(:,6); A(1:5,7)];
X=[x ones(length(x),1)];
b = inv((X'*X))*X'*y;

b2=(X'*X)\X'*y;

[fitresult, gof] = createFit(x, y);


%% Deviations
model1=fitresult.p1*A(5:end,1)+fitresult.p2;



devia1=A(5:end,2)-model1;
Deviation(5:end,1)=devia1;


model2=fitresult.p1*A(:,1)+fitresult.p2;

devia2=A(:,3)-model2;
Deviation(:,2)=devia2;

devia3=A(:,4)-model2;
Deviation(:,3)=devia3;

devia4=A(:,5)-model2;
Deviation(:,4)=devia4;

devia5=A(:,6)-model2;
Deviation(:,5)=devia5;

model6=fitresult.p1*A(1:5,1)+fitresult.p2;

devia6=A(1:5,7)-model6;
Deviation(1:5,6)=devia6;

%% Average of cycles
AveCycle=zeros(n(1),1);


for k=1:n(1)
    
    if k<=4
        AveCycle(k,1)=sum(Deviation(k,:))/5;
    elseif k==5
        AveCycle(k,1)=sum(Deviation(k,:))/6;
    else
        AveCycle(k,1)=sum(Deviation(k,:))/5;
    end
end

%% Average up-down
Weights=0:0.5:5;
for j=1:length(Weights)
    I=find(A(:,1)==Weights(j));
    AveUpDown(j,1)=sum(AveCycle(I))/length(I);
end


%% Repeat
Rep=zeros(n(1),n(2)-2);
for i=1:n(2)-2
    if i==1
        Rep(5:end,i)=A(5:end,i+1)-A(5:end,i+2);
    elseif i==n(2)-2
        Rep(1:5,i)= A(1:5,i+1)-A(1:5,i+2);
    else
        Rep(:,i)=A(:,i+1)-A(:,i+2);
    end
end
m=size(Rep);
for j=1:m(1)
    Repmax(j,1)=max(Rep(j,:));
end



%Rep=[A(5:end,2)-A(5:end,3) A(:,3)-A(:,4) A(:,4)-A(:,5) A(:,5)-A(:,6) A(1:5,6)-A(1:5,7)]
figure
plot(A(5:end,1),devia1,'x',A(:,1),devia2,'+',A(:,1),devia3,'x')
hold on
line([0 5],[max(max(Deviation)) max(max(Deviation))],'LineStyle','--')
line([0 5],[min(min(Deviation)) min(min(Deviation))],'LineStyle','--')

figure
plot(Weights,AveUpDown,'square')

