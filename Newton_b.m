function [x,points]=Newton_b(x)
points = zeros(100,1);
fpoints = zeros(100,1);
fx = atan(x);
ffx = 1/(1+x*x);
for i=1:100
    x = x-fx/ffx;
    fx = atan(x);
    ffx = 1/(1+x*x);
    points(i) = x;
    fpoints(i) = fx;
end
t=-100:0.1:100;
y=atan(t);
plot(t,y);
hold on
scatter(points,fpoints,"x","r");
end