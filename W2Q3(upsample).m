% Loading original audio file
filename = 'Track002.wav';
[originalSignal, originalFs] = audioread(filename);

% Define upsampling factors
upsamplingFactors = [2, 3, 4];

% Loop through each upsampling factor
for i = 1:length(upsamplingFactors)
    factor = upsamplingFactors(i);
    
    % Upsampling signal
    upsampledSignal = resample(originalSignal, factor, 1);
    
    outputFilename = sprintf('upsampled_%dx_%s', factor, filename);
    
    audiowrite(outputFilename, upsampledSignal, originalFs * factor);
end
