tic;
%[s]Starts the program timer.

clc;
%[]Clears the command window.

clear;
%[]Clears the variable workspace.

format('Compact');
%[]Formats the command window to single space.

format('LongG');
%[]Formats the command window to display 16 digits.

close('All');
%[]Closes all figures.

%%
%[]INITIAL CONDITIONS:

to = 0:0.01:60;
%[s]Modeling time.

Ro = [0; 0; 0.3];
%[m]Initial position in BOD coordinates.

Vo = zeros(3,1);
%[m/s]Initial velocity in BOD coordinates.

Eo = zeros(3,1);
%[rad]Initial Euler angles.

Wo = zeros(3,1);
%[rad/s]Initial angular velocity in BOD coordinates.

So = [Ro; Vo; Eo; Wo];
%[m,m/s,rad/s,rad/s]Initial state.

%%
%[]NUMERICAL INTEGRATION:

options = odeset('RelTol',1E-12);
%[]Increases the accuracy of the numercial integrator.

[t,S] = ode45(@CthulhuModel,to,So,options);
%[s,m,m/s,rad,rad/s]Numerically integrates the equations of motion.

t = transpose(t);
%[s]Transpose of the time vector.

S = transpose(S);
%[m,m/s,rad,rad/s]Transpose of the state matrix.

PlotResults(t,S);
%for k = 1:numel(t); [B(1:3,k),D(1:3,k),MB(1:3,k),MD(1:3,k)] = BouyancyDrag(S(:,k),r,rho,Cd,g); b(k) = norm(B(:,k)); d(k) = norm(D(:,k)); end;
%%
%[]DISPLAY SIMULATION TIME:

SimulationTime = toc;
%[s]Stops the program timer.

fprintf('Simulation Time: %0.3f seconds\n',SimulationTime);
%[]Displays the simulation time on the command window.
%===================================================================================================