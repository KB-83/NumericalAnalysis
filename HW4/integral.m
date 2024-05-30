format long
a = 0;
b = 1;
n = 2;
Tol = 10^(-18);
errorr = 100000000000;
output = 0;
while errorr > Tol
    n = n*2;
    output = S(a, b, n);
    errorr = abs(error(a, b, n));
end
disp(output);

function[f] = f(x)
    f = 4/(1+x^2);
end

function [t] = T(a, b, n)
    if n == 1
        t = ((b-a)/2*(f(a)+f(b)));
    else
        t = ((T(a, b, n/2) + M(a, b, n/2)))/2;
    end
end

function [M] = M(a, b, n)
    sum = 0;
    h = (b-a)/n;
    for i = 0:1:n-1
        m = (a+(i*h))+(h/2);
        f_m = f(m);
        sum = sum+(h*f_m);
    end
    M = sum;
end

function [S] = S(a, b, n)
    S = (4*T(a, b, 2*n) - T(a, b, n))/3;
end

function [e] = error(a, b, n)
    e = (S(a, b, 2*n) - S(a, b, n))/15;
end