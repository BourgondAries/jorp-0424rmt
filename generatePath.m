

function path = generatePath(WP)

if(size(WP, 1)) < 2 %stationkeeping
    path = [WP(1, 1) WP(1, 2) WP(1, 3) WP(1, 4)]';

elseif size(WP, 1) == 2 %Going from A to B and/or rotating
    
    if(WP(1,1) ~= WP(2,1) | WP(1,2) ~= WP(2,2) | WP(1,3) ~= WP(2,3) ) % if translatory motion
        points =  ceil(norm(WP(1,1:3) - WP (2,1:3))/9); %defining amount of setpoints 
        
        alpha = atan2(WP(2, 2), WP(2, 1));  %angle to final point
        %creating evenly spaces points on the straight line from A to B
        north = linspace(WP(1, 1), WP(2,1), points);
        east = linspace(WP(1, 2), WP(2,2), points); 
        down  = linspace(WP(1, 3), WP(2,3), points); 
        
        path(1,:) =  [north(1) east(1) down(1) alpha]; %%setting the first point on the path
        if points > 2 %if is to be more than two setpoints 
            for i = 2: points
                path(i,:) =  [north(i) east(i) down(i) alpha];
            end
            path(points + 1,:) = [north(points) east(points) down(points) WP(2, 4)];  %rotating to the desired heading
        else  %if only two setpoints 
            path(points,:) = [north(points) east(points) down(points) WP(2, 4)]; %rotating to the desired heading 
        end
               
        path = path';
        
    else %if ROV is only rotating
        path = [WP(1, 1) WP(1, 2) WP(1, 3) WP(1, 4); WP(2, 1) WP(2, 2) WP(2, 3) WP(2, 4)]';
    end
    
else % If there are  three or more waypoints
    points = ceil(norm(WP(1,1:3) - WP (2,1:3))/9); %defining amount of setpoints 
    
    % creating a cubic spline between the way points 
    CS = cat(1,0,cumsum(sqrt(sum(diff(WP(:,1:3),[],1).^2,2)))); %%creating a cubic spline between the WP
    dd = interp1(CS, WP(:,1:3), unique([CS(:)' linspace(0,CS(end),100)]),'pchip');
    
    
    index = 1;
    for i = 1: points :  size(dd,1)
        alpha = atan2(dd(i,2), dd(i,1));   %angle to next setpoint
        north = dd(i,1);
        east = dd(i,2);
        down  = dd(i,3);
        path(index,:)= [north east down alpha]; %defining setpoint
        index = index + 1;
    end
    path(index, : ) = [WP( size(WP, 1), 1) WP( size(WP, 1), 2) WP( size(WP, 1), 3) WP( size(WP, 1), 4)]; %rotating to desired heading
    path = path';
end

end



