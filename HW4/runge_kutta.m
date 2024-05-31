h = 10^(-5);
a = 0;
b = 3;
N = (b-a)/h;
X = zeros(31,1);
X_i = a;
Y_i = 0;
X(1) = 0;
for i = 2:1:30
    X(i) = X(i-1)+(0.1);
end
index = 1;
Y(index) = 0;
index = index+1;

tolerance = 1e-5; 

for i = 2:1:N
    K1 = h * f(X_i,Y_i);
    xbari = X_i+h/2;
    K2 = h * f(xbari,Y_i+(1/2 * K1));
    K3 = h * f(xbari,Y_i+(1/2 * K2));
    X_i = X_i+h;
    K4 = h * f(X_i,Y_i+K3);
    Y_i = Y_i+1/6*(K1+2*K2+2*K3+K4);
    if abs(X_i - X(index)) < tolerance
        Y(index) = Y_i;
        index = index+1;
    end
end


disp(Y);

function [f] = f(x,y)
    f = 1/sqrt(2*pi) * exp(-x^2/2);
end