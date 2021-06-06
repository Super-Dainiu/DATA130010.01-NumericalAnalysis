function [y]=sin_without_shift(x)
eps = 1e-6;
i = 0;
y = 0;
k = 1;
X = x;
ii = 1;
while true
    if abs(ii*X/k) < eps
        break;
    end
    y = y + ii * X / k;
    ii = -ii;
    X = X .* x .* x;
    i = i+1;
    k = k * (2*i + 1) * (2*i);
end