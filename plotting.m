% Output from Mierva: y
% Output from Observer: x_hat

close all;

% Plotting variables for sizes and conversions
width = 1;
t = x_hat.time;
xmax = (length(x_hat.time)-1)*T;
rad2deg = 180/pi;
ticksize = 12;
xlabelsize = 14;
ylabelsize = 14;
titlesize = 36;
legendsize = 12;
figsize1 = [100,100,1800,600];
figsize2 = [100,100,800,600];

% 1st figure: ROV trajectory in the north-east plane. North on y-axis, east
% on x-axis
fh = figure;
set(fh, 'Position', figsize2);
plot(y.data(2,:), y.data(1,:), 'LineWidth', width);
grid on;
lh = legend('Trajectory');
set(lh, 'FontSize', legendsize)
title('ROV trajectory in North-East plane', 'FontSize', titlesize);
xlabel('East', 'FontSize', xlabelsize);
ylabel('North', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
axis([-50 50 -50 50])

% 2nd figure: Time evolution of n, e, d and psi and nhat, ehat, dhat and
% psihat, using subplot and legends
fh = figure;
set(fh, 'Position', figsize1);

subplot(2,2,1);
hold on;
plot(t,y.data(1,:), 'LineWidth', width);
plot(t,x_hat.data(9,:));
hold off;
grid on;
lh = legend('$n$', '$\hat{n}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize)
title('\fontseries{b}\fontsize{0.45cm}{0.4cm}\selectfont Time evolution of $n$ and $\hat{n}$','Interpreter', 'latex', 'FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Position [m]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,2);
hold on;
plot(t,y.data(2,:), 'LineWidth', width);
plot(t,x_hat.data(10,:));
hold off;
grid on;
lh = legend('$e$', '$\hat{e}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
title('\fontseries{b}\fontsize{0.45cm}{0.4cm}\selectfont Time evolution of $e$ and $\hat{e}$','Interpreter', 'latex', 'FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Position [m]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,3);
plot(t,y.data(3,:), 'LineWidth', width);
hold on;
plot(t,x_hat.data(11,:), 'LineWidth', width);
hold off;
grid on;
lh = legend('$d$', '$\hat{d}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize)
title('\fontseries{b}\fontsize{0.45cm}{0.4cm}\selectfont Time evolution of $d$ and $\hat{d}$','Interpreter', 'latex', 'FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Position [m]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,4);
plot(t,y.data(4,:)*rad2deg, 'LineWidth', width);
hold on;
plot(t,x_hat.data(12,:)*rad2deg, 'LineWidth', width);
hold off;
grid on;
lh = legend('$\psi$', '$\hat{\psi}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize)
title('\fontseries{b}\fontsize{0.45cm}{0.4cm}\selectfont Time evolution of $\psi$ and $\hat{\psi}$','Interpreter', 'latex', 'FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Heading [deg]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

% 3rd figure: Time evolution of the estimated velocities uhat, vhat, what
% and rhat, using subplot and legends
fh = figure;
set(fh, 'Position', figsize1);
subplot(2,2,1);
plot(t,x_hat.data(17,:), 'LineWidth', width);
grid on;
lh = legend('$\hat{u}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize)
title('\fontseries{b}\fontsize{0.45cm}{0.4cm}\selectfont Time evolution of $\hat{u}$','Interpreter', 'latex', 'FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Velocity [m/s]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,2);
plot(t,x_hat.data(18,:), 'LineWidth', width);
grid on;
lh = legend('$\hat{v}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize)
title('\fontseries{b}\fontsize{0.45cm}{0.4cm}\selectfont Time evolution of $\hat{v}$','Interpreter', 'latex', 'FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Velocity [m/s]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,3);
plot(t,x_hat.data(19,:), 'LineWidth', width);
grid on;
lh = legend('$\hat{w}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize)
title('\fontseries{b}\fontsize{0.45cm}{0.4cm}\selectfont Time evolution of $\hat{w}$','Interpreter', 'latex', 'FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Velocity [m/s]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,4);
plot(t,y.data(5,:)*rad2deg, 'LineWidth', width, 'Color', [0.8500 0.3250 0.0980]);
hold on;
plot(t,x_hat.data(20,:)*rad2deg, 'LineWidth', width, 'Color', [0 0.4470 0.7410]);
grid on;
lh = legend('$r$', '$\hat{r}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize)
title('\fontseries{b}\fontsize{0.45cm}{0.4cm}\selectfont Time evolution of $\hat{r}$','interpreter', 'latex', 'FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Angular velocity [deg/s]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

% % 4th figure: Absolute error of positions
% fh = figure;
% set(fh, 'Position', fs);
% plot(t,abs(x_hat.data(9,:)-y.data(1,:)));
% hold on;
% plot(t,abs(x_hat.data(10,:)-y.data(2,:)));
% plot(t,abs(x_hat.data(11,:)-y.data(3,:)));
% lh = legend('$\tilde{n}$','$\tilde{e}$','$\tilde{d}$');
% set(lh, 'Interpreter', 'latex', 'FontSize', ls);
% title('Absolute Error of positions', 'Interpreter', 'latex', 'FontSize', ts);
% xlabel('Time [s]', 'FontSize', xls);
% ylabel('Absolute Error [m]', 'FontSize', yls);
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', tls)
% yt = get(gca, 'YTick');
% set(gca, 'FontSize', tls)
% xlim([0 xmax]);
% 
% % 5th figure: Absolute error of heading
% fh = figure;
% set(fh, 'Position', fs);
% plot(t,abs(x_hat.data(12,:)-y.data(4,:))*rad2deg);
% lh = legend('$\tilde{\psi}$');
% set(lh, 'Interpreter', 'latex', 'FontSize', ls);
% title('Absolute Error of heading', 'Interpreter', 'latex', 'FontSize', ts);
% xlabel('Time [s]', 'FontSize', xls);
% ylabel('Absolute Error [deg]', 'Interpreter', 'latex', 'FontSize', yls);
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', tls)
% yt = get(gca, 'YTick');
% set(gca, 'FontSize', tls)
% xlim([0 xmax]);

% 6th figure: Time evolution of the estimated biases b_1, b_2, b_3, and b_6.
% Using subplot and legends
fh = figure;
set(fh, 'Position', figsize1);
subplot(2,2,1);
plot(t,x_hat.data(13,:), 'LineWidth', width);
lh = legend('$b_1$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of bias in surge','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Bias [N]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,2);
plot(t,x_hat.data(14,:), 'LineWidth', width);
lh = legend('$b_2$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of bias in sway','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Bias [N]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,3);
plot(t,x_hat.data(15,:), 'LineWidth', width);
lh = legend('$b_3$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of bias in heave','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Bias [N]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,4);
plot(t,x_hat.data(16,:), 'LineWidth', width);
lh = legend('$b_6$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of bias in yaw','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Bias [Nm]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

% 7th figure: Time evolution of the thrust commands from the controller and
% thruster set points
fh = figure;
set(fh, 'Position', figsize1);
subplot(2,2,1);
t = transpose(t);
plot(t,tau.data(1,:), 'LineWidth', width);
hold on;
plot(t,u.data(1,:), 'LineWidth', width);
plot(t,u.data(2,:), 'LineWidth', width);
lh = legend('$\tau_x$', 'THS', 'THP');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of thrust command in surge', 'FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Thrust [N]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,2);
plot(t,tau.data(2,:), 'LineWidth', width);
hold on;
plot(t,u.data(1,:), 'LineWidth', width);
plot(t,u.data(2,:), 'LineWidth', width);
plot(t,u.data(3,:), 'LineWidth', width);
lh = legend('$\tau_y$', 'THS', 'THP', 'THL');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of thrust command in sway','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Thrust [N]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,3);
plot(t,tau.data(3,:), 'LineWidth', width);
hold on;
plot(t,u.data(4,:), 'LineWidth', width);
plot(t,u.data(5,:), 'LineWidth', width);
lh = legend('$\tau_z$', 'TVS', 'TVP');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of thrust command in heave','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Thrust [N]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,4);
plot(t,tau.data(4,:), 'LineWidth', width);
hold on;
plot(t,u.data(1,:), 'LineWidth', width);
plot(t,u.data(2,:), 'LineWidth', width);
plot(t,u.data(3,:), 'LineWidth', width);
lh = legend('$\tau_{\psi}$', 'THS', 'THP', 'THL');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of thrust command in yaw','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Thrust [Nm]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);


% 8th figure: Time evolution of the error between observer output and
% reference signal
fh = figure;
set(fh, 'Position', figsize1);
subplot(2,2,1);
plot(t,pos_err.data(:,1), 'LineWidth', width);
lh = legend('$\tilde{n}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of error in surge','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Error [m]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,2);
plot(t,pos_err.data(:,2), 'LineWidth', width);
lh = legend('$\tilde{e}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of error in sway','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Error [m]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,3);
plot(t,pos_err.data(:,3), 'LineWidth', width);
lh = legend('$\tilde{d}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of error in heave','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Error [m]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);

subplot(2,2,4);
plot(t,pos_err.data(:,4)*rad2deg, 'LineWidth', width);
lh = legend('$\tilde{\psi}$');
set(lh, 'Interpreter', 'latex', 'FontSize', legendsize);
grid on;
title('Time evolution of error in yaw','FontSize', titlesize);
xlabel('Time [s]', 'FontSize', xlabelsize);
ylabel('Error [deg]', 'FontSize', ylabelsize);
xt = get(gca, 'XTick');
set(gca, 'FontSize', ticksize)
yt = get(gca, 'YTick');
set(gca, 'FontSize', ticksize)
xlim([0 xmax]);


switch model_case
    case 9
        plot_obstacle;
end

% Mean errors between xhat and xref
mean_errx = mean(abs(pos_err.data(:,1)));
mean_erry = mean(abs(pos_err.data(:,2)));
mean_errz = mean(abs(pos_err.data(:,3)));
mean_errpsi = mean(abs(pos_err.data(:,4)))*rad2deg;
