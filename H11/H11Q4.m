time1=[]; time2=[];
i=[1:2:99,100:20:999,1000:100:10000,10000:1000:100000];
for k=i
    x=rand([2,k]); x=x(1,:)+j*x(2,:);
    y=rand([2,k]); y=y(1,:)+j*y(2,:);
    tic
    Conv(x,y);
    time1=[time1,toc];
    tic
    conv(x,y);
    time2=[time2,toc];
    if ~mod(k,1000)
        disp(k)
    end
end
% loglog(i,time1)
% hold on
% loglog(i,time2)
% loglog(n/1e4)
% loglog(n.*log(n)/1e4)
% loglog(n.^2/1e4)
% legend("myconv","matlabconv","n","nlogn","n^2");
function [c]=Conv(a,b)
    eps=1e-6;
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
    c=c(c~=0);
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
    