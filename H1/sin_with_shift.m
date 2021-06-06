function [y]=sin_with_shift(x)
j = size(x,2);
for i = 1:j
    while x(1,i) > pi
        x(1,i) = x(1,i) - 2*pi;
    end
    while x(1,i) < -pi
        x(1,i) = x(1,i) + 2*pi;
    end
    if x(1,i) < -pi/2
        x(1,i) = -pi - x(1,i);
    end
    if x(1,i) > pi/2
        x(1,i) = pi - x(1,i);
    end
end
y = sin_without_shift(x);