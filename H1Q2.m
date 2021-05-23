x = linspace(-10,10,1000);
y1 = sin_with_shift(x);
y2 = sin_without_shift(x);
error = abs(y1-y2)./abs(y1);
semilogy(x,error);