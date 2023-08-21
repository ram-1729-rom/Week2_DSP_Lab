% Defining parameters
A = 1 + mod(580,3);
duration = 0.5; % seconds
sampling_rate = 1000; % samples per second
T = linspace(0, duration, duration*sampling_rate);

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

% Combining waveforms
y_t = y_a + y_b + y_c;

figure;
plot(T, y_t, 'LineWidth', 2);

xlabel('Time (seconds)');
ylabel('Amplitude');
title('Combined Cosine Waveforms');
legend('Combined waveform');
grid on;