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

% Example case, decides initial condition and thrust
model_case = 7;

% Various states of simulation
CurrentEnabled    = 1;
HiPAPpeaksEnabled = 1;
SensNoiseEnabled  = 1;
WavesEnabled      = 1;

% Defining constants for framsforming between radians and degrees
deg2rad = pi/180;
rad2deg = 180/pi;

% Vessel model
Ma = [290 0   0   0;
      0   300 0   0;
      0   0   330 0;
      0   0   0   55];

Mrb = [460 0   0   0;
       0   460 0   0;
       0   0   460 0;
       0   0   0   105];

M = Ma + Mrb;

D = [234 0   0   0;
     0   292 0   0;
     0   0   263 0;
     0   0   0   25];

g = [0,0,5,0];

%Thrust allocation matrix
N = [0.5077    0.4994         0   -3.0084;
     0.5077   -0.4994         0    3.0084;
     0         0.8266         0    1.0448;
     0         0              0.5000         0;
     0         0              0.5000         0];
tau_max = [480,  220,  390,  36]';
tau_min = [-220, -220, -180, -36]';

% Wave model
Omega = diag([0.7,0.7,0.7,3]); % TUNING
Lambda = diag([0.06,0.06,0.02,0.1]); % TUNING
Aw = [zeros(4), eye(4); -Omega^2, -2*Lambda*Omega];
Kw = diag([0.2,0.2,1.0,0.2]); % TUNING
Ew = blkdiag(zeros(4,4), Kw);
Cw = [zeros(4), eye(4)];

% Bias model
Tb = diag([10,5,85,100]); % TUNING
Eb = diag([30,30,20,1]); % TUNING

% EKF
T = 0.2;
B = [zeros(8,4); zeros(4,4); zeros(4,4); inv(M)];
E = blkdiag(Ew, zeros(4), Eb, zeros(4));
H = [Cw, eye(4), zeros(4), zeros(4)];
Q = blkdiag(zeros(4), diag([10,10,10,10]), 0.1*eye(4), diag([0.1,0.1,0.1,0.1]), 0.1*eye(4)); % TUNING
R = diag([0.014, 0.0141, 0.0148, 7.5122e-5]); % TUNING

% Controller
% Tuned for less than 0.2 m error in surge and sway, 0.1 m in heave and 2
% degrees in yaw during 240 seconds
Gp = diag([500 500 150 150]);
Gd = diag([900 900 30 800]);
Gi = -diag([10 10 10 10]);
Gpd = [Gp Gd];


switch model_case
	case 1
		% Initial condition of the system
		Eta0 = [0; 0; 2; 0; 0; 45*pi/180]';
		% Constant thrust given by the vessel
		u = [0, 0, 5, 0]';
	case 2
		Eta0 = [0; 0; 300; 0; 0; 45*pi/180]';
		u = [300, 0, 0, 0]';
	case 3
		Eta0 = [0; 0; 300; 0; 0; 45*pi/180]';
		u = [100, 0, 0, 0.2]';
	case 4
		Eta0 = [0; 0; 1; 0; 0; 45*pi/180]';
		u = [0, 0, 320, 0.012]';
	case 5
		Eta0 = [0; 0; 200; 0; 0; 0;]';
		pos.x = [Eta0(1)];
		pos.y = [Eta0(2)] ;
		pos.z = [Eta0(3)];
		pos.psi = [Eta0(6)];
		time = 240;
	case 6
		Eta0 = [0; 0; 200; 0; 0; 0;]';
		pos.x = [0];
		pos.y = [0] ;
		pos.z = [200];
		pos.psi =[-40*deg2rad ];
		time = 240;
	case 7
		Eta0 = [0; 0; 200; 0; 0; 0;]';
		pos.x = [0 100 100];
		pos.y = [0 60 60] ;
		pos.z = [200 150 150];
		pos.psi = [30 30 320]*deg2rad;
		time = 640;
	case 8
		Eta0 = [0; 0; 1; 0; 0; 0;]';
		pos.x = [10];
		pos.y = [Eta0(2)] ;
		pos.z = [5];
		pos.psi = [Eta0(6)];
		time = 240;
	case 9 % Extra 3.3
		Eta0 = [0; 0; 200; 0; 0; 0;]';
		pos.x = [30 100];
		pos.y = [5 60] ;
		pos.z = [145 150];
		pos.psi = [160*deg2rad 320*deg2rad];
		time = 240;
end

% Anti-windup precaution matrix
Awi = 0*eye(4);

% Anti-windup constant (Is*tau_max and Is*tau_min)
Is  = [1 0 0 0;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];

% Initial values:
x0 = [zeros(1,8),Eta0(1:3),Eta0(6),zeros(1,8)];
P0 = blkdiag(eye(8), eye(4)*10, eye(4), eye(4));
e0 = [0 0 0 0]';
u0 = [0 0 0 0]';

% Trajectory generation
path = [pos.x(:) pos.y(:) pos.z(:) pos.psi(:)]';
