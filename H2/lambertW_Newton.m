function y=lambertW_Newton(f,ff,s)
eps=1e-12;
y=zeros(1,s);
while max(abs(f(y)./ff(y)))>eps
    y=y-f(y)./ff(y);
end