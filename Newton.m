N=-2:0.001:2;
[Re,Im]=meshgrid(N);
Z=Re+Im*1j;
J=0;
for n=1:100
    t=abs(Z) .* abs(Z)<2;
    J=J+1/n*t;
    Z=Z.^3-1-(Z.^3-1)./(3*Z);
    imagesc(J);
    colormap("jet");
    axis equal
    axis off
    pause(0.001)
end