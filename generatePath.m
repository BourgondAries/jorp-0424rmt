

function path = generatePath(WP)

path = [];
if(size(WP, 1)) < 2 %stationkeeping
    path = [WP(1, 1) WP(1, 2) WP(1, 3) WP(1, 4)];
    
elseif size(WP, 1) == 2 %Going from A to B and/or rotating 
    
    if(WP(1,1) ~= WP(2,1) | WP(1,2) ~= WP(2,2) | WP(1,3) ~= WP(2,3) ) % if translatory motion
        points = 4;
        alpha = atan2(WP(2, 2), WP(2, 1));  %angle to final point
        north = linspace(WP(1, 1), WP(2,1), points); %crating points on the straight line
        east = linspace(WP(1, 2), WP(2,2), points); %crating points on the straight line
        down  = linspace(WP(1, 3), WP(2,3), points); %crating points on the straight line
        
        for i = 1: points
            path(:,i) =  [north(i) east(i) down(i) alpha];
        end
        
        path(points + 1,:) = [north(points) east(points) down(points) WP(2, 4)];
        
    else %if only rotating
        path = [WP(1, 1) WP(1, 2) WP(1, 3) WP(1, 4); WP(2, 1) WP(2, 2) WP(2, 3) WP(2, 4)]';
    end
    
end



