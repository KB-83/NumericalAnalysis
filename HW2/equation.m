n = 100;
a = -1* ones(1,n-1);
b = 2 * ones(1,n);
y = zeros(1,n);
for i= 1:1:n
    y(i) = i;
end
A = diag(a,-1);
A = A+diag(b,0);
A = A+ diag(a,1);
T = chol(A);
c = lowerTriangularSolve(T,y);
output= upperTriangularSolve(T',c);
% disp(output);

% part b:
disp(condest(A));


function x = upperTriangularSolve(A, b)
    n = length(b);
    x = zeros(n, 1);
    x(n) = b(n) / A(n, n);
    for i = n-1:-1:1
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    end
end

function x = lowerTriangularSolve(A, b)
    n = length(b);
    x = zeros(n, 1);
    x(1) = b(1) / A(1,1);
    for i = 2:n
        x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1)) / A(i, i);
    end
end