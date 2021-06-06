n=32;
x=-pi:pi/n:pi;
y=sin(x);
lambda = zeros(1,2*n+1);
%%create a lagrange interpolation
for i=1:2*n+1
    lambda(1,i)=inv(prod(ones(1,2*n)*x(1,i)-[x(:,1:i-1),x(:,i+1:2*n+1)]));
end
xx=x(1,1:2*n)+pi/2/n*ones(1,2*n); %%shift the original points a bit and make estimation on each point
yy = zeros(1,2*n);
%%evaluate
for i=1:2*n
    p=prod(ones(1,2*n+1)*xx(1,i)-x);
    yy(1,i)=p*lambda*(y./(ones(1,2*n+1)*xx(1,i)-x))';
end
%comparison
plot(x,y,"r");
hold on
plot(xx,yy,"g");
hold off
%relative error
semilogy(xx,abs(yy-sin(xx))./abs(sin(xx)))
