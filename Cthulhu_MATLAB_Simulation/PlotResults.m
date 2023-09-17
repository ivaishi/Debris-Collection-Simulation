function PlotResults(t,S)
    
    S(7:12,:) = S(7:12,:) * 180 / pi;
    %[deg,deg/s]Converts all Euler angles to degrees.
    
    for k = 1:numel(t)
        
        for m = 7:12
            
            S(m,k) = mod(S(m,k),360);
            %[deg,deg/s]Converts all angles to a value that is between 0 degrees and 360 degrees.
            
        end
        
    end
    
figure(2)
plot3(S(1,:),S(2,:),S(3,:),'k.'); grid; axis equal;
title("Position of Cthulhu");
grid on;

figure(3)
subplot(3,1,1)
plot(t, S(1,:))
title("Displacement of Cthulhu in X direction wrt time in BOD coordinates");
grid on;
subplot(3,1,2)
plot(t, S(2,:))
title("Displacement of Cthulhu in Y direction wrt time in BOD coordinates");
grid on;
subplot(3,1,3)
plot(t, S(3,:))
title("Displacement of Cthulhu in Z direction wrt time in BOD coordinates");
grid on;

figure(4)
subplot(3,1,1)
plot(t, S(4,:))
title("Velocity of Cthulhu in X direction wrt time in BOD coordinates");
grid on;
subplot(3,1,2)
plot(t, S(5,:))
title("Velocity of Cthulhu in Y direction wrt time in BOD coordinates");
grid on;
subplot(3,1,3)
plot(t, S(6,:))
title("Velocity of Cthulhu in Z direction wrt time in BOD coordinates");
grid on;

figure(5)
subplot(3,1,1)
plot(t, S(7,:))
title("Roll angle of Cthulhu wrt time");
grid on;
subplot(3,1,2)
plot(t, S(8,:))
title("Pitch angle of Cthulhu wrt time");
grid on;
subplot(3,1,3)
plot(t, S(9,:))
title("Yaw angle of Cthulhu wrt time");
grid on;

figure(6)
subplot(3,1,1)
plot(t, S(10,:))
title("Angular Velocity of Cthulhu in X direction wrt time in BOD coordinates");
grid on;
subplot(3,1,2)
plot(t, S(11,:))
title("Angular Velocity of Cthulhu in Y direction wrt time in BOD coordinates");
grid on;
subplot(3,1,3)
plot(t, S(12,:))
title("Angular Velocity of Cthulhu in Z direction wrt time in BOD coordinates");
grid on;
 
    
end
%===================================================================================================