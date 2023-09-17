tic;
%[s]Starts the program timer.

clc;
%[]Clears the command window.

clear;
%[]Clears the variable workspace.

format('Compact');
%[]Makes the command window output single-space.

format('LongG');
%[]Sets the command window to display 16 digits per variable.

close('All');
%[]Closes all figures.

%%
%[]LOAD VEHICLE DATA:

load('Vehicle.mat');
%[]Loads the vehicle data;

%%
%[]WINDOW AND AXES DEVELOPMENT:

ScreenSize = get(0,'ScreenSize');
%[]Determines the location and dimensions of the current monitor.

Window = figure( ...
    'Color','w', ...
    'Name','VEHICLE ANIMATION', ...
    'NumberTitle','Off', ...
    'OuterPosition',ScreenSize);
%[]Initiates a window and adjusts its properties.

Extent = 3;
%[]Axes limits.

Axes = axes( ...
    'CameraPosition',Extent*[1,1,1], ...
    'CameraTarget',[0,0,0], ...
    'FontName','Arial', ...
    'FontSize',12, ...
    'FontWeight','Bold', ...
    'NextPlot','Add', ...
    'Parent',Window, ...
    'PlotBoxAspectRatio',[1,1,1], ...
    'XGrid','On', ...
    'YGrid','On', ...
    'ZGrid','On', ...
    'XLim',Extent * [-1,1], ...
    'YLim',Extent * [-1,1], ...
    'ZLim',Extent * [-1,1], ...
    'XTick',Extent*(-1:0.2:1), ...
    'YTick',Extent*(-1:0.2:1), ...
    'ZTick',Extent*(-1:0.2:1));
%[]Adds an axes to the specified window and adjusts its properties.

xlabel('Inertial X-Axis (m)','FontSize',16,'Parent',Axes);
%[]Adds a label to the specified axis and adjusts its properties.

ylabel('Inertial y-Axis (m)','FontSize',16,'Parent',Axes);
%[]Adds a label to the specified axis and adjusts its properties.

zlabel('Inertial Z-Axis (m)','FontSize',16,'Parent',Axes);
%[]Adds a label to the specified axis and adjusts its properties.

%%
%[]VEHICLE INTEGRATION:

Vehicle(1) = mesh(xc1,yc1,zc1,'FaceColor','k','EdgeColor','k');
%[]Vehicle.

Vehicle(2) = mesh(x,y,z,'FaceColor','r','EdgeColor','r');
%[]Vehicle body x-axis.

Vehicle(3) = mesh(xc2,yc2,zc2,'FaceColor','r','EdgeColor','r');
%[]Vehicle body x-axis direction.

rotate(Vehicle(1),[0,1,0],90);
%[]Rotates the vehicle orientation.

rotate(Vehicle(2),[0,1,0],90);
%[]Rotates the body x-axis orientation.

rotate(Vehicle(3),[0,1,0],90);
%[]Rotates the body x-axis orientation.

Vehicle(4) = mesh(x,y,z,'FaceColor','g','EdgeColor','g');
%[]Vehicle body y-axis.

Vehicle(5) = mesh(xc2,yc2,zc2,'FaceColor','g','EdgeColor','g');
%[]Vehicle body y-axis direction.

rotate(Vehicle(4),[1,0,0],-90);
%[]Rotates the body y-axis orientation.

rotate(Vehicle(5),[1,0,0],-90);
%[]Rotates the body y-axis orientation.

Vehicle(6) = mesh(x,y,z,'FaceColor','b','EdgeColor','b');
%[]Vehicle body z-axis.

Vehicle(7) = mesh(xc2,yc2,zc2,'FaceColor','b','EdgeColor','b');
%[]Vehicle body z-axis direction.

Vehicle(8) = mesh(xs,ys,zs,'FaceColor','k','EdgeColor','k');
%[]Vehicle body heat shield.

%%
%[]OBJECT TRANSFORM:

Object = hgtransform('Parent',Axes);
%[]Initiates a new transform object.

set(Vehicle,'Parent',Object);
%[]Attaches the vehicle to the transform object.

for k = 0:360
    
    Txyz = makehgtform('Translate',0.001*[k,0,0]);
    %[m]New vehicle location.
    
    Rx = makehgtform('XRotate',k*pi/180);
    %[]Roll angle transformation matrix.
    
    Ry = makehgtform('YRotate',0);
    %[]Pitch angle transformation matrix.
    
    Rz = makehgtform('ZRotate',0);
    %[]Yaw angle transformation matrix.
    
    set(Object,'Matrix',Rz*Ry*Rx*Txyz);
    %[]New vehicle orientation.
    
    pause(0.1);
    %[]Pauses the animation for the specified time.
    
end

%%
%[]DISPLAY SIMULATION TIME:

SimulationTime = toc;
%[s]Stops the program timer.

fprintf('Simulation Time: %0.3f seconds\n',SimulationTime);
%[]Displays the simulation time on the command window.
%===================================================================================================