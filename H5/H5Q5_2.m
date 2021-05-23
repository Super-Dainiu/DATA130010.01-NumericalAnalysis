x=[3 2 0 -2 -3 -2 0 2 3]; y=[0 2 3 2 0 -2 -3 -2 0]; n=numel(x);
t(1)=0;
for i=2:n
    t(i)=t(i-1)+norm([x(i)-x(i-1),y(i)-y(i-1)]);
end
phi=@(x) 3*x.^2-2*x.^3;
psi=@(x) x.^3-x.^2;
h=t(2:n)-t(1:n-1); g1=x(2:n)-x(1:n-1); g2=y(2:n)-y(1:n-1);
%k1 for x
beta=2./h; eta1=6*g1./(h.^2); b1=[0,eta1(2:n-1)+eta1(1:n-2),eta1(1)+eta1(n-1)]';
A=diag([1,2*beta(1:n-2)+2*beta(2:n-1),2*beta(n-1)])+diag([beta(1:n-1)],-1)+diag([0,beta(2:n-1)],1);
A(1,n)=-1; A(n,1)=beta(1);
k1=A\b1;
%k2 for y
eta2=6*g2./(h.^2); b2=[0,eta2(2:n-1)+eta2(1:n-2),eta2(1)+eta2(n-1)]';
k2=A\b2;
for i=1:n-1
    tt=linspace(t(i),t(i+1),20);
    xx=x(i)*phi((t(i+1)-tt)/h(i))+x(i+1)*phi((tt-t(i))/h(i))-k1(i)*h(i)*psi((t(i+1)-tt)/h(i))+k1(i+1)*h(i)*psi((tt-t(i))/h(i));
    yy=y(i)*phi((t(i+1)-tt)/h(i))+y(i+1)*phi((tt-t(i))/h(i))-k2(i)*h(i)*psi((t(i+1)-tt)/h(i))+k2(i+1)*h(i)*psi((tt-t(i))/h(i));
    plot(xx,yy);
    hold on
end