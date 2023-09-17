function [T,MT] = Thrust(~,S,r)
    
    R1 = r * [0; 1; 0];
    %[m]Thruster 1 moment arm WRT the CM in BOD coordinates.
    
    R2 = -r * [0; 1; 0];
    %[m]Thruster 2 moment arm WRT the CM in BOD coordinates.
    
    thrust = [6, 5];
    %[N]Thrust magnitude for both thrusters.
    
    T1 = thrust(1) * [1; 0; 0];
    %[N]Thrust 1 in BOD coordinates.
    
    T2 = thrust(2) * [1; 0; 0];
    %[N]Thrust 2 in BOD coordinates.
    
    T = T1 + T2;
    %[N]Total thrust in BOD coordinates.
    
    MT = cross(R1,T1) + cross(R2,T2);
    %[N-m]Total moment due to thrust in BOD coordinates.
    
    SezToBod = DCM(S);
    %[]Matrix that transforms vectors from SEZ coordinates to BOD coordinates.
    
    T = transpose(SezToBod) * T;
    %[N]Total thrust in SEZ coordinates.
    
end
%===================================================================================================