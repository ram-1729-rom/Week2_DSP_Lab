% Defining parameters
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

% Linear interpolation
interpolated_samples_a = interp1(t_a, s_a, T, 'linear');
interpolated_samples_b = interp1(t_b, s_b, T, 'linear');
interpolated_samples_c = interp1(t_c, s_c, T, 'linear');

% Plotting original cumulative waveform and interpolated waves
figure;

subplot(3, 1, 1);
plot(T, y_t, 'b', T, interpolated_samples_a, 'r--');
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Interpolated at Fs = 28 samples/second');
legend('Original', 'Interpolated');

subplot(3, 1, 2);
plot(T, y_t, 'b', T, interpolated_samples_b, 'g--');
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Interpolated at Nyquist rate');
legend('Original', 'Interpolated');

subplot(3, 1, 3);
plot(T, y_t, 'b', T, interpolated_samples_c, 'm--');
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Interpolated at aliased rate');
legend('Original', 'Interpolated');

sgtitle('Interpolated Reconstructed Waveforms');