figure;
xlabel('North'); ylabel('East'); zlabel('Down');

switch model_case
    case 7
        ax = [-20 120 -20 80 130 220];
    case 8
        ax = [-10 20 -10 10 0 10];
end

axis(ax);
title('ROV Trajectory');

set(gca, 'zdir', 'reverse'); 
grid
hold on
a = plot3(y.data(1,:), y.data(2,:), y.data(3,:), 'r') ; %Plotting Minervas trajecory
b = plot3(setpoints(1,:), setpoints(2,:), setpoints(3,:), 'b'); % Plotting the desired path
plot3(WP(:,1), WP(:,2), WP(:,3), 'x'); %Marking the waypoints

legend([a b],{'Real trajectory','Desiered Path'}); 