function y = dowhatiwant( U0 )
%DOWHATIWANT Summary of this function goes here
%   Detailed explanation goes here
Umax = [480, 220, 390, inf]; 
Umin = [-220, -220, -180, -inf];
N = [0.5077 0.7646  0   -4.6062; ...
     0.5077 -0.7646 0   4.6062; ...
     0      1.2656  0   -1.5997; ...
     0      0       0.5 0; ...
     0      0       0.5 0];
f = N*U0; 

for i = 1:3
if f(i) < Umin(i); 
    f(i) = Umin(i);
elseif f(i) > Umax(i) 
        f(i) = Umax(i);
end
end


y = f;

end

