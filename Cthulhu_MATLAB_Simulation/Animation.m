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
%DATA:

theta = (0:1:360) * pi / 180;
%[rad]Angles.

r = cos(theta);
%[m]Radii.

[x,y,z] = cylinder(r);
%[m,m,m]Generates the data for a cylinder.

%%
%ANIMATE CYLINDER:

ScreenSize = get(0,'ScreenSize');
%[]Determines the location and dimensions of the current monitor.

Window = figure( ...
    'Color','w', ...
    'Name','VEHICLE ANIMATION', ...
    'NumberTitle','Off', ...
    'OuterPosition',ScreenSize);
%[]Initiates a window and adjusts its properties.

Extent = 15;
%[]Axes limits.

Axes = axes( ...
    'CameraPosition',Extent*[1,1,1], ...
    'CameraTarget',[0,0,0], ...
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

for k = 1:1:1000
    
    cla(Axes);
    %[]Clears all plots from the specified axes.
    
    Plot = mesh(x + 0.001 * k,y + 0.001 * k,10 * z + 0.001 * k, ...
        'FaceColor','r', ...
        'Parent',Axes);
    %[]Adds a mesh plot to the specified axes and adjusts its properties.
    
    rotate(Plot,[1,0,0],k);
    %[]Rotates the mesh plot about the x-axis by k degrees.
    
    rotate(Plot,[0,1,0],k);
    %[]Rotates the mesh plot about the y-axis by k degrees.
    
    rotate(Plot,[0,0,1],k);
    %[]Rotates the mesh plot about the z-axis by k degrees.
    
    pause(0.001);
    %[]Pauses the animation for the specified time.
    
end

%%
%[]DISPLAY SIMULATION TIME:

SimulationTime = toc;
%[s]Stops the program timer.

fprintf('Simulation Time: %0.3f seconds\n',SimulationTime);
%[]Displays the simulation time on the command window.
%===================================================================================================