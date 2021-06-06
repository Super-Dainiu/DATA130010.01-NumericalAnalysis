phi=@(x) 3*x.^2-2*x.^3;
psi=@(x) x.^3-x.^2;
t=1;
n=9; x=linspace(0,2*pi,n); y=sin(x); h=x(2:n)-x(1:n-1); g=y(2:n)-y(1:n-1);
beta=2./h; eta=6*g./(h.^2); b=[t,eta(2:n-1)+eta(1:n-2),1]';
A=diag([1,2*beta(1:n-2)+2*beta(2:n-1),1])+diag([beta(1:n-2),0],-1)+diag([0,beta(2:n-1)],1);
k=A\b;
for i=1:n-1
    xx=linspace(x(i),x(i+1),20);
    yy=y(i)*phi((x(i+1)-xx)/h(i))+y(i+1)*phi((xx-x(i))/h(i))-k(i)*h(i)*psi((x(i+1)-xx)/h(i))+k(i+1)*h(i)*psi((xx-x(i))/h(i));
    plot(xx,yy);
    hold on
end
title("f'(0)="+num2str(t));