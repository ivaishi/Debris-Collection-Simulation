function Edot = Euler(S,W)
    
    Pitch = S(8);
    %[rad]Current pitch angle.
    
    Yaw = S(9);
    %[rad]Current yaw angle.
    
    Inverse = [ sec(Pitch) * cos(Yaw), -sec(Pitch) * sin(Yaw), 0; ...
                             sin(Yaw),               cos(Yaw), 0; ...
               -tan(Pitch) * cos(Yaw),  tan(Pitch) * sin(Yaw), 1];
    %[]Matrix.
    
    Edot = Inverse * W;
    %[]Current Euler angle rates.
    
end
%===================================================================================================