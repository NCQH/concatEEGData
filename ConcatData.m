close all, clc
% Ghép data lại thành 512x54144
%% Tạo data
datasetFolder = 'D:\HocTap\NCKH\EEGDenoise\EEGnetDATA';
dataSaveFolder = 'D:\HocTap\NCKH\EEGDenoise\Code\Assigment\SavedData\';
savefile = 0;

load(fullfile(datasetFolder,"EEG_all_epochs.mat")); % 4514 segments
load(fullfile(datasetFolder,"EMG_all_epochs.mat")); % 5598 segments

SNRVect         = (-7:4);
N               = numel(SNRVect);
SNRs            = cell(1, N);

for i = 1:numel(-7:-1)
    
    loadedData          = load(fullfile(datasetFolder, "SNR" + (i-8)+".mat"));
    SNRs{i}             = loadedData.("SNRnegative" + (8-i));

end
for i = 0:numel(0:4)-1
    
    loadedData          = load(fullfile(datasetFolder, "SNR" + i +".mat"));
    SNRs{i+8}           = loadedData.("SNR" + i);

end
numSegments         = 4512;
allNoise = mergeAndShuff2(SNRs, (1:12));