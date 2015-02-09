function [ result ] = linearPolarizer( inputs )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Ensure row vector
size_inputs = size(inputs);
if(size_inputs(2)<size_inputs(1))
    inputs = transpose(inputs);
end

% Pull off non-inputPulse arguments

horizontal = inputs(end); % 1 if horizontal polarizer
extinctionRatio = 100; % Hard-coded, X:1
transmittance = 0.85; % Hard-coded, refers to transmittance of pass polarity

result = [];

for inputPulseID = inputs(1:end-1)
        
        if(inputPulseID <1)
            result = [result, 0];
            continue
        end
        
        inputPulse = Pulse.getPulse(inputPulseID);
        
        % Convert inputPulse to resultPulseID
        if(horizontal)
            inputPulse.horizontalPower = transmittance*inputPulse.horizontalPower;
            inputPulse.verticalPower = transmittance*inputPulse.verticalPower/extinctionRatio;
        else
            inputPulse.horizontalPower = transmittance*inputPulse.horizontalPower/extinctionRatio;
            inputPulse.verticalPower = transmittance*inputPulse.verticalPower;
        end
        
        resultPulseID = inputPulse.ID;
         
        % Concatenate resultPulseID to result array
        
        result = [result, resultPulseID];
        
        

        
end
        
end

