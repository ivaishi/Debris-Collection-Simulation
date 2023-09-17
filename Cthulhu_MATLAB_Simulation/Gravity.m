function g = Gravity(S)
    
    SezToBod = DCM(S);
    %[]Matrix that transforms vectors from SEZ coordinates to BOD coordinates.
    
    g = -9.81 * SezToBod * [0; 0; 1];
    %[m/s^2]Acceleration due to gravity in BOD coordinates.
    
end
%===================================================================================================