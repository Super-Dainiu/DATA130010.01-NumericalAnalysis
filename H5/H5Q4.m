eps=1e-6;
x=[-1 -1 1 1 -0.7313 0.5275 -0.0091 0.3031;-1 1 -1 1 0.6949 -0.4899 -0.1010 0.5774]';
z=[1.6389 0.5403 -0.9900 0.1086 0.9573 0.8270 1.6936 1.3670];
n=101;
p=2;
[X,Y]=meshgrid(linspace(-1,1,n));
%shepard method
dist=@(x1,x2) norm(x1-x2,p)^p;
Z=zeros(n);
for i=1:n
    for j=1:n
        a=0;b=0;
        for k=1:size(x,1)
            d=dist(x(k,:),[X(i,j),Y(i,j)]);
            if d <= eps
                Z(i,j)=z(k);
                break;
            end
            a=a+z(k)/d;
            b=b+1/d;
        end
        Z(i,j)=a/b;
    end
end
figure();
surf(X,Y,Z);

