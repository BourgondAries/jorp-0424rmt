% Output from Mierva: y
% Output from Observer: x_hat

% 1st figure: ROV trajectory in the north-east plane. North on y-axis, east
% on x-axis
w = 1;
t = x_hat.time;
rad2deg = 180/pi; 
figure;
plot(y.data(:,2), y.data(:,1), 'LineWidth', w);
grid on;
legend('Trajectory');
title('ROV trajectory in North-East plane');
xlabel('$East$','Interpreter', 'latex');
ylabel('$North$','Interpreter', 'latex');
axis([-5 5 -5 5])

% 2nd figure: Time evolution of n, e, d and psi and nhat, ehat, dhat and
% psihat, using subplot and legends
figure;
subplot(2,2,1);
plot(t,y.data(:,1), 'b', 'LineWidth', w);
hold on;
plot(t,x_hat.data(:,9), 'r', 'LineWidth', w);
hold off;
grid on;
lh = legend('$n$', '$\hat{n}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $n$ and $\hat{n}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$m$','rot', 0,'Interpreter', 'latex');

subplot(2,2,2);
plot(t,y.data(:,2), 'b', 'LineWidth', w);
hold on;
plot(t,x_hat.data(:,10), 'r', 'LineWidth', w);
hold off;
grid on;
lh = legend('$e$', '$\hat{e}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $e$ and $\hat{e}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$m$','rot', 0,'Interpreter', 'latex');

subplot(2,2,3);
plot(t,y.data(:,3), 'b', 'LineWidth', w);
hold on;
plot(t,x_hat.data(:,11), 'r', 'LineWidth', w);
hold off;
grid on;
lh = legend('$d$', '$\hat{d}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $d$ and $\hat{d}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$m$','rot', 0,'Interpreter', 'latex');

subplot(2,2,4);
plot(t,y.data(:,4)*rad2deg, 'b', 'LineWidth', w);
hold on;
plot(t,x_hat.data(:,12)*rad2deg, 'r', 'LineWidth', w);
hold off;
grid on;
lh = legend('$\psi$', '$\hat{\psi}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\psi$ and $\hat{\psi}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$deg$','rot', 0,'Interpreter', 'latex');

% 3rd figure: Time evolution of the estimated velocities uhat, vhat, what
% and rhat, using subplot and legends
figure;
subplot(2,2,1);
plot(t,x_hat.data(:,17), 'b', 'LineWidth', w);
grid on;
lh = legend('$\hat{u}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\hat{u}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$\frac{m}{s}$','rot', 0,'Interpreter', 'latex');

subplot(2,2,2);
plot(t,x_hat.data(:,18), 'b', 'LineWidth', w);
grid on;
lh = legend('$\hat{v}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\hat{v}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$\frac{m}{s}$','rot', 0,'Interpreter', 'latex');

subplot(2,2,3);
plot(t,x_hat.data(:,19), 'b', 'LineWidth', w);
grid on;
lh = legend('$\hat{w}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\hat{w}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$\frac{m}{s}$','rot', 0,'Interpreter', 'latex');

subplot(2,2,4);
plot(t,x_hat.data(:,20)*rad2deg, 'b', 'LineWidth', w);
grid on;
lh = legend('$\hat{r}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\hat{r}$','interpreter', 'latex');
xlabel('Time');
ylabel('$\frac{deg}{s}$','rot', 0,'Interpreter', 'latex');

figure;
plot(t,abs(x_hat.data(:,9)-y.data(:,1)));
hold on;
plot(t,abs(x_hat.data(:,10)-y.data(:,2)));
plot(t,abs(x_hat.data(:,11)-y.data(:,3)));
plot(t,abs(x_hat.data(:,12)-y.data(:,4)));
lh = legend('$\tilde{n}$','$\tilde{e}$','$\tilde{d}$','$\tilde{\psi}$');
set(lh, 'Interpreter', 'latex');
title('Absolute Error of positions', 'Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('Absolute Error', 'Interpreter', 'latex');

figure;
plot(t,(x_hat.data(:,9)-y.data(:,1)).^2);
hold on;
plot(t,(x_hat.data(:,10)-y.data(:,2)).^2);
plot(t,(x_hat.data(:,11)-y.data(:,3)).^2);
plot(t,(x_hat.data(:,12)-y.data(:,4)).^2);
lh = legend('$\tilde{n}$','$\tilde{e}$','$\tilde{d}$','$\tilde{\psi}$');
set(lh, 'Interpreter', 'latex');
title('Square Error of positions','Interpreter', 'latex');
xlabel('Time','Interpreter','latex');
ylabel('Square Error','Interpreter', 'latex');

% 4th figure: Time evolution of the estimated biases b_1, b_2, b_3, and b_6.
% Using subplot and legends
figure; 
subplot(2,2,1);
plot(t,x_hat.data(:,13), 'LineWidth', w);
grid on;
title('Time evolution of bias in surge','Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('Bias ','Interpreter', 'latex');

subplot(2,2,2);
plot(t,x_hat.data(:,14), 'LineWidth', w);
grid on;
title('Time evolution of bias in sway','Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('Bias ','Interpreter', 'latex');

subplot(2,2,3);
plot(t,x_hat.data(:,15), 'LineWidth', w);
grid on;
title('Time evolution of bias in hiv','Interpreter', 'latex');
xlabel('Time','Interpreter', 'latex');
ylabel('Bias ','Interpreter', 'latex');

subplot(2,2,4);
plot(t,x_hat.data(:,16), 'LineWidth', w);
grid on;
title('Time evolution of bias in yaw','Interpreter', 'latex');
xlabel('Time','Interpreter', 'latex');
ylabel('Bias ','Interpreter', 'latex');

