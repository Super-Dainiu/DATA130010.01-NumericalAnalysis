i=1; t=100; n=100;
for s=[1,1e-1,1e-2,1e-3]
    x=linspace(-1,1,n*t); fx=weird(x,n);
    subplot(2,2,i); i=i+1;
    plot(x,fx);
    hold on
    phi=@(x) 1/sqrt(2*pi)/s*exp(-x.^2/(2*s^2));
    ffx=phi(x);
    fffx=Conv(ffx/sum(ffx),fx);
    xx=linspace(-1,1,numel(fffx));
    plot(xx,fffx);
    hold off
end
function [fx]=weird(x,n) % a weird discontinuous function
    z=linspace(-1,1,n);
    fx=zeros(1,numel(x));
    fx(x<z(1))=unidrnd(10);
    for i=1:numel(z)-1
        fx(x>=z(i)&x<z(i+1))=unidrnd(10);
    end
    fx(x>=z(n))=unidrnd(10);
end
function [c]=Conv(a,b)
    eps=1e-3;
    n=2^ceil(log(numel(a)+numel(b))/log(2));
    u=zeros(1,n); v=zeros(1,n);
    u(1:numel(a))=a; v(1:numel(b))=b;
    X=myFFT(u,n).*myFFT(v,n);
    c=1/n*myiFFT(X,n);
    a=real(c);
    b=imag(c);
    for j=1:numel(c)
        if abs(a(j))<eps
            a(j)=0;
        end
        if abs(b(j))<eps
            b(j)=0;
        end
    end
    c=a+i*b;
    c=c(abs(c)>=eps);
end
function [X]=myFFT(x,n)
    if n==2
        X=[x(1)+x(2),x(1)-x(2)];
    else
        w=exp(-i*(2*pi*linspace(0,n/2-1,n/2)/n));
        x1=myFFT(x(1:2:n-1),n/2);x2=w.*myFFT(x(2:2:n),n/2);
        X=[x1+x2,x1-x2];
    end
end
function [X]=myiFFT(x,n)
    if n==2
        X=[x(1)+x(2),x(1)-x(2)];
    else
        w=exp(i*(2*pi*linspace(0,n/2-1,n/2)/n));
        x1=myiFFT(x(1:2:n-1),n/2);x2=w.*myiFFT(x(2:2:n),n/2);
        X=[x1+x2,x1-x2];
    end
end