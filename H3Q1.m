eps=1e-6;
x=[-7;-7;-7;-7]*log(10); %assume it is neutral at first
J=@(x) [1 1 0 0;1 0 1 0;1 0 -1 1;1 -exp(x(2))/(exp(x(2))+exp(x(3))+2*exp(x(4))) -exp(x(3))/(exp(x(2))+exp(x(3))+2*exp(x(4))) -2*exp(x(4))/(exp(x(2))+exp(x(3))+2*exp(x(4)))];
f=@(x) [x(1)+x(2)+14*log(10);x(1)+x(3)-log(375)+13.76*log(10);x(1)+x(4)-x(3)+10.3*log(10);x(1)-log(exp(x(2))+exp(x(3))+2*exp(x(4)))];
while max(abs(f(x)))>eps %largest element of f(x) should be convergent to 0
    x = -J(x)\f(x)+x;
end
fprintf("pH=%f",-x(1)/log(10));