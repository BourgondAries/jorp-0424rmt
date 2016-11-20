figure
xlabel('North'); ylabel('East'); zlabel('Down');
axis([-50 150 -50 110 0 250]);
title('Collision avoidance','Interpreter', 'latex');

set(gca, 'zdir', 'reverse'); 
grid
hold on

p1 = [25 15 165];
p2 = [25 45 165];
p3 = [25 45 185];
p4 = [25 15 185];
p5 = [75 15 165];
p6 = [75 45 165];
p7 = [75 45 185];
p8 =  [75 15 185];

x = [p1(1) p2(1) p3(1) p4(1)];
w = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];
fill3(x,w,z, 1);

x = [p5(1) p6(1) p7(1) p8(1)];
w = [p5(2) p6(2) p7(2) p8(2)];
z = [p5(3) p6(3) p7(3) p8(3)];
fill3(x,w,z, 1);

x = [p2(1) p6(1) p7(1) p3(1)];
w = [p2(2) p6(2) p7(2) p3(2)];
z = [p2(3) p6(3) p7(3) p3(3)];
fill3(x,w,z, 1);

x = [p2(1) p6(1) p5(1) p1(1)];
w = [p2(2) p6(2) p5(2) p1(2)];
z = [p2(3) p6(3) p5(3) p1(3)];
fill3(x,w,z, 1);

x =  [p1(1) p5(1) p8(1) p4(1)];
w =  [p1(2) p5(2) p8(2) p4(2)];
z = [p1(3) p5(3) p8(3) p4(3)];
fill3(x,w,z, 1);


x = [p3(1) p7(1) p8(1) p4(1)];
w = [p3(2) p7(2) p8(2) p4(2)];
z = [p3(3) p7(3) p8(3) p4(3)];
fill3(x,w,z, 1);



a = plot3(y.data(1,:), y.data(2,:), y.data(3,:), 'r') ; %Plotting Minervas trajecory
b = plot3(path(1,:), path(2,:), path(3,:), 'b'); % Plotting the desired path
plot3(WP(:,1), WP(:,2), WP(:,3), 'x'); %Marking the waypoints 

%% Plotting minerva at several time steps 
tsamp = 0.2; 
dec = 667; 
L = [1.4400 0.8200 0.8000]*10; 
for now = [1 500 1000 2001]%1:dec:length(y.data(1,:))
    origin = [y.data(1,now) y.data(2,now) y.data(3,now)]; 
    x=([0 1 1 0 0 0;1 1 0 0 1 1;1 1 0 0 1 1;0 1 1 0 0 0]-0.5)*L(1) + origin(1);
    ned=([0 0 1 1 0 0;0 1 1 0 0 0;0 1 1 0 1 1;0 0 1 1 1 1]-0.5)*L(2) + origin(2);
    z=([0 0 0 0 0 1;0 0 0 0 0 1;1 1 1 1 0 1;1 1 1 1 0 1]-0.5)*L(3) + origin(3);
    boat =[x; ned; z]; 
    
  for i=1:6
    h=patch(boat(1:4,i),boat(5:8,i),boat(9:12,i),'y');
    rotate(h, [0 0 1], y.data(4,now)*rad2deg, origin);
    set(h,'edgecolor','k')
end
       now=now+tsamp*dec;
end

legend([a b h],{'Real trajectory','Desiered Path', 'Minerva'}); 
