x=linspace(0,2,100);
f=@(x) (1+x).^(-1/2);
p1=@(x) (1/4*x+1)./(3/4*x+1); %(ax+b)/(cx+1)
p2=@(x) (1/16*x.^2+3/4*x+1)./(5/16*x.^2+5/4*x+1); %(ax^2+bx+c)/(dx^2+ex+1)
plot(x,abs(p1(x)-f(x)));
hold on
plot(x,abs(p2(x)-f(x)));
h=legend("$\frac{ax+b}{cx+1}$","$\frac{ax^2+bx+c}{dx^2+ex+1}$",'Interpreter','latex');
