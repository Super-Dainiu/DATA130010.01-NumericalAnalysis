 x=[1 3 5 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 25];
y=[36.37 36.23 36.21 36.26 36.38 36.49 36.60 36.63 36.66 36.68 36.69 36.73 36.74 36.78 36.82 36.84 36.87 36.86 36.77 36.59 36.37];
phi=@(x) 3*x.^2-2*x.^3;
psi=@(x) x.^3-x.^2;
n=numel(x);
h=x(2:n)-x(1:n-1); g=y(2:n)-y(1:n-1);
beta=2./h; eta=6*g./(h.^2); b=[0,eta(2:n-1)+eta(1:n-2),eta(1)+eta(n-1)]';
A=diag([1,2*beta(1:n-2)+2*beta(2:n-1),2*beta(n-1)])+diag([beta(1:n-1)],-1)+diag([0,beta(2:n-1)],1);
A(1,n)=-1; A(n,1)=2*beta(1); A(n,2)=beta(2);
k=A\b;
for i=1:n-1
    xx=linspace(x(i),x(i+1),5);
    xxx=xx+24;
    yy=y(i)*phi((x(i+1)-xx)/h(i))+y(i+1)*phi((xx-x(i))/h(i))-k(i)*h(i)*psi((x(i+1)-xx)/h(i))+k(i+1)*h(i)*psi((xx-x(i))/h(i));
    plot(xx,yy);
    hold on
    plot(xxx,yy,".");
    hold on
end