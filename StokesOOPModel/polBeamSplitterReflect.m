function [ result ] = polBeamSplitterReflect( inputs )
%beamSplitter - returns reflect pulse based on
%input pulse and transmission percentage
%   Inputs: [input pulses, transmission percentage]
%   Outputs: [reflect pulses]
%This is a 50-50 beam splitter.

% Ensure row vector
size_inputs = size(inputs);
if(size_inputs(2)<size_inputs(1))
    inputs = transpose(inputs);
end

attenuationFactor = inputs(end);

reflectPulseIDs = [];

    for inputPulseID = inputs(1:end-1)
        
        if(inputPulseID <1)
            reflectPulseIDs = [reflectPulseIDs,0];
            continue

        end
        
        inputPulse = Pulse.getPulse(inputPulseID);
        
        reflectPulse = Pulse.clonePulse(inputPulse);
        reflectPulse.I = attenuationFactor*reflectPulse.I;
        reflectPulse.Q = attenuationFactor*reflectPulse.Q;
        reflectPulse.U = attenuationFactor*reflectPulse.U;
        reflectPulse.V = attenuationFactor*reflectPulse.V;

        reflectPulseID = reflectPulse.ID;
        reflectPulseIDs = [reflectPulseIDs,reflectPulseID];
        
        
    end
    result = reflectPulseIDs;

end
