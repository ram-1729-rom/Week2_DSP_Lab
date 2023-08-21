% Frequencies corresponding to "Do Re Mi Fa So La Ti Do"
frequencies = [261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88, 523.25];

% Duration of each tone in seconds
Duration = 1.0;

% Different sampling rates to use
samplingRates = [8000, 16000, 44100];

% Creating an array to store the concatenated signal
fullSignal = [];

% Generating the tones for "Do Re Mi Fa So La Ti Do" at the highest sampling rate
highestFs = max(samplingRates);
tones = [];
for j = 1:length(frequencies)
    t = 0:1/highestFs:Duration;
    tone = sin(2*pi*frequencies(j)*t);
    tones = [tones, tone];
end

% Loop through different sampling rates
for i = 1:length(samplingRates)
    Fs = samplingRates(i);
    
    % Resampling tones to the current sampling rate
    resampledTones = resample(tones, Fs, highestFs);
    
    % Appending current resampled tones to the full signal
    fullSignal = [fullSignal, resampledTones];
end

% Saving concatenated signal as a WAV file
outputFilename = 'full_sequence_combined(Q2).wav';
audiowrite(outputFilename, fullSignal, highestFs);

% Play the final concatenated signal
sound(fullSignal, highestFs);
