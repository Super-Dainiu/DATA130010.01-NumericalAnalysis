l=1;
u=solve(1,@(u,t) -l*u,0.8,1.4,0)
function [u]=solve(u0,f,p,h,t)
    u=zeros(1,1000); u(1)=u0;
    for i=2:numel(u)
        temp=inf;
        while abs(temp-u(i))>1e-6
            temp=u(i);
            u(i)=u(i-1)+h*(p*f(u(i),t+i*h)+(1-p)*f(u(i-1),t+(i-1)*h));
        end
    end
end