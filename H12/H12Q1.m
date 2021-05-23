f=@(u,t) -u;
res=[]; h=[];
for n=1:10000
    u=RK4(f,1,0,1,n);
    res=[res,abs(u(end)-1/exp(1))];
    h=[h,1/n];
end
x=linspace(0,1,10000);
loglog(x,x.^2);
hold on
loglog(x,x.^3);
loglog(x,x.^4);
loglog(h,res);
function u=RK4(f,u0,t,T,n)
    u=zeros(1,n+1); h=(T-t)/n; u(1)=u0;
    for i=1:n
        k1=f(u(i),t); k2=f(u(i)+h/2*k1,t+h/2);
        k3=f(u(i)+h/2*k2,t+h/2); k4=f(u(i)+h*k3,t+h);
        u(i+1)=u(i)+h/6*(k1+2*k2+2*k3+k4);
        t=t+h;
    end
end