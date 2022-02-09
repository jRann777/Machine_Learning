clear all;close all;clc;
rawdata=readmatrix("HW\HW1\testData-1.csv");
iter=1;
% J is Cost Function
x=rawdata(:,1)';
y=rawdata(:,2)';
w1=zeros(1,25000);w0=w1;
w0(1)=1;
w1(1)=7;
J=9*ones(1,2500);
alpha_a=.01;
%for iter_a=1:2500
while(1)
    J(iter+1)=J_Cost(x,y,w1(iter),w0(iter));
    [Derivate_W1(iter),Derivate_W0(iter)]=Gradient_Descent(x,y,w1(iter),w0(iter));
    w1(iter+1)=w1(iter)-alpha_a*Derivate_W1(iter);
    w0(iter+1)=w0(iter)-alpha_a*Derivate_W0(iter);
    J_effective=min(J);
    if(abs(J(iter+1))<.51)
       iter=iter+1;
        break
    end
    iter=iter+1
end
figure(1);
subplot(2,2,1)
plot(1:iter,J(1:iter));
legend('Cost')
title(join(['Using J=',num2str(round(J(iter),3)) ],' '))
subplot(2,2,2);
scatter(x,y);
hold on
plot(x,w0(iter)+w1(iter)*x);
hold off
title('Predicited and Actual Data')
legend('Data Points','Projected Line')
subplot(2,2,3);
plot(1:iter,w0(1:iter))
title(join(['Using \omega_{0}=',num2str(round(w0(iter),3)) ],' '))
subplot(2,2,4)
plot(1:iter,w1(1:iter))
title(join(['Using \omega_{1}=',num2str(round(w1(iter),3)) ],' '))
function error_value=J_Cost(x,y,omega1,omega0)
    m=length(x);
    sumarray=(((omega0+omega1*x)-y).^2);
    innervalue=sum(sumarray);
    error_value=1/(2*m)*innervalue;
end
function [error_value_w1,error_value_w0]=Gradient_Descent(x,y,omega1,omega0)
    m=length(x);
    innervalue=2*((omega0+omega1*x)-y);
    innervalue_w1=sum(innervalue.*x);
    innervalue_w0=sum(innervalue);
    error_value_w1=1/m*innervalue_w1;
    error_value_w0=1/m*innervalue_w0;
end