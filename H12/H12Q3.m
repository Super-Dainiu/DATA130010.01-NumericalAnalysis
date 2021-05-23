u=zeros(3,101); u(:,1)=[1,0,100]; mu=10; K=10; Ks=10; kd=0.1; ke=0.1; kh=0.1;
f=@(u,t) [mu*(1-u(1)/K)*(u(3)/(u(3)+Ks))*u(1)-kd*u(1)-ke*u(1);...
    kd*u(1)-kh*u(2);...
    ke*u(1)+kh*u(2)-mu*(1-u(1)/K)*(u(3)/(u(3)+Ks))*u(1)];
for i=1:100
    uu=RK4(f,u(:,i),i-1,i,100);
    u(:,i+1)=uu(:,end);
end
plot(u');
legend("X","C","S");
function u=RK4(f,u0,t,T,n)
    u=zeros(3,n+1); h=(T-t)/n; u(:,1)=u0;
    for i=1:n
        k1=f(u(:,i),t); k2=f(u(:,i)+h/2*k1,t+h/2);
        k3=f(u(:,i)+h/2*k2,t+h/2); k4=f(u(:,i)+h*k3,t+h);
        u(:,i+1)=u(:,i)+h/6*(k1+2*k2+2*k3+k4);
        t=t+h;
    end
end
function u=Euler(f,u0,t,T,n)
    u=zeros(3,n+1); h=(T-t)/n; u(:,1)=u0;
    for i=1:n
        u(:,i+1)=u(:,i)+h*f(u(:,i),t);
        t=t+h;
    end
end