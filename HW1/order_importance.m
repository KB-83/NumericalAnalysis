format long;
sum = 0;
for i = 4999:-1:1
    sum = sum + 1 / (i+i^2);
end
sum = sum + 1;
disp(sum);
sum2 = 1;
for i = 1:1:4999
    sum2 = sum2 + 1 / (i+i^2);
end
disp(sum2)