X = [4,0,-1,13,7,-5];
Y = [10,0,11,4,-3,7];
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
% part a
plot(X, Y, 'bo');

% calculate the slope of the line connecting the maximum and minimum points
slope = (max_y - min_y) / (X(max_index) - X(min_index));

% lets sort the left side and right side points by their positions relative to the line
left_indices = [];
right_indices = [];
for i = 1:length(X)
    if ((X(i) - X(min_index)) * (Y(max_index) - Y(min_index)) - (Y(i) - Y(min_index)) * (X(max_index) - X(min_index)) > 0)
        right_indices = [right_indices, i];
    else
        left_indices = [left_indices, i];
    end
end

% plot the points
plot(X(max_index), Y(max_index), 'rx', 'MarkerSize', 10); 
plot(X(min_index), Y(min_index), 'gx', 'MarkerSize', 10);
plot([X(max_index), X(min_index)], [Y(max_index), Y(min_index)], 'k-');

% plot the sorted polygon
left_points = [X(left_indices); Y(left_indices)]';
right_points = [X(right_indices); Y(right_indices)]';
sorted_left = sortrows(left_points, 2); % sort by y-value
sorted_right = sortrows(right_points, 2); 
sorted_X = [sorted_left(:, 1); sorted_right(end:-1:1, 1)];
sorted_Y = [sorted_left(:, 2); sorted_right(end:-1:1, 2)];
sorted_X = [sorted_X; sorted_X(1)];
sorted_Y = [sorted_Y; sorted_Y(1)];
plot(sorted_X, sorted_Y, 'r-');
hold off;
