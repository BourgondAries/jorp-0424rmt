% Output from Mierva: y
% Output from Observer: x_hat

% 1st figure: ROV trajectory in the north-east plane. North on y-axis, east
% on x-axis
figure;
title('ROV trajectory in North-East plane');
xlabel('$e$', 'Tex');
ylabel('$n$', 'Tex');
plot(y(2), y(1), 'LineWidth', 2);
grid on;
legend('Trajectory');

% 2nd figure: Time evolution of n, e, d and psi and nhat, ehat, dhat and
% psihat, using subplot and legends
figure;
subplot(2,2,1);
title('Time evolution of $n$ and $\hat{n}$', 'Tex');
xlabel('Time');
ylabel('$m$', 'Tex');
plot(y(1), 'b', 'LineWidth', 2);
hold on;
plot(x_hat(1), 'r', 'LineWidth', 2);
hold off;
grid on;
legend('$n$', '$\hat{n}$', 'Tex');

subplot(2,2,2);
title('Time evolution of $e$ and $\hat{e}$', 'Tex');
xlabel('Time');
ylabel('$m$', 'Tex');
plot(y(2), 'b', 'LineWidth', 2);
hold on;
plot(x_hat(2), 'r', 'LineWidth', 2);
hold off;
grid on;
legend('$e$', '$\hat{e}$', 'Tex');

subplot(2,2,3);
title('Time evolution of $d$ and $\hat{d}$', 'Tex');
xlabel('Time');
ylabel('$m$', 'Tex');
plot(y(3), 'b', 'LineWidth', 2);
hold on;
plot(x_hat(3), 'r', 'LineWidth', 2);
hold off;
grid on;
legend('$d$', '$\hat{d}$', 'Tex');

subplot(2,2,4);
title('Time evolution of $\psi$ and $\hat{\psi}$', 'Tex');
xlabel('Time');
ylabel('$m$', 'Tex');
plot(y(4), 'b', 'LineWidth', 2);
hold on;
plot(x_hat(4), 'r', 'LineWidth', 2);
hold off;
grid on;
legend('$\psi$', '$\hat{\psi}$', 'Tex');

% 3rd figure: Time evolution of the estimated velocities uhat, vhat, what
% and rhat, using subplot and legends
figure;
subplot(2,2,1);
title('Time evolution of $\hat{u}$', 'Tex');
xlabel('Time');
ylabel('$\frac{m}{s}$', 'Tex');
plot(x_hat(5), 'b', 'LineWidth', 2);
grid on;
legend('$\hat{u}$', 'Tex');

subplot(2,2,2);
title('Time evolution of $\hat{v}$', 'Tex');
xlabel('Time');
ylabel('$\frac{m}{s}$', 'Tex');
plot(x_hat(6), 'b', 'LineWidth', 2);
grid on;
legend('$\hat{v}$', 'Tex');

subplot(2,2,3);
title('Time evolution of $\hat{w}$', 'Tex');
xlabel('Time');
ylabel('$\frac{m}{s}$', 'Tex');
plot(x_hat(7), 'b', 'LineWidth', 2);
grid on;
legend('$\hat{w}$', 'Tex');

subplot(2,2,4);
title('Time evolution of $\hat{r}$', 'Tex');
xlabel('Time');
ylabel('$\frac{m}{s}$', 'Tex');
plot(x_hat(8), 'b', 'LineWidth', 2);
grid on;
legend('$\hat{r}$', 'Tex');
