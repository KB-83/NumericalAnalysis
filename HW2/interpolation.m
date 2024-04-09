% newton's form Interpolation
k = 5;
x = [-1,0,1,2,3];
f = [-3,-1,-1,3,-31];
a = zeros(1,k);
a(1) = f(1);
for i=1:k-1
    zarib = 0;
    for j =1:i+1
        makhraj = 1;
        for m=1:i+1
            if(m~=j)
               makhraj = makhraj * (x(j)-x(m));
            end
        end
        zarib = zarib + f(j)/makhraj;
    end
    a(i+1) = zarib;
end
disp(a);