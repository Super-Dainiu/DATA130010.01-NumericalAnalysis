tab = [1.00000 0.00000 -1.0000;0.80902 0.58779 -2.6807;0.30902 0.95106 5.6161;-0.30902 0.95106 5.6161;
    -0.80902 0.58779 -2.6807;-1.00000 0.00000 -1.0000;-0.80902 -0.58779 -2.6807;-0.30902 -0.95106 5.6161;
    0.30902 -0.95106 5.6161;0.80902 -0.58779 -2.6807];
x=tab(:,1)+j*tab(:,2);
z=tab(:,3);
%%create a Newton interpolation
n=numel(x);
dif = zeros(n); dif(:,1) = z; i = 2;
while i<=n
    for k=1:n-i+1
        dif(k,i)=(dif(k+1,i-1)-dif(k,i-1))/(x(k+i-1)-x(k));
    end
    i=i+1;
end
c=dif(1,:);
[X,Y]=meshgrid(-1:0.02:1); XX=X+Y*j;
%%evaluate the points
i=n-1; Z=ones(size(XX))*c(n);
while i>0
    Z=Z.*(XX-x(i))+c(i);
    i=i-1;
end
Z=real(Z);
figure();
surf(X,Y,Z);%表面图
    
