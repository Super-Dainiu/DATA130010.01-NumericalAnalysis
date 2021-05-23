n=3^5;
x=linspace(0,2*pi-2*pi/n,n);
X=myFFT3(x,numel(x));
plot(abs(X-fft(x)));
function [X]=myFFT3(x,n)
    if n==3
        X=[x(1)+x(2)+x(3),x(1)+exp(-i*(2*pi*1/3))*x(2)+exp(-i*(2*pi*2/3))*x(3),x(1)+exp(-i*(2*pi*2/3))*x(2)+exp(-i*(2*pi*4/3))*x(3)];
    else
        w=exp(-i*(2*pi*linspace(0,n/3-1,n/3)/n));
        x1=myFFT3(x(1:3:n-2),n/3); x2=w.*myFFT3(x(2:3:n-1),n/3); x3=w.^2.*myFFT3(x(3:3:n),n/3);
        X=[x1+x2+x3,x1+exp(-i*(2*pi*1/3))*x2+exp(-i*(2*pi*2/3))*x3,x1+exp(-i*(2*pi*2/3))*x2+exp(-i*(2*pi*4/3))*x3];
    end
end
function [X]=myFFT5(x,n)
    if n==5
        X=[x(1)+x(2)+x(3)+x(4)+x(5),...
            x(1)+exp(-i*(2*pi*1/5))*x(2)+exp(-i*(2*pi*2/5))*x(3)+exp(-i*(2*pi*3/5))*x(4)+exp(-i*(2*pi*4/5))*x(5),...
            x(1)+exp(-i*(2*pi*2/5))*x(2)+exp(-i*(2*pi*4/5))*x(3)+exp(-i*(2*pi*6/5))*x(4)+exp(-i*(2*pi*8/5))*x(5),...
            x(1)+exp(-i*(2*pi*3/5))*x(2)+exp(-i*(2*pi*6/5))*x(3)+exp(-i*(2*pi*9/5))*x(4)+exp(-i*(2*pi*12/5))*x(5),...
            x(1)+exp(-i*(2*pi*4/5))*x(2)+exp(-i*(2*pi*8/5))*x(3)+exp(-i*(2*pi*12/5))*x(4)+exp(-i*(2*pi*16/5))*x(5)];
    else
        w=exp(-i*(2*pi*linspace(0,n/5-1,n/5)/n));
        x1=myFFT5(x(1:5:n-4),n/5); x2=w.*myFFT5(x(2:5:n-3),n/5); x3=w.^2.*myFFT5(x(3:5:n-2),n/5); x4=w.^3.*myFFT5(x(4:5:n-1),n/5); x5=w.^4.*myFFT5(x(5:5:n),n/5);
        X=[x1+x2+x3+x4+x5,...
            x1+exp(-i*(2*pi*1/5))*x2+exp(-i*(2*pi*2/5))*x3+exp(-i*(2*pi*3/5))*x4+exp(-i*(2*pi*4/5))*x5,...
            x1+exp(-i*(2*pi*2/5))*x2+exp(-i*(2*pi*4/5))*x3+exp(-i*(2*pi*6/5))*x4+exp(-i*(2*pi*8/5))*x5,...
            x1+exp(-i*(2*pi*3/5))*x2+exp(-i*(2*pi*6/5))*x3+exp(-i*(2*pi*9/5))*x4+exp(-i*(2*pi*12/5))*x5,...
            x1+exp(-i*(2*pi*4/5))*x2+exp(-i*(2*pi*8/5))*x3+exp(-i*(2*pi*12/5))*x4+exp(-i*(2*pi*16/5))*x5];
    end
end