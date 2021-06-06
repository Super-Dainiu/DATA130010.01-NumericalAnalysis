x=linspace(-1,1,100);
f=@(x)(1+25.*x.^2).^(-1);
n=numel(x);
dif = zeros(n); dif(:,1) = f(x); i = 2;
while i<=n
    for k=1:n-i+1
        dif(k,i)=(dif(k+1,i-1)-dif(k,i-1))/(x(k+i-1)-x(k));
    end
    i=i+1;
end
c=dif(1,:);
xx=linspace(-1,1,500);
i=n-1; yy=ones(size(xx,1))*c(n);
while i>0
    yy=yy.*(xx-x(i))+c(i);
    i=i-1;
end
yy=real(yy);
plot(xx,yy);
hold on
plot(xx,f(xx));