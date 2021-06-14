for j=1:4
    n=4^j;
    h=1/n;
    x=linspace(0,1,n+1);
    f=zeros(1,n+1); f(n+1)=1;
    for i=2:n
        x2=x(i+1); x1=x(i); x0=x(i-1);
        f1=@(x)(x-x0)/h.*x.^2;
        f2=@(x)(x2-x)/h.*x.^2;
        f(i)=integral(f1,x0,x1)+integral(f2,x1,x2);
    end
    A=diag([-ones(1,n-1)*1/h+1/6*h,0],-1)+diag([1,ones(1,n-1)*2/h+2/3*h,1])+diag([0,-ones(1,n-1)*1/h+1/6*h],1);
    u=A\f';
    subplot(2,4,j);
    plot(x,u);
    hold on
    plot(x,x.^2+2-2/(exp(1)+1)*exp(x)-2/(exp(-1)+1)*exp(-x))
    hold off
    legend("myfunc","precise");
    title("n="+num2str(n));
    subplot(2,4,j+4);
    plot(x,x.^2+2-2/(exp(1)+1)*exp(x)-2/(exp(-1)+1)*exp(-x)-u');
    legend("error");
    title("n="+num2str(n));
end
