% Main script
clc; clearvars -except compiled; close all;

if exist('compiled', 'var') == 0
	fprintf('Mexing the subsystem\n');
	mex ./modelR2016bMAC/Subsystem_sf.c ...
		./modelR2016bMAC/Subsystem_sfcn_rtw/rtGetNaN.c ...
		./modelR2016bMAC/Subsystem_sfcn_rtw/rtGetInf.c
	compiled = true;
end

%global iM J D iMD M H B R Q Umax Umin count x_hat_0 P K T;

addpath(genpath('./modelR2016bMAC/'));
modelR2016bMAC;


%D = [234 0   0   0; 0   292 0   0; 0   0   263 0; 0   0   0   25];

% J = @(phi) [cos(phi) -sin(phi) 0 0; ...
%             sin(phi) cos(phi)  0 0; ...
%             0        0         1 0; ...
%             0        0         0 1];
%T = 0.2; 
Eta0 = [0; 0; 2; 45*pi/180; 0; 0]';
CurrentEnabled    = 0;
HiPAPpeaksEnabled = 0;
SensNoiseEnabled  = 0;
WavesEnabled      = 0;


U0 = [0, 0, 5, 0]';
deg2rad = pi/180; 
  
%P = eye(8); 
%K = zeros(8, 5); 
%x_hat_0= [0, 0, 2, 45*deg2rad, 0, 0, 0, 0]; 
%iM = inv(M_tot);
%iMD = iM*(-D);
   
%B = [zeros(4); inv(M_tot)];

