h=1e-6; t=1; f=@(x) x^3*exp(x);
F0=@(t,h) (f(t+h)-f(t-h))/(2*h);
F1=@(t,h) (4^1*F0(t,h/2)-F0(t,h))/(4^1-1);
F2=@(t,h) (4^2*F1(t,h/2)-F1(t,h))/(4^2-1);
F3=@(t,h) (4^3*F2(t,h/2)-F2(t,h))/(4^3-1);
F4=@(t,h) (4^4*F3(t,h/2)-F3(t,h))/(4^4-1);
plot([F0(t,h),F1(t,h),F2(t,h),F3(t,h),F4(t,h)]);
hold on
plot(4*exp(1)*ones(1,5));
legend("Richardson extrapolation","True value");