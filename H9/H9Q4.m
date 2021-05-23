h=1/2;n=20;
% f=@(x) exp(x);
f=@(x) x.^(3/2);
richardson(f,h,n,0,1)
hold on
plot(ones(1,n)*2/5);
legend("Romberg","True value");
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

            