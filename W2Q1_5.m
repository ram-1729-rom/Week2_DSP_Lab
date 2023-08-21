%Defining parameters
A = 1 + mod(580,3);
duration = 0.5; % seconds
orig_samp_rate = 1000; % original samples per second
T = linspace(0, duration, duration * orig_samp_rate);

% Waveform (a)
amp_a = A;
freq_a = 5*A;
y_a = amp_a*cos(2*pi*freq_a*T);

% Waveform (b)
amp_b = A/2;
freq_b = 6*A;
y_b = amp_b*cos(2*pi*freq_b*T);

% Waveform (c)
amp_c = A/4;
freq_c = 10*A;
y_c = amp_c*cos(2*pi*freq_c*T);

% Cumulative waveforms
y_t = y_a + y_b + y_c;

% Sampling frequencies
Fs_a = 14*A; % samples/second
Fs_b = 2*freq_b; % Nyquist rate
Fs_c = freq_c / 2; % Aliased rate

% Sampled signals
s_a = y_t(1 : orig_samp_rate / Fs_a : end);
s_b = y_t(1 : orig_samp_rate / Fs_b : end);
s_c = y_t(1 : orig_samp_rate / Fs_c : end);

% Time for sampled signals
t_a = linspace(0, duration, length(s_a));
t_b = linspace(0, duration, length(s_b));
t_c = linspace(0, duration, length(s_c));


% Performing FFT on the sampled signals
fft_a = abs(fft(s_a));
fft_b = abs(fft(s_b));
fft_c = abs(fft(s_c));

% Frequency values corresponding to FFT bins
f_a = (0:length(fft_a) - 1) * Fs_a / length(fft_a);
f_b = (0:length(fft_b) - 1) * Fs_b / length(fft_b);
f_c = (0:length(fft_c) - 1) * Fs_c / length(fft_c);

% Plotting
figure;

% Energy density spectrum for (a)
subplot(3, 1, 1);
plot(f_a, fft_a, 'r', 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Energy Density');
title('Energy Density Spectrum for Fs_a = 28 samples/second');

% Energy density spectrum for (b)
subplot(3, 1, 2);
plot(f_b, fft_b, 'g', 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Energy Density');
title('Energy Density Spectrum for Nyquist rate');

% Energy density spectrum for (c)
subplot(3, 1, 3);
plot(f_c, fft_c, 'b', 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Energy Density');
title('Energy Density Spectrum for aliased rate');

sgtitle('Energy Density Spectra');

% Identifying and printing the aliased frequencies and their values
aliased_frequency_a = f_a(find(fft_a == max(fft_a(2:end)), 1));
aliased_frequency_c = f_c(find(fft_c == max(fft_c(2:end)), 1));


