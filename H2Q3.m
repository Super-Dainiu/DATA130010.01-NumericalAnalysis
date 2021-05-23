x=0:0.1:10;
f=@(y) y.*exp(y)-x;
ff=@(y) y.*exp(y)+exp(y);
s=size(x,2);
y = lambertW_Newton(f,ff,s);
plot(x,y,"r");
hold on
plot(exp(y).*y,y,'--b')