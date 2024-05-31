format long;
a = 0;
b = 1;
Tol = 10^(-10);

userFunction = input('Enter the function f(x) as a string (e.g., @(x) cos(x)^2): ', 's');
ff = str2func(userFunction);
result = integral(ff, a, b, Tol);

disp(result);