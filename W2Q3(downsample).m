% Loading original audio file
filename = 'Track002.wav';
[originalSignal, originalFs] = audioread(filename);

% Defining downsampling factors
downsamplingFactors = [2, 3, 4];

% Loop through each downsampling factor
for i = 1:length(downsamplingFactors)
    factor = downsamplingFactors(i);
    
    % Downsampling the signal
    downsampledSignal = downsample(originalSignal, factor);
   
    outputFilename = sprintf('downsampled_%dx_%s', factor, filename);
    
    audiowrite(outputFilename, downsampledSignal, originalFs / factor);
end
