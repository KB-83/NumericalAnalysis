n = 10;
X = [3,4,1,2,5];
Y = [5,1,4,2,3];
max_y = Y(1);
max_index = 1;
min_y = Y(1);
min_index = 1;
for i = 2:length(Y)
    if(Y(i) > max_y) 
        max_y = Y(i);
        max_index = i;
    end
    if(Y(i) < min_y) 
        min_y = Y(i);
        min_index = i;
    end
end
hold on;
plot(X, Y, 'bo');
plot(X(max_index), Y(max_index), 'rx', 'MarkerSize', 10); 
plot(X(min_index), Y(min_index), 'gx', 'MarkerSize', 10);
plot([X(max_index), X(min_index)], [Y(max_index), Y(min_index)], 'k-');
