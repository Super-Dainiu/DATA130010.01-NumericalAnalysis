h=1/2; n=20; a=88*1e6; e=0.967; b=a*(1-e^2)^(1/2);
f=@(x) (a^2*cos(x).^2+b^2*sin(x).^2).^(1/2);
4*richardson(f,h,n,0,pi/2)
function [fff]=richardson(f,h,n,a,b)
    r=1/2;
    m=zeros(n,n);
    for i=1:n
        m(i,1)=(sum(f(a:r^(i-1)*h:b))*2-f(a)-f(b))*r^(i-1)*h/2;
        for k=2:i
            m(i,k)=-(m(i,k-1)-r^(k-1)*m(i-1,k-1))/(r^(k-1)-1);
        end
    end
    fff=diag(m);
end