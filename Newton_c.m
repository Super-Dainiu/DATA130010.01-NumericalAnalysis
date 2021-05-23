function [x]=Newton_c(x)
eps=1e-12;
points = [];
fpoints = [];
fx = cos(x)+1;
ffx = -sin(x);
while abs(fx)>eps
    x = x-fx/ffx;
    fx = cos(x)+1;
    ffx = -sin(x);
    points= [points,x];
    fpoints = [fpoints,fx];
end
semilogy(fpoints);
end