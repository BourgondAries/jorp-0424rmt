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

D    = [234 0   0   0;
        0   292 0   0;
        0   0   263 0;
        0   0   0   25];

g = [0,0,5,0];

% Wave model
Omega = diag([1.0,1.1,0.5,0.1]); %TUNING
Lambda = diag([1.0,1.1,1.0,0.2]); %TUNING
Aw = [zeros(4), eye(4); -Omega^2, -2*Lambda*Omega];
Kw = diag([1,1,1,1]); % TUNING
Ew = blkdiag(zeros(4,4), Kw);
Cw = [zeros(4), eye(4)];

% Bias model
Tb = diag([1,1,1,1]); % TUNING (under 0.1 gir ustabilitet. 8 bra for heading)
Eb = diag([1,1,1,1]); % TUNING (får ikke denne til å gi særlig effekt)

% EKF
T = 0.2;
B = [zeros(8,4); zeros(4,4); zeros(4,4); inv(M)];
E = blkdiag(Ew, zeros(4), Eb, zeros(4));
H = [Cw, eye(4), zeros(4), zeros(4)];
Q = zeros(20); % TUNING
R = eye(4)-0.5; % TUNING

% Initial condition of the system
Eta0 = [0; 0; 300; 45*pi/180; 0; 0]';

% Initial values:
x0 = [zeros(1,8),Eta0(1:4),zeros(1,8)];
P0 = eye(20);

% Constant thrust given by the vessel
u = [0, 0, 5, 0]';

% Various states of simulation
CurrentEnabled    = 0;
HiPAPpeaksEnabled = 0;
SensNoiseEnabled  = 1;
WavesEnabled      = 1;
