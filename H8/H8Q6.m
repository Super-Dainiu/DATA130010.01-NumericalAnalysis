k=15;
n=2^k;
h=pi/n; t=0;
F0=@(t,h) (sin(t+h)-sin(t-h))/2;
F1=@(t,h) (4^1*F0(t,h/2)-F0(t,h));
F2=@(t,h) (4^1*F1(t,h/2)-F1(t,h));
F3=@(t,h) (4^1*F2(t,h/2)-F2(t,h));
F4=@(t,h) (4^1*F3(t,h/2)-F3(t,h));
F5=@(t,h) (4^1*F4(t,h/2)-F4(t,h));
F6=@(t,h) (4^1*F5(t,h/2)-F5(t,h));
F7=@(t,h) (4^1*F6(t,h/2)-F6(t,h));
plot(n*[F0(t,h),F1(t,h),F2(t,h),F3(t,h),F4(t,h),F5(t,h),F6(t,h),F7(t,h)]);
hold on
plot(pi*ones(1,8));