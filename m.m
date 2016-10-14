% Main script
clc; clear all; close all;

addpath(genpath('./modelR2016bMAC/'));
modelR2016bMAC;

m_rb = [460  0     0   0     55.2  0; ...
        0    460   0   -55.2 0     0; ...
        0    0     460 0     0     0; ...
        0    -55.2 0   56.6  0     0; ...
        55.2 0     0   0     110.6 0; ...
        0    0     0   0     0     105];

m_a = [290 0   0   0   0  0; ...
       0   300 0   0   0  0; ...
       0   0   330 0   0  0; ...
       0   0   0   110 0  0; ...
       0   0   0   0   56 0; ...
       0   0   0   0   0  55];

d_l = [234 0   0   0  0  0; ...
       0   292 0   0  0  0; ...
       0   0   263 0  0  0; ...
       0   0   0   16 0  0; ...
       0   0   0   0  30 0; ...
       0   0   0   0  0  25];

surge_thrust = [-220 480];
sway_thrust  = [-220 220];
heave_thrust = [-180 390];
