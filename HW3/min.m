k = 0;
x = 0;
y = 3/4;
u = eps;
error = 10;
X = [x, y];

while k <= 100 && error > u
    t = 1;
    H = hessian_f(X);
    [R,flag] = chol(H);
    while(flag ~= 0)
        t = 2 * t;
        H = H + t*eye(2);
        [R,flag] = chol(H);
    end
    d = H\-grad_f(X)';
    error = max(abs(grad_f(X)));
    X = X + d';
    k = k + 1;
end
disp(X);
disp("k = ")
disp(k);
disp("error= ")
disp(error);

function result = grad_f(X)
    x = X(1);
    y = X(2);
    result = [6*y*x - 9/2*x, 3*x^2 + 4*y];
end

function result = hessian_f(X)
    x = X(1);
    y = X(2);
    result = [6*y-9/2, 6*x; 6*x, 4];
end