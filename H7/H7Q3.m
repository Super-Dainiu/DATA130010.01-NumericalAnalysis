n=2;
f=@(x) log(1+x);
p=@(x) [x.^2,x,ones(n+2,1),[1;-1;1;-1]];  %create the matrix
sol=@(a,b)[-(2*a + b + (4*a^2 - 4*a*b + 8*a + b^2)^(1/2))/(4*a)
           -(2*a + b - (4*a^2 - 4*a*b + 8*a + b^2)^(1/2))/(4*a)]; %find n points that f'(x)=p'(x)
x=linspace(1,0,n+2);
w=p(x')\f(x');
r=[];
for i=1:100
    xx=sol(w(1),w(2));
    for j=1:numel(xx)
        for i=1:n+1
            if x(i)>=xx(j) && x(i+1)<=xx(j)    
                if sign(f(x(i))-(w(1)*x(i)^2+w(2)*x(i)+w(3)))==sign(f(xx(j))-(w(1)*xx(j)^2+w(2)*xx(j)+w(3)))
                    x(i)=xx(j);
                else
                    x(i+1)=xx(j);
                end
            end
        end
        if xx(j)>=x(1)
            if sign(f(x(1))-(w(1)*x(1)^2+w(2)*x(1)+w(3)))==sign(f(xx(j))-(w(1)*xx(j)^2+w(2)*xx(j)+w(3)))
                x(1)=xx(j);
            else
                x=[xx(j),x(1:n+1)];
            end
        end
        if xx(j)<=x(n+2)
            if sign(f(x(n+2))-(w(1)*x(n+2)^2+w(2)*x(n+2)+w(3)))==sign(f(xx(j))-(w(1)*xx(j)^2+w(2)*xx(j)+w(3)))
                x(n+2)=xx(j);
            else
                x=[x(2:n+2),xx(j)];
            end
        end
    end
    %swap x
    r=[r,max(abs(f(xx)-w(1)*xx.^2-w(2)*xx-w(3)))];
    w=p(x')\f(x');
end
plot(r);