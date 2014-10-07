function [ outputPulses ] = pulseSelectModule( inputPulses, numBlocked)
%   Inputs: inputPulses - A list of input pulses
%           numBlocked - number of blocked pulses 
%   Outputs: outputPulses - delayed output pulses
%

outputPulses = [];

numBlocked = numBlocked+1;

[nrow, ncol] = size(inputPulses);
for i = 1:nrow
    currentPulse = inputPulses(i,:);
    currentPulse(1) = currentPulse(1)/numBlocked; % computes delay in ns
    outputPulses = [outputPulses; currentPulse];   
end

%plotPulses = [outputPulses; inputPulses];
%pulseSequenceDisplay(plotPulses, 0.3*10^(-6))