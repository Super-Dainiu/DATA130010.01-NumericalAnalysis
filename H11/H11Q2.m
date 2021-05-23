n=1024;
x=linspace(0,2*pi-2*pi/n,n);
fx=sin(3*x);
% fx=sin(x)+sin(128^(1/12)*x);
X=myFFT(fx,numel(fx)); fs=1;
plot(fs*(1:n/4),abs(X(1:end/4)));
function [X]=myFFT(x,n)
    if n==2
        X=[x(1)+x(2),x(1)-x(2)];
    else
        w=exp(-i*(2*pi*linspace(0,n/2-1,n/2)/n));
        x1=myFFT(x(1:2:n-1),n/2);x2=w.*myFFT(x(2:2:n),n/2);
        X=[x1+x2,x1-x2];
    end
end