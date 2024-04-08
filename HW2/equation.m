n = 10;
a = -1* ones(1,n-1);
b = 2 * ones(1,n);
A = diag(a,-1);
A = A+diag(b,0);
A = A+ diag(a,1);
% disp(A);