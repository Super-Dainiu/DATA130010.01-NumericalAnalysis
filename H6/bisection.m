function [x,loss]=bisection(f,x1,x2)
eps = 1e-12;
f1 = f(x1);
f2 = f(x2);
loss = [];
while abs(x1-x2)>eps
    mid = (x1+x2)/2;
    fmid = f(mid);
    if sign(f1)==sign(fmid)
        f1=fmid;
        x1=mid;
    else
        f2=fmid;
        x2=mid;
    end
    loss=[loss,abs(fmid)];
end
x = mid;
end