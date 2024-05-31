format long

userFunction = @(x) (1 / sqrt(2 * pi)) * exp(-(x.^2) / 2);
Tol = 10^(-10);

integralMatrix = zeros(21, 10);

for i = 0:20
    for j = 0:9
        upperLimit = i/10 + j/100;
        integralMatrix(i+1, j+1) = integral(userFunction, 0, upperLimit, Tol);
    end
end

disp(integralMatrix);