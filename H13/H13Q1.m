subplot(2,2,1)
fprintf("ode23:");
tic
ode23(@(t,u) 500*u^2*(1-u), [0,10], 0.01)
toc
title("ode23");
subplot(2,2,2)
fprintf("ode23s:");
tic
ode23s(@(t,u) 500*u^2*(1-u), [0,10], 0.01)
toc
title("ode23s")
[t1,y1]=ode23(@(t,u) 500*u^2*(1-u), [0,10], 0.01);
tt1=t1(2:end)-t1(1:end-1);
[t2,y2]=ode23s(@(t,u) 500*u^2*(1-u), [0,10], 0.01);
tt2=t2(2:end)-t2(1:end-1);
subplot(2,2,3)
semilogy(tt1);
title("ode23 stepsize semilogy");
subplot(2,2,4)
semilogy(tt2);
title("ode23s stepsize semilogy");