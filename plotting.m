% Output from Mierva: y
% Output from Observer: x_hat

% 1st figure: ROV trajectory in the north-east plane. North on y-axis, east
% on x-axis
w = 1.5;

figure;
title('ROV trajectory in North-East plane');
xlabel('$e$','Interpreter', 'Tex');
ylabel('$n$','Interpreter', 'Tex');
plot(y.data(:,2), y.data(:,1), 'LineWidth', w);
grid on;
legend('Trajectory');

% 2nd figure: Time evolution of n, e, d and psi and nhat, ehat, dhat and
% psihat, using subplot and legends
figure;
subplot(2,2,1);
xlabel('Time');
ylabel('$m$','Interpreter', 'latex');
plot(y.data(:,1), 'b', 'LineWidth', w);
title('Time evolution of $n$ and $\hat{n}$','Interpreter', 'latex');
hold on;
plot(x_hat.data(:,1), 'r', 'LineWidth', w);
hold off;
grid on;
lh = legend('$n$', '$\hat{n}$');
set(lh, 'Interpreter', 'latex')

subplot(2,2,2);
xlabel('Time');
ylabel('$m$','Interpreter', 'latex');
plot(y.data(:,2), 'b', 'LineWidth', w);
title('Time evolution of $e$ and $\hat{e}$','Interpreter', 'latex');
hold on;
plot(x_hat.data(:,2), 'r', 'LineWidth', w);
hold off;
grid on;
lh = legend('$e$', '$\hat{e}$');
set(lh, 'Interpreter', 'latex')

subplot(2,2,3);
xlabel('Time');
ylabel('$m$','Interpreter', 'latex');
plot(y.data(:,3), 'b', 'LineWidth', w);
title('Time evolution of $d$ and $\hat{d}$','Interpreter', 'latex');
hold on;
plot(x_hat.data(:,3), 'r', 'LineWidth', w);
hold off;
grid on;
lh = legend('$d$', '$\hat{d}$');
set(lh, 'Interpreter', 'latex')

subplot(2,2,4);
xlabel('Time');
ylabel('$m$','Interpreter', 'latex');
plot(y.data(:,4), 'b', 'LineWidth', w);
title('Time evolution of $\psi$ and $\hat{\psi}$','Interpreter', 'latex');
hold on;
plot(x_hat.data(:,4), 'r', 'LineWidth', w);
hold off;
grid on;
lh = legend('$\psi$', '$\hat{\psi}$');
set(lh, 'Interpreter', 'latex')

% 3rd figure: Time evolution of the estimated velocities uhat, vhat, what
% and rhat, using subplot and legends
figure;
subplot(2,2,1);

xlabel('Time');
ylabel('$\frac{m}{s}$','Interpreter', 'latex');
plot(x_hat.data(:,5), 'b', 'LineWidth', w);
title('Time evolution of $\hat{u}$','Interpreter', 'latex');
grid on;
lh = legend('$\hat{u}$');
set(lh, 'Interpreter', 'latex')

subplot(2,2,2);
xlabel('Time');
ylabel('$\frac{m}{s}$','Interpreter', 'latex');
plot(x_hat.data(:,6), 'b', 'LineWidth', w);
title('Time evolution of $\hat{v}$','Interpreter', 'latex');
grid on;
lh = legend('$\hat{v}$');
set(lh, 'Interpreter', 'latex')

subplot(2,2,3);
xlabel('Time');
ylabel('$\frac{m}{s}$','Interpreter', 'latex');
plot(x_hat.data(:,7), 'b', 'LineWidth', w);
title('Time evolution of $\hat{w}$','Interpreter', 'latex');
grid on;
lh = legend('$\hat{w}$');
set(lh, 'Interpreter', 'latex')

subplot(2,2,4);
xlabel('Time');
ylabel('$\frac{m}{s}$','Interpreter', 'latex');
plot(x_hat.data(:,8), 'b', 'LineWidth', w);
title('Time evolution of $\hat{r}$','interpreter', 'latex');
grid on;
lh = legend('$\hat{r}$');
set(lh, 'Interpreter', 'latex')