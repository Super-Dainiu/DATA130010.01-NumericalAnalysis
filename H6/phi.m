function [y]=phi(x,c)
n=numel(c);
cheb=@(n,x) cos(n.*acos(x));
y=zeros(numel(x),1);
for i=1:n
    y=y+c(i)*cheb(i,x)';
end
end