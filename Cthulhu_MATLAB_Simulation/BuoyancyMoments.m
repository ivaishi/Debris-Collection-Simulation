function MB = BuoyancyMoments(w,EA,r)
%calculate bouyancy mometns
%w = width of cthulhu
%l = length of cthulhu
%EA = euler angles, RPY
%r = SEZ x,y,z

rho = 997; %kg/m^3
g = 9.80248; %m/s^2
R = EA(1);
P = EA(2);
z = r(3);

h1 = w/2*sin(R);
h2 = -w/2*sin(R);

p1 = h1 + h/2;
p2 = h2 + h/2;

p1 = p1 + z;
if p1 > h
    p1 = h;
else if p1 < 0
    p1 = 0;
    end

if p2 > h
    p2 = h;
elseif p2 < 0
    p2 = 0;
end

MBR = (w*cos(R))*((p1-p2)/h*Vtot*rho*g);

x = w/2*sin(P) - z;
if x < 0
    x = 0;
elseif x > w*cos(P)
    x = w*cos(P);
end
y = x/sin(P);
xb = y/2*cos(P);
MBP = (y/w*Vtot*rho*g)*xb;

MB = [0;MBP;MBR];