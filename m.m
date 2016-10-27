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

big_delta = 0;
big_gamma = 0;
big_phi   = 0;
big_c     = 0;
big_k     = 0;
D = [234 0   0   0; 0   292 0   0; 0   0   263 0; 0   0   0   25];

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
