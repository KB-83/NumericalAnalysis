k = 0;
x = 0.5;
y = 0.5;
z = 0.5;

u = eps;
error = 10;
X = [x, y, z];
Y = [110,110,110];

while k <= 100 && error > u
    d = f_prime(X)\-f(X)';
    error = max(abs(f(X)));
    X = X + d';
    k = k + 1;
end
disp(X);
disp(k);

function result = f(X)
    x = X(1);
    y = X(2);
    z = X(3);
    result = [x^2 - y^2 + z^2 - 1, 3*x^2 + y^2 - 4*z, 3*x^2 - 4*y + z^2];
end

function result = f_prime(X)
    x = X(1);
    y = X(2);
    z = X(3);
    result = [2*x, -2*y, 2*z; 6*x, 2*y, -4; 6*x, -4, 2*z];
end