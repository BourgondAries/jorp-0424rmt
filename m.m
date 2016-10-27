% Main script
clc; clearvars -except compiled; close all;

if exist('compiled', 'var') == 0
	fprintf('Mexing the subsystem\n');
	mex ./modelR2016bMAC/Subsystem_sf.c ...
		./modelR2016bMAC/Subsystem_sfcn_rtw/rtGetNaN.c ...
		./modelR2016bMAC/Subsystem_sfcn_rtw/rtGetInf.c
	compiled = true;
end

addpath(genpath('./modelR2016bMAC/'));
modelR2016bMAC;

added_mass = [290 0   0   0;
              0   300 0   0;
              0   0   330 0;
              0   0   0   55];

rigid_mass = [460 0   0   0;
              0   460 0   0;
              0   0   460 0;
              0   0   0   105];

big_c     = [1 0 0 0 0 0 0 0 0 0 0 0;
             0 1 0 0 0 0 0 0 0 0 0 0;
             0 0 1 0 0 0 0 0 0 0 0 0;
             0 0 0 1 0 0 0 0 0 0 0 0;
             0 0 0 0 0 0 0 1 0 0 0 0];

big_d     = [234 0   0   0;
             0   292 0   0;
             0   0   263 0;
             0   0   0   25];

wave_frequencies = diag(2*pi./[5, 10, 15, 20]);
wave_dampings    = diag([0.05, 0.1, 0.15, 0.2]);

bias_matrix = diag([0.1, 0.1, 0.1, 0.1]);

Dt = 0.2;
mass = added_mass + rigid_mass;
big_delta = [zeros(4); Dt*(added_mass + rigid_mass)^-1; zeros(4)];
big_omega = 2*wave_dampings.*wave_frequencies;
big_gamma = [zeros(4); wave_frequencies.^2; zeros(4)];

waves = [0, 0, 0, 0];

big_phi   = @(x) [1, 0, 0, -(x(6)*cos(x(4)) + x(5)*sin(x(4)))*Dt, Dt*cos(x(4)), -Dt*sin(x(4)), 0, 0, 0, 0, 0, 0;
             0, 1, 0, (x(5)*cos(x(4)) - x(6)*sin(x(4)))*Dt, Dt*sin(x(4)), Dt*cos(x(4)), 0, 0, 0, 0, 0, 0;
             0, 0, 1, 0, 0, 0, Dt, 0, 0, 0, 0, 0;
             0, 0, 0, 1, 0, 0, 0, Dt, 0, 0, 0, 0;
             0, 0, 0, (x(10)*cos(x(4)) - x(9)*sin(x(4)))*Dt/mass(1,1), -big_d(1,1)*Dt/mass(1,1) + 1, 0, 0, 0, Dt*cos(x(4))/mass(1,1), Dt*sin(x(4))/mass(1,1), 0, 0;
             0, 0, 0, -(x(9)*cos(x(4)) + x(10)*sin(x(4)))*Dt/mass(2,2), 0, -big_d(2,2)*Dt/mass(2,2) + 1, 0, 0, -Dt*sin(x(4))/mass(2,2), Dt*cos(x(4))/mass(2,2), 0, 0;
             0, 0, 0, 0, 0, 0, -big_d(3,3)*Dt/mass(3,3) + 1, 0, 0, 0, Dt/mass(3,3), 0;
             0, 0, 0, 0, 0, 0, 0, -big_d(4,4)*Dt/mass(4,4) + 1, 0, 0, 0, Dt/mass(4,4);
             0, 0, 0, 0, 0, 0, 0, 0, -Dt*bias_matrix(1,1) + 1, 0, 0, 0;
             0, 0, 0, 0, 0, 0, 0, 0, 0, -Dt*bias_matrix(2,2) + 1, 0, 0;
             0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -Dt*bias_matrix(3,3) + 1, 0;
             0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -Dt*bias_matrix(4,4) + 1]

big_k     = [1 0 0 0 0
             0 1 0 0 0
             0 0 1 0 0
             0 0 0 1 0

             0 0 0 0 0
             0 0 0 0 0
             0 0 0 0 0
             0 0 0 0 1

             0 0 0 0 0
             0 0 0 0 0
             0 0 0 0 0
             0 0 0 0 0];

% J = @(phi) [cos(phi) -sin(phi) 0 0; ...
%             sin(phi) cos(phi)  0 0; ...
%             0        0         1 0; ...
%             0        0         0 1];

% Constant thrust given by the vessel
thrust = [0, 0, 5, 0]';

% Initial condition of the system
Eta0 = [0; 0; 2; 45*pi/180; 0; 0]';

% Various states of simulation
CurrentEnabled    = 0;
HiPAPpeaksEnabled = 0;
SensNoiseEnabled  = 0;
WavesEnabled      = 1;
