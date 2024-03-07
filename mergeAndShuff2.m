function outEEG = mergeAndShuff(inEEG, order)
% inEEG: cell contains 12 matrix of noise eeg
% order
% outEEG: merge and shuffle
outEEG = [];
for i = 1:12
    outEEG = [outEEG ;inEEG{order(i)}];
end
end