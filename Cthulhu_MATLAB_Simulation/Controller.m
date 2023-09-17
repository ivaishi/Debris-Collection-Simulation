clc;
clear;

%Joystick = vrjoystick(1);
CthulhuController = vrjoystick(1);

% ControllerAxes = axis(CthulhuController);
% ControllerButtons = button(CthulhuController);
% 
% if ControllerAxes ~= 0
%     ControllerAxes = 0;
% end

% display(axis(CthulhuController))
% display(button(CthulhuController))
% display(pov(CthulhuController))

while true
clc
[ControllerAxes, ControllerButtons, ControllerPovs] = read(CthulhuController)
pause(0.1)
end

%close(CthulhuController)