function dSdt = CthulhuModel(t,S)
    
    m = 2.5                                ;
    %[kg]Vehicle mass.
    
    r = 0.15;
    %[m]Radius of the vehicle.
    
    rho = 997;
    %[km/m^3]Density of water.
    
    Cd = 2.2;
    %[]Drag coefficient.
    
    g = 9.81;
    %[m/s^2]Acceleration due to gravity.
    
    W = S(10:12);
    %[rad/s]Current rotational velocity in BOD coordinates.
    
    I = Inertia;
    %[kg-m^2]Inertia tensor.
    
    [T, MT] = Thrust(t,S,r);
    %[N,N-m]Total thrust in SEZ coordinates and total thrust moment in BOD coordinates.
    
    [B,D,MB,MD] = BouyancyDrag(S,r,rho,Cd,g);
    %[N,N,N-m,N-m]Bouyancy force in SEZ coordinates; drag force in SEZ coordinates; bouyancy moment
    %in BOD coordinates; and drag moment in BOD coordinates.
    
    Edot = Euler(S,W);
    %[rad/s]Current Euler angle rates.
    
    g = -g * [0; 0; 1];
    %[m/s^2]Acceleration due to gravity in SEZ coordinates.
    
    M = MT + MB + MD;
    %[N-m]Total moment WRT the CM in BOD coordinates.
    
    dSdt = zeros(12,1);
    %[]Allocates memory for the model vector.
    
    dSdt(1:3) = S(4:6);
    %[m/s]Current velocity in BOD coordinates.
    
    dSdt(4:6) = (T + B + D) / m + g;
    %[m/s^2]Current acceleration in BOD coordinates.
    
    dSdt(7:9) = Edot;
    %[rad/s]Current Euler angle rates.
    
    dSdt(10:12) = I \ (M - cross(W,I * W));
    %[rad/s^2]Current rotational rates.
    
end
%[]=================================================================================================