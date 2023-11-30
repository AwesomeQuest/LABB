% Workshop 5 Graphics
% T-316-LABB Measurement Systems
% Starter m-file for the workshop 5 exercise

clc
clear 

% Read the file into the MATLAB workspace
% the m-file and spreadsheet should be in the same directory
filename  = 'practice data and graph.xlsx';
sheet     = 'data';
[data,headings] = xlsread(filename, sheet);

% experimental measurements
freqData = data(:,1);
gainData = data(:,2);

% model predictions
freqModel = data(:,3);
gainModel = data(:,4);

% Remove the NaN 'padding' from the first two columns of data
idx       = find(~isnan(freqData)); % indices of elements that are not NaN
freqData  = freqData(idx);          % extract the data, excludes NaNs 
gainData  = gainData(idx);          % repeat for the gain data

% make a graph
hold on
scatter(freqData,gainData)
plot(freqModel,gainModel)
xlabel('rad/s')
ylabel('dB')
title('Frequency responce of amplitude')
hold off


% last lin