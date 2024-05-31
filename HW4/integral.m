function resualt = integral(ff, a, b, Tol)
    errorr = 100000000000;
    n = 2;
    resualt = 0;
    while errorr > Tol
        n = n * 2;
        resualt = S(a, b, n, ff);
        errorr = abs(error(a, b, n, ff));
    end
end

function [t] = T(a, b, n, ff)
    if n == 1
        t = ((b - a) / 2 * (ff(a) + ff(b)));
    else
        t = ((T(a, b, n / 2, ff) + M(a, b, n / 2, ff)) / 2);
    end
end
function [M] = M(a, b, n, ff)
    sum = 0;
    h = (b - a) / n;
    for i = 0:1:n-1
        m = (a + (i * h)) + (h / 2);
        f_m = ff(m);
        sum = sum + (h * f_m);
    end
    M = sum;
end
function [S] = S(a, b, n, ff)
    S = (4 * T(a, b, 2 * n, ff) - T(a, b, n, ff)) / 3;
end
function [e] = error(a, b, n, ff)
    e = (S(a, b, 2 * n, ff) - S(a, b, n, ff)) / 15;
end


