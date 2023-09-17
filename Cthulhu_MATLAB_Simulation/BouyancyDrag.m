function [B,D,MB,MD] = BouyancyDrag(S,r,rho,Cd,g)
    
    s_body = S(1);
    %[m]Vehicle's southern displacement in SEZ coordinates.
    
    z_body = S(3);
    %[m]Vehicle's zenith displacement in SEZ coordinates.
    
    Vbody = S(4:6);
    %[m/s]Vehicle velocity in SEZ coordinates.
    
    a = 0.005;
    %[m]Water wave amplitude.
    
    b = 9.425; %[rad/s]
    %[rad/m]Water wave angle per displacement.
    
    z_water = a * sin(b * s_body);
    %[m]Wave height in SEZ coordinates.
    
    f = @(s)(a^2 * b * sin(b * s) * cos(b * s) - z_body * a * b * cos(b * s) + s - s_body);
    %[]Minimum distance function.
    
    s = fzero(f,s_body);
    %[m]S-coordinate where the minimum distance between the body CM and the water wave occurs.
    
    z = a * sin(b * s);
    %[m]Wave height where the minimum distance between the body CM and the water wave occurs.
    
    d = sqrt((s - s_body)^2 + (z - z_body)^2);
    %[m]Minimum distance between the body CM and the water wave.
    
    if z_body > z_water
        
        if d >= r
            
            B = 0;
            %[N]Bouyancy force in SEZ coordinates.
            
            D = 0;
            %[N]Drag force in SEZ coordinates.
            
            MB = 0;
            %[N-m]Bouyancy moment WRT the CM in BOD coordinates.
            
            MD = 0;
            %[N-m]Drag moment WRT the CM in BOD coordinates.
            
        else
            
            h = r - d;
            %[m]Spherical cap height.
            
            vcap = 1 / 3 * pi * h^2 * (3 * r - h);
            %[m^3]Spherical cap volume.
            
            acap = 2 * pi * r * h;
            %[m^2]Spherical cap surface area.
            
            c_bar = 3 / 4 * (2 * r - h)^2 / (3 * r - h );
            %[m]Spherical cap centroid WRT the CM.
            
            Rbody = S(1:3);
            %[m]Center of mass position in SEZ coordinates.
            
            Rwater = [s; S(2); z];
            %[m]Water wave position in SEZ coordinates.
            
            C_bar = c_bar * (Rwater - Rbody) / norm(Rwater - Rbody);
            %[m]Spherical cap position WRT the CM in SEZ coordinates.
            
            B = rho * g * vcap * [0; 0; 1];
            %[N]Bouyancy force in SEZ coordinates.
            
            D = -0.5 * Cd * rho * acap * norm(Vbody) * Vbody;
            %[N]Drag force in SEZ coordinates.
            
            MB = cross(C_bar,B);
            %[N-m]Bouyancy moment WRT the CM in SEZ coordinates.
            
            MD = cross(C_bar,D);
            %[N-m]Drag moment WRT the CM in SEZ coordinates.
            
            SezToBod = DCM(S);
            %[]Matrix that transforms vectors from SEZ coordinates to BOD coordinates.
            
            MB = SezToBod * MB;
            %[N-m]Bouyancy moment WRT the CM in BOD coordinates.
            
            MD = SezToBod * MD;
            %[N-m]Drag moment WRT the CM in BOD coordinates.
            
        end
        
    else
        
        if d <= r
            
            h = r + d;
            %[m]Spherical cap height.
            
            vcap = 1 / 3 * pi * h^2 * (3 * r - h);
            %[m^3]Spherical cap volume.
            
            acap = 2 * pi * r * h;
            %[m^2]Spherical cap surface area.
            
            c_bar = 3 / 4 * (2 * r - h)^2 / (3 * r - h );
            %[m]Spherical cap centroid WRT the CM.
            
            Rbody = S(1:3);
            %[m]Center of mass position in SEZ coordinates.
            
            Rwater = [s; S(2); z];
            %[m]Water wave position in SEZ coordinates.
            
            C_bar = c_bar * (Rbody - Rwater) / norm(Rbody - Rwater);
            %[m]Spherical cap position WRT the CM in SEZ coordinates.
            
            B = rho * g * vcap * [0; 0; 1];
            %[N]Bouyancy force in SEZ coordinates.
            
            D = -0.5 * Cd * rho * acap * norm(Vbody) * Vbody;
            %[N]Drag force in SEZ coordinates.
            
            MB = cross(C_bar,B);
            %[N-m]Bouyancy moment WRT the CM in SEZ coordinates.
            
            MD = cross(C_bar,D);
            %[N-m]Drag moment WRT the CM in SEZ coordinates.
            
            SezToBod = DCM(S);
            %[]Matrix that transforms vectors from SEZ coordinates to BOD coordinates.
            
            MB = SezToBod * MB;
            %[N-m]Bouyancy moment WRT the CM in BOD coordinates.
            
            MD = SezToBod * MD;
            %[N-m]Drag moment WRT the CM in BOD coordinates.
            
        else
            
            vs = 4 / 3 * pi * r^3;
            %[m^3]Volume of the sphere.
            
            as = 4 * pi * r^2;
            %[m^2]Surface area of the sphere.
            
            B = rho * g * vs * [0; 0; 1];
            %[N]Bouyancy force in SEZ coordinates.
            
            D = -0.5 * Cd * rho * as * norm(Vbody) * Vbody;
            %[N]Drag force in SEZ coordinates.
            
            MB = 0;
            %[N-m]Bouyancy moment WRT the CM in SEZ coordinates.
            
            MD = 0;
            %[N-m]Drag moment WRT the CM in SEZ coordinates.
            
        end
        
    end
    
end
%===================================================================================================