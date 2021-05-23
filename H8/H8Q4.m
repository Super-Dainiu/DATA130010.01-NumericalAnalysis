phi=@(x) 3*x.^2-2*x.^3;
psi=@(x) x.^3-x.^2;
n=10; x=linspace(1,4,n); y=log(x)+exp(x); h=x(2:n)-x(1:n-1); g=y(2:n)-y(1:n-1);
beta=2./h; eta=6*g./(h.^2); b=[1+exp(1),eta(2:n-1)+eta(1:n-2),1/4+exp(4)]';
A=diag([1,2*beta(1:n-2)+2*beta(2:n-1),1])+diag([beta(1:n-2),0],-1)+diag([0,beta(2:n-1)],1);
k=A\b;
stepsize=[1e-3,1e-6];
for j=stepsize
    t1=[];t2=[];f1=[];f2=[];
% examine the first derivatives
%     for i=1:n-1
%         f=@(xx)y(i)*phi((x(i+1)-xx)/h(i))+y(i+1)*phi((xx-x(i))/h(i))-k(i)*h(i)*psi((x(i+1)-xx)/h(i))+k(i+1)*h(i)*psi((xx-x(i))/h(i));
%         F0=@(t,h) (f(t+h)-f(t-h))/(2*h);
%         F1=@(t,h) (4^1*F0(t,h/2)-F0(t,h))/(4^1-1);
%         t=linspace(x(i),x(i+1),20);
%         t1=[t1,t]; f1=[f1,F1(t,j)];
%     end
%     plot(t1,abs(f1-1./t1-exp(t1)));
%     hold on
%     examine the second derivatives
%     for i=1:n-1
%         f=@(xx)y(i)*phi((x(i+1)-xx)/h(i))+y(i+1)*phi((xx-x(i))/h(i))-k(i)*h(i)*psi((x(i+1)-xx)/h(i))+k(i+1)*h(i)*psi((xx-x(i))/h(i));
%         F2=@(t,h)(f(t+h)+f(t-h)-2*f(t))/(h^2);
%         t=linspace(x(i),x(i+1),20);
%         t2=[t2,t]; f2=[f2,F2(t,j)];
%     end
%     plot(t2,abs(f2+1./t2.^2-exp(t2)));
%     hold on
end
legend("stepsize=1e-3","stepsize=1e-6","stepsize=1e-8","stepsize=1e-10");