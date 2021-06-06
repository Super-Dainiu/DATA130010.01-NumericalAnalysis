n=32;
f=@(x) (1.+25*x.^2).^-1;
x=-1:1/n:1;
y=f(x);
lambda = zeros(1,2*n+1);
%%create a lagrange interpolation
for i=1:2*n+1
    lambda(1,i)=inv(prod(x(1,i)*1.-[x(:,1:i-1),x(:,i+1:2*n+1)]));
end
xx=x(1,n/4:7*n/4-1)+10/3/n*ones(1,n*3/2); %%shift the original points a bit and make estimation on each point
yy = zeros(1,n);
%%evaluate
for i=1:n*3/2
    p=prod(ones(1,2*n+1)*xx(1,i)-x);
    yy(1,i)=p*lambda*(y./(xx(1,i)*1.-x))';
end
%comparison
plot(x,y,"r");
hold on
plot(xx,yy,"g");
%hold off
%relative error
%semilogy(xx,abs(yy-f(xx))./abs(f(xx)))
