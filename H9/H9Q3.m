ns=100:1000;
r = [];
for h=1./ns
    x=0:h:1;
    s=0;
    for i=1:(numel(x)-1)
        s=s+exp(1/2*(x(i)+x(i+1)));
    end
    r=[r,s*h];
end
plot(ns,r);
hold on
plot(ns,(exp(1)-1)*ones(1,numel(ns)));
legend("approximation","true answer");