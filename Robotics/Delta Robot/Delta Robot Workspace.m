%% Constructing Delta Robot's Ideal Workspace.
% Based on the approach in [1], and the forward kinematics model in [2].

% Defining delta robot dimensions.
e  =  173.2051; 
f  =  692.8203;
l2 =  1000;
l1 =  300 ;

% Some constants like installation angles trig functions for simplicty. 
sqrt3 = sqrt(3.0);
pi     = 3.141592653;
sin120 = sqrt3 / 2.0;
cos120 = -0.5;
tan60  = sqrt3;
sin30  = 0.5;
tan30  = 1.0 / sqrt3;

% Generation of 50 angles of each active joint(Acting Motor.
theta_1 = linspace(-30,90,50);
theta_2 = linspace(-30,90,50);
theta_3 = linspace(-30,90,50);

% Forming all the possible combinations of the active joints angles.
cell = {theta_1, theta_2, theta_3};
angles_cell = cell;
[angles_cell{:}] = ndgrid(cell{:});
combinations = cell2mat(cellfun(@(m)m(:), angles_cell,'uni',0));

% Storing output points. 
ideal_points=[];

for i =1:125000
    u=[combinations(i,1),combinations(i,2),combinations(i,3)];
     
    %................. Forward Kinematics.........................%
    theta1 =u(1);
    theta2 =u(2);
    theta3 =u(3);
    t = (f-e) * tan30 / 2.0;
    
    % Converting all angles to radian.
    dtr = pi / 180.0; % degree to radian conversion.
    theta1 =theta1.*dtr;
    theta2 =theta2.*dtr;
    theta3 =theta3.*dtr;
    
    % Using the FK model found in [2]
    y1 = -(t + l1.*cos(theta1));
    z1 = -l1 .* sin(theta1);

    y2 = (t + l1.*cos(theta2)) .* sin30;
    x2 = y2 .* tan60;
    z2 = -l1 .* sin(theta2);

    y3 = (t + l1.*cos(theta3)) .* sin30;
    x3 = -y3 .* tan60;
    z3 = -l1 .* sin(theta3);

    dnm = (y2-y1).*x3 - (y3-y1).*x2;

    w1 = y1.*y1 + z1.*z1;
    w2 = x2.*x2 + y2.*y2 + z2.*z2;
    w3 = x3.*x3 + y3.*y3 + z3.*z3;

    % x = (a1*z + b1)/dnm
    a1 = (z2-z1).*(y3-y1) - (z3-z1).*(y2-y1);
    b1= -( (w2-w1).*(y3-y1) - (w3-w1).*(y2-y1) ) ./ 2.0;

    % y = (a2*z + b2)/dnm
    a2 = -(z2-z1).*x3 + (z3-z1).*x2;
    b2 = ( (w2-w1).*x3 - (w3-w1).*x2) ./ 2.0;
   
    % After summing and simplification, it is found that 
    % a*z^2 + b*z + c = 0
    a = a1.*a1 + a2.*a2 + dnm.*dnm;
    b = 2.0 .* (a1.*b1 + a2.*(b2 - y1.*dnm) - z1.*dnm.*dnm);
    c = (b2 - y1.*dnm).*(b2 - y1.*dnm) + b1.*b1 + dnm.*dnm.*(z1.*z1 - l2.*l2);

    % Discriminant
    d = b.*b - 4.0.*a.*c;
    
    if d < 0.0
        valid_point= [0,0,0]; % non-existing povar. 
    else
        % Calculating the indicies of the valid point in the 3D space.
        z0 = -0.5.*(b + sqrt(d)) ./ a;
        x0 = (a1.*z0 + b1) ./ dnm;
        y0 = (a2.*z0 + b2) ./ dnm;

        valid_point =[x0,y0,z0];
    end
     
     ideal_points=[ideal_points;valid_point];
     
end

% Plotting 3D point cloud

figure(1)
pcshow(Ideal_points) 
title('Delta Robot ideal Workspace')
xlabel('X (mm)')
ylabel('Y (mm)')
zlabel('Z (mm)')

%% Constructing Delta Robot's Effective Workspace.
% Based on the model in [4],[5].

% Defining delta robot's installation angles.
phai_i   = [0, 2*pi/3, -2*pi/3];

% Extracting the indecies of the point found previouslly. 
x        =ideal_points(:,1);
y        =ideal_points(:,2);
z        =ideal_points(:,3);

% Variables used to get theta_3i.
b_2i     = zeros(3,1);
theta_3i = zeros(3,1);

% Storing output points. 
angle3 = [];

for j = 1:1:length(x) 
    
    for i = 1:1:3 
        % Using the formula found in [2]
        b_2i(i)     = -1*sin(phai_i(i)) *x(j) + cos(phai_i(i)) *y(j);
        theta_3i(i) =  acos(b_2i(i)/l2);       
    end
    
    angle3 = [angle3,theta_3i];
    
end   

% Finding the min & max of each set of the three angles and checking 
% whether they violate the physical restrictions.
actual_points_indecies=[];

for ii=1:length(angle3)
    
    maxx = max (angle3(:,ii))*180/pi;
    minn = min (angle3(:,ii))*180/pi;
    
    if minn >62 && maxx<118 % From Soildworks simulation.
      actual_points_indecies=[actual_points_indecies,ii];  
    end 
    
end     

actual_points=[ideal_points(actual_points_indecies,1),...
               ideal_points(actual_points_indecies,2),...
               ideal_points(actual_points_indecies,3)];
               
% Plotting 3D point cloud.
figure(2)
pcshow(Effective_points) 
title('Delta Robot actual Workspace')
xlabel('X (mm)')
ylabel('Y (mm)')
zlabel('Z (mm)')
%% Finding the Operation Region and Mounting Height.

actual_Z=actual_points(:,3);

% Calculating the total height of the effective workspace.
z_min=min(actual_Z);
z_max=max(actual_Z);
index=round(abs(z_max-z_min));

Lengthx=zeros(index,1);

for i=0:1:index
    
    Num_points=[];
    % Slicing the workspace.
    z_interval=z_max-200-1;
    
    % Storing all the points that are contained in the slice.
    for j =1:length(actual_Z)
        if actual_Z(j)> z_interval && actual_Z(j)< z_max 
           Num_points=[Num_points,actual_Z(j)];   
        end 
    end
    
    % Storing the number of pints in each slice.
    Lengthx(i+1)=length(Num_points);
    z_max=z_max-1;
    
end

% Determining the slice that contain the maximum number of points.
Zmax_final=max(actual_Z)- find(Lengthx==max(Lengthx));
Zmin_final=max(actual_Z)- find(Lengthx==max(Lengthx))-200;

%Extracting that sklice from the effective workspace.
operational_indecies=[];

for k =1:length(actual_Z)
    if (actual_Z(k)<Zmax_final && actual_Z(k)>Zmin_final )
        operational_indecies=[operational_indecies,k];
    end   
end     

operational_points=[actual_points(operational_indecies,1),...
                    actual_points(operational_indecies,2),...
                    actual_points(operational_indecies,3)];

% Plotting 3D point cloud.                
figure(3)
pcshow(operational_points) 
title('Delta Robot operation region Workspace')
xlabel('X (mm)')
ylabel('Y (mm)')
zlabel('Z (mm)')

