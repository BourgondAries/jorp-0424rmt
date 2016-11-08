% Output from Mierva: y
% Output from Observer: x_hat

w = 1;
t = x_hat.time;
xmax = (length(x_hat.time)-1)*T;
rad2deg = 180/pi;

% 1st figure: ROV trajectory in the north-east plane. North on y-axis, east
% on x-axis
figure;
plot(y.data(2,:), y.data(1,:), 'LineWidth', w);
grid on;
legend('Trajectory');
title('ROV trajectory in North-East plane');
xlabel('$East$','Interpreter', 'latex');
ylabel('$North$','Interpreter', 'latex');
axis([-50 50 -50 50])

% 2nd figure: Time evolution of n, e, d and psi and nhat, ehat, dhat and
% psihat, using subplot and legends
figure;
subplot(2,2,1);
hold on;
plot(t,y.data(1,:), 'LineWidth', w);
plot(t,x_hat.data(9,:));
hold off;
grid on;
lh = legend('$n$', '$\hat{n}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $n$ and $\hat{n}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$m$','rot', 0,'Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,2);
hold on;
plot(t,y.data(2,:), 'LineWidth', w);
plot(t,x_hat.data(10,:));
hold off;
grid on;
lh = legend('$e$', '$\hat{e}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $e$ and $\hat{e}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$m$','rot', 0,'Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,3);
plot(t,y.data(3,:), 'LineWidth', w);
hold on;
plot(t,x_hat.data(11,:), 'LineWidth', w);
hold off;
grid on;
lh = legend('$d$', '$\hat{d}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $d$ and $\hat{d}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$m$','rot', 0,'Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,4);
plot(t,y.data(4,:)*rad2deg, 'LineWidth', w);
hold on;
plot(t,x_hat.data(12,:)*rad2deg, 'LineWidth', w);
hold off;
grid on;
lh = legend('$\psi$', '$\hat{\psi}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\psi$ and $\hat{\psi}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$deg$','rot', 0,'Interpreter', 'latex');
xlim([0 xmax]);

% 3rd figure: Time evolution of the estimated velocities uhat, vhat, what
% and rhat, using subplot and legends
figure;
subplot(2,2,1);
plot(t,x_hat.data(17,:), 'LineWidth', w);
grid on;
lh = legend('$\hat{u}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\hat{u}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$\frac{m}{s}$','rot', 0,'Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,2);
plot(t,x_hat.data(18,:), 'LineWidth', w);
grid on;
lh = legend('$\hat{v}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\hat{v}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$\frac{m}{s}$','rot', 0,'Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,3);
plot(t,x_hat.data(19,:), 'LineWidth', w);
grid on;
lh = legend('$\hat{w}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\hat{w}$','Interpreter', 'latex');
xlabel('Time');
ylabel('$\frac{m}{s}$','rot', 0,'Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,4);
plot(t,x_hat.data(20,:)*rad2deg, 'LineWidth', w);
grid on;
lh = legend('$\hat{r}$');
set(lh, 'Interpreter', 'latex')
title('Time evolution of $\hat{r}$','interpreter', 'latex');
xlabel('Time');
ylabel('$\frac{deg}{s}$','rot', 0,'Interpreter', 'latex');
xlim([0 xmax]);

% 4th figure: Absolute error of positions
figure;
plot(t,abs(x_hat.data(9,:)-y.data(1,:)));
hold on;
plot(t,abs(x_hat.data(10,:)-y.data(2,:)));
plot(t,abs(x_hat.data(11,:)-y.data(3,:)));
lh = legend('$\tilde{n}$','$\tilde{e}$','$\tilde{d}$');
set(lh, 'Interpreter', 'latex');
title('Absolute Error of positions', 'Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('Absolute Error [m]', 'Interpreter', 'latex');
xlim([0 xmax]);

% 5th figure: Absolute error of heading
figure;
plot(t,abs(x_hat.data(12,:)-y.data(4,:))*rad2deg);
lh = legend('$\tilde{\psi}$');
set(lh, 'Interpreter', 'latex');
title('Absolute Error of heading', 'Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('Absolute Error [deg]', 'Interpreter', 'latex');
xlim([0 xmax]);

% 6th figure: Time evolution of the estimated biases b_1, b_2, b_3, and b_6.
% Using subplot and legends
figure;
subplot(2,2,1);
plot(t,x_hat.data(13,:), 'LineWidth', w);
grid on;
title('Time evolution of bias in surge','Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('Bias ','Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,2);
plot(t,x_hat.data(14,:), 'LineWidth', w);
grid on;
title('Time evolution of bias in sway','Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('Bias ','Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,3);
plot(t,x_hat.data(15,:), 'LineWidth', w);
grid on;
title('Time evolution of bias in heave','Interpreter', 'latex');
xlabel('Time','Interpreter', 'latex');
ylabel('Bias ','Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,4);
plot(t,x_hat.data(16,:), 'LineWidth', w);
grid on;
title('Time evolution of bias in yaw','Interpreter', 'latex');
xlabel('Time','Interpreter', 'latex');
ylabel('Bias ','Interpreter', 'latex');
xlim([0 xmax]);

% 7th figure: Time evolution of the thrust commands from the controller and
% thruster set points
figure;
subplot(2,2,1);
plot(t,tau.data(1,:), 'LineWidth', w);
plot(t,u.data(1,:), 'LineWidth', w);
plot(t,u.data(2,:), 'LineWidth', w);
lh = legend('$\tau_c^x$', 'THS', 'THP');
set(lh, 'Interpreter', 'latex');
grid on;
title('Time evolution of thrust command in surge','Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('Thrust','Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,2);
plot(t,tau.data(2,:), 'LineWidth', w);
plot(t,u.data(1,:), 'LineWidth', w);
plot(t,u.data(2,:), 'LineWidth', w);
plot(t,u.data(3,:), 'LineWidth', w);
lh = legend('$\tau_c^y$', 'THS', 'THP', 'THL');
set(lh, 'Interpreter', 'latex');
grid on;
title('Time evolution of thrust command in sway','Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('Thrust','Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,3);
plot(t,tau.data(3,:), 'LineWidth', w);
plot(t,u.data(4,:), 'LineWidth', w);
plot(t,u.data(5,:), 'LineWidth', w);
lh = legend('$\tau_c^z$', 'TVS', 'TVP');
set(lh, 'Interpreter', 'latex');
grid on;
title('Time evolution of thrust command in heave','Interpreter', 'latex');
xlabel('Time','Interpreter', 'latex');
ylabel('Thrust','Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,4);
plot(t,tau.data(4,:), 'LineWidth', w);
plot(t,u.data(1,:), 'LineWidth', w);
plot(t,u.data(2,:), 'LineWidth', w);
plot(t,u.data(3,:), 'LineWidth', w);
lh = legend('$\tau_c^{\psi}$', 'THS', 'THP', 'THL');
grid on;
title('Time evolution of thrust command in yaw','Interpreter', 'latex');
xlabel('Time','Interpreter', 'latex');
ylabel('Thrust','Interpreter', 'latex');
xlim([0 xmax]);


% 9th figure: Time evolution of the error between observer output and
% reference signal
figure;
subplot(2,2,1);
plot(t,pos_err.data(1,:), 'LineWidth', w);
grid on;
title('Time evolution of error in surge','Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('$e_x$','Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,2);
plot(t,pos_err.data(2,:), 'LineWidth', w);
grid on;
title('Time evolution of error in sway','Interpreter', 'latex');
xlabel('Time', 'Interpreter','latex');
ylabel('$e_y$','Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,3);
plot(t,pos_err.data(3,:), 'LineWidth', w);
grid on;
title('Time evolution of error in heave','Interpreter', 'latex');
xlabel('Time','Interpreter', 'latex');
ylabel('$e_z$','Interpreter', 'latex');
xlim([0 xmax]);

subplot(2,2,4);
plot(t,pos_err.data(4,:)*rad2deg, 'LineWidth', w);
grid on;
title('Time evolution of error in yaw','Interpreter', 'latex');
xlabel('Time','Interpreter', 'latex');
ylabel('$e_{\psi}$','Interpreter', 'latex');
xlim([0 xmax]);


switch model_case
    case 9
        plot_obstacle;
end