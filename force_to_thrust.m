function y = force_to_thrust( U0 )
global Umin Umax N; 
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
