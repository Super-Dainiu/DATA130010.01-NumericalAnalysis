N=-2:0.001:2;
[Re,Im]=meshgrid(N);
Z=Re+Im*1j;
C=1/4;
J=0;
for n=1:100
    t=abs(Z) .* abs(Z)<=2;
    J=J+1/log(n+1)*exp(-t.^2);
    Z=Z.^2+C;
    imagesc(-J);
    colormap("jet");
    axis equal
    axis off
    pause(0.001)
end