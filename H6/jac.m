function [J]=jac(x,n)
cheb=@(n,x) cos(n.*acos(x));
J=[];
for i=1:n
    J=[J,cheb(i,x)'];
end
end