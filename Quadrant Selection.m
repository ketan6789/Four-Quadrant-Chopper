function [AH, AL, BH, BL, current_out] = quadrant_control(quadrant, PWM1, PWM2, current_in)
% Inputs:
%   quadrant: 1, 2, 3, or 4 (operation mode)
%   PWM1: Primary PWM signal
%   PWM2: Complementary PWM signal (~PWM1)
%   current_in: Measured current (can be +ve or -ve)
%
% Outputs:
%   AH, AL, BH, BL: Gate signals (logical)
%   current_out: Current with polarity reversed in Q2/Q3

% Initialize all gate signals as OFF (logical false)
AH = false; AL = false; BH = false; BL = false;

% Current polarity handling (reverse in Q2/Q3)
current_out = current_in; % Default
if quadrant == 2 || quadrant == 3
    current_out = -current_in; % Reverse polarity for regeneration modes
end

% Switching logic based on quadrant
switch quadrant
    case 1 % 1st Quadrant (+V, +I): Forward motoring
        AH = logical(PWM1); 
        AL = logical(PWM2); 
        BH = false;         % BH OFF
        BL = true;          % BL always ON 
        
    case 2 % 2nd Quadrant (+V, -I): Forward regeneration
        AH = logical(PWM1);
        AL = logical(PWM2); 
        BH = false;        
        BL = true;          
        
    case 3 % 3rd Quadrant (-V, -I): Reverse motoring
        AH = false;         % AH OFF
        AL = true;          % AL always ON (freewheeling path)
        BH = logical(PWM1);
        BL = logical(PWM2); 
        
    case 4 % 4th Quadrant (-V, +I): Reverse regeneration
        AH = false;         
        AL = true;          
        BH = logical(PWM1); 
        BL = logical(PWM2); 
end
end
