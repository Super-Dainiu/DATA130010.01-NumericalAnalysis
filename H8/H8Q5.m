j=1e-3;
x=[1 3 5 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 25];
y=[36.37 36.23 36.21 36.26 36.38 36.49 36.60 36.63 36.66 36.68 36.69 36.73 36.74 36.78 36.82 36.84 36.87 36.86 36.77 36.59 36.37];
% interpolation
phi=@(x) 3*x.^2-2*x.^3;
psi=@(x) x.^3-x.^2;
n=numel(x);
h=x(2:n)-x(1:n-1); g=y(2:n)-y(1:n-1);
beta=2./h; eta=6*g./(h.^2); b=[0,eta(2:n-1)+eta(1:n-2),eta(1)+eta(n-1)]';
A=diag([1,2*beta(1:n-2)+2*beta(2:n-1),2*beta(n-1)])+diag([beta(1:n-1)],-1)+diag([0,beta(2:n-1)],1);
A(1,n)=-1; A(n,1)=2*beta(1); A(n,2)=beta(2);
k=A\b;
t1=[];t2=[];f1=[];f2=[];
% examine the first derivatives
% for i=1:n-1
%     f=@(xx)y(i)*phi((x(i+1)-xx)/h(i))+y(i+1)*phi((xx-x(i))/h(i))-k(i)*h(i)*psi((x(i+1)-xx)/h(i))+k(i+1)*h(i)*psi((xx-x(i))/h(i));
%     F0=@(t,h) (f(t+h)-f(t-h))/(2*h);
%     F1=@(t,h) (4^1*F0(t,h/2)-F0(t,h))/(4^1-1);
%     t=linspace(x(i),x(i+1),20);
%     t1=[t1,t]; f1=[f1,F1(t,j)];
% end
% plot(t1,f1);
% hold on
% examine the second derivatives
for i=1:n-1
    f=@(xx)y(i)*phi((x(i+1)-xx)/h(i))+y(i+1)*phi((xx-x(i))/h(i))-k(i)*h(i)*psi((x(i+1)-xx)/h(i))+k(i+1)*h(i)*psi((xx-x(i))/h(i));
    F2=@(t,h)(f(t+h)+f(t-h)-2*f(t))/(h^2);
    t=linspace(x(i),x(i+1),50);
    t2=[t2,t]; f2=[f2,F2(t,j)];
end
plot(t2,f2);
hold on
% fitting
F0=@(t,h) (Bezier(t+h,y)-Bezier(t-h,y))/(2*h);
F1=@(t,h) (4^1*F0(t,h/2)-F0(t,h))/(4^1-1);
F2=@(t,h)(Bezier(t+h,y)+Bezier(t-h,y)-2*Bezier(t,y))/(h^2);
% plot(t1,F1(t1,j))
plot(t2,F2(t2,j));
legend("interpolation","fitting");
function [f]=Bezier(x,y)
    n=numel(y);
    f=0;
    for i=0:n-1
       f=f+(1-(x-1)/24).^(n-i-1).*((x-1)/24).^(i)*y(i+1)*nchoosek(n-1,i);
    end 
end