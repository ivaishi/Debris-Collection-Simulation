clc

%time
t = r.time;

%position
x = r.signals.values(:,1);
y = r.signals.values(:,2);
z = r.signals.values(:,3);

%vel
xdot = v.signals.values(:,1);
ydot = v.signals.values(:,2);
zdot = v.signals.values(:,3);
vmag = sqrt(xdot.^2 + ydot.^2 + zdot.^2);

%acc
xddot = vdot.signals.values(:,1);
yddot = vdot.signals.values(:,2);
zddot = vdot.signals.values(:,3);
amag = sqrt(xddot.^2 + yddot.^2 + zddot.^2);

%thrust
Fx = F.signals.values(:,1);
Fy = F.signals.values(:,2);
Fz = F.signals.values(:,3);
Fmag = sqrt(Fx.^2+Fy.^2+Fz.^2);

%euler angles
R = 180/pi*RPY.signals.values(:,1);
P = 180/pi*RPY.signals.values(:,2);
Y = 180/pi*RPY.signals.values(:,3);
% R = -atand(Fy/(m*g));
% P = -atand(Fx/(m*g));
% Y = zeros(length(t),1);

%Angular velocity
Rdot = 180/pi*thetadot.signals.values(:,1);
Pdot = 180/pi*thetadot.signals.values(:,2);
Ydot = 180/pi*thetadot.signals.values(:,3);
% for i = 1:(length(t)-1)
%     Rdot(i) = (R(i+1)-R(i))/(t(i+1)-t(i));
%     Pdot(i) = (P(i+1)-P(i))/(t(i+1)-t(i));
%     Ydot(i) = (Y(i+1)-Y(i))/(t(i+1)-t(i));
% end

%Angular acceleration
% for i = 1:(length(t)-2)
%     Rddot(i) = (Rdot(i+1)-Rdot(i))/(t(i+1)-t(i));
%     Pddot(i) = (Pdot(i+1)-Pdot(i))/(t(i+1)-t(i));
%     Yddot(i) = (Ydot(i+1)-Ydot(i))/(t(i+1)-t(i));
% end

%Torque
% TR = T.signals.values(:,1);
% TP = T.signals.values(:,2);
% TY = T.signals.values(:,3);
% TR = I(1,1)*Rddot;
% TP = I(2,2)*Pddot;
% TY = I(3,3)*Yddot;

%Wind drag
Dx = D.signals.values(:,1);
Dy = D.signals.values(:,2);
Dz = D.signals.values(:,3);

%Trajectory plot
%PPcustomplotThreeD(x,y,z,0,251,0,35,-2,2,50,1,5,'Trajectory','X Position (s)','Y Posiiton (m)','Z Position (m)','-',2)
 plot3(x,y,z, ...
        'Color','b', ...            %[]Adjusts the color of the plot.
        'LineStyle','-', ...     %[]A line will not connect the markers.
        'LineWidth',2,...
        'Marker','.'); %[]Specifies the marker type.
    grid on;
    title('Trajectory of Cthulhu','FontWeight','bold','FontSize',22);
    xlabel('Position in X axis (m)','FontWeight','bold','FontSize',17);
    ylabel('Position in Y axis (m)','FontWeight','bold','FontSize',17);
    zlabel('Position in Z axis (m)','FontWeight','bold','FontSize',17);
    
    %[]Adds a plot to the specified axes and adjusts its properties. 
%Position plot

PPcustomplot(t,x,0,t(end),-50,150,20,20,'Position vs Time','Time (s)','Posiiton (m)','-',2)
hold on
plot(t,y,'-b','LineWidth',2)
plot(t,z,'-.r','LineWidth',2)
legend('X','Y','Z','Location','East')

%Velocity plot
PPcustomplot(t,xdot,0,t(end),-10,20,20,5,'Velocity vs Time','Time (s)','Velocity (m/s)','-',2)
hold on
plot(t,ydot,'-b','LineWidth',2)
plot(t,zdot,'-r','LineWidth',2)
legend('X','Y','Z','Location','East')

%Acceleration plot
PPcustomplot(t,xddot,0,t(end),-20,20,20,2,'Accleration vs Time','Time (s)','Accleration (m/s^2)','-',2)
hold on
plot(t,yddot,'-b','LineWidth',2)
plot(t,zddot,'-r','LineWidth',2)
legend('X','Y','Z','Location','SouthEast')

%Thrust plot
PPcustomplot(t,Fmag,0,t(end),-20,20,20,2,'Thrust vs Time','Time (s)','Thrust (N)','-',2)
hold on
% plot(t,Fx,'--k','LineWidth',2)
% plot(t,Fy,':k','LineWidth',2)
% plot(t,Fz,'-.k','LineWidth',2)
legend('Magnitude','X','Y','Z','Location','East')

% figure(1)
% x = t;
% y = Fmag;
% h = animatedline(x(1),y(1),'LineWidth',2);
% axis([0,25,0,9])
% xlabel('Time (s)','FontSize',16,'FontWeight','Bold');
% ylabel('Thrust (N)','FontSize',16,'FontWeight','Bold');
% title('Thrust vs Time','FontSize',16,'FontWeight','Bold');
% grid on;
% for k = 1:1:length(x)
%  addpoints(h,x(k),y(k));
%  drawnow
%  pause(dt)
% end
%movie(M)

% %Power plot
% TPratio = 3/1000*9.807; %Thrust to power ratio, N/W
% power = Fmag/TPratio;
% PPcustomplot(t,power,0,t(end),0,5000,20,500,'Power vs Time','Time (s)','Power (W)','-',2)

%Water drag plot
PPcustomplot(t,Dx,0,t(end),-20,20,20,10,'Water Drag vs Time','Time (s)','Drag (N)','-',2)
hold on
plot(t,Dy,'-b','LineWidth',2)
plot(t,Dz,'-r','LineWidth',2)
legend('X','Y','Z','Location','East')

%Angles plot
PPcustomplot(t,R,0,t(end),-90,90,20,20,'Euler Angles vs Time','Time (s)','Angle (degree)','-',2)
hold on
plot(t,P,'-b','LineWidth',2)
plot(t,Y,'-r','LineWidth',2)
legend('Roll','Pitch','Yaw','Location','SouthEast')
grid on;

%Anglular vel plot
PPcustomplot(t,Rdot,0,t(end),-30,30,20,5,'Angular Velocity vs Time','Time (s)','Angle Rate (degree/s)','-',2)
hold on
plot(t,Pdot,'-b','LineWidth',2)
plot(t,Ydot,'-r','LineWidth',2)
legend('Roll Rate','Pitch Rate','Yaw Rate','Location','SouthEast')

% % %Torque plot
% % PPcustomplot(t,TR,0,t(end),-.5,.5,20,0.1,'Torque vs Time','Time (s)','Torque (N m)','-',2)
% % hold on
% % plot(t,TP,':k','LineWidth',2)
% % plot(t,TR,'-.k','LineWidth',2)
% % legend('Roll','Pitch','Yaw','Location','SouthEast')
% 
% %%
% clc
% 
% % maxThrust = max(Fmag);
% % averageThrust = mean(Fmag);
% % TPratio = 4.4/1000*9.807; %Thrust to power ratio, N/W
% % maxPower = maxThrust/TPratio;
% % averagePower = averageThrust/TPratio;
% % energy = averagePower*t(end);
% 
% % fprintf('Without factor of safety:\n\n')
% % fprintf('Maximum Thrust: %.0f N\n',maxThrust)
% % fprintf('Average Thrust: %.0f N\n',averageThrust)
% % fprintf('Maximum Power: %.2f kW\n',maxPower/1000)
% % fprintf('Average Power: %.2f kW\n',averagePower/1000)
% % fprintf('Energy Required: %.0f kJ, or %.1f Wh\n\n',energy/1000,energy/3600)