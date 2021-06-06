function x=Newton_a(x)
eps = 1e-10;
fx = atan(x)-2*x/(1+x*x);
ffx = 1/(1+x*x)-4*x*x/power(1+x*x,2);
while abs(fx/ffx)>eps
    x = x+fx/ffx;
    fx = atan(x)-2*x/(1+x*x);
    ffx = 1/(1+x*x)-4*x*x/power(1+x*x,2);
end