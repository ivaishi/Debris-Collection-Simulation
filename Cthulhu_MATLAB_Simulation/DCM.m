function SezToBod = DCM(S)
    
    Roll = S(7);
    %[rad]Current roll angle.
    
    Pitch = S(8);
    %[rad]Current pitch angle.
    
    Yaw = S(9);
    %[rad]Current yaw angle.
    
    T1 = [1,          0,         0; ...
          0,  cos(Roll), sin(Roll); ...
          0, -sin(Roll), cos(Roll)];
    %[]Matrix that transforms vectors about the 1 axis by an angle roll.
    
    T2 = [cos(Pitch), 0, -sin(Pitch); ...
                   0, 1,           0; ...
          sin(Pitch), 0,  cos(Pitch)];
    %[]Matrix that transforms vectors about the 2 axis by an angle pitch.
    
    T3 = [ cos(Yaw), sin(Yaw), 0; ...
          -sin(Yaw), cos(Yaw), 0;
                  0,        0, 1];
    %[]Matrix that transforms vectors about the 3 axis by an angle yaw.
    
    SezToBod = T3 * T2 * T1;
    %[]Matrix that transforms vectors from SEZ coordinates to BOD coordinates.
    
end
%===================================================================================================