for i=1:4
    n=2^i;
    h=1/n;
    x=linspace(0,1,n+1)';
    A=diag([-ones(1,n-1)*1/h^2,0],-1)+diag(1+[0,ones(1,n-1)*2/h^2,0])+diag([0,-ones(1,n-1)*1/h^2],1);
    u=A\(x.^2);
    subplot(2,2,i);
    plot(x,u);
    hold on
    plot(x,x.^2+2-2/(exp(1)+1)*exp(x)-2/(exp(-1)+1)*exp(-x))
    hold off
    legend("myfunc","precise");
    title("n="+num2str(n));
end
