% Signal specifications
fs = 2000;    % Sampling frequency
fc = 100;     % Cutoff frequency

% Design filters
order = 20;

[b_butter, a_butter] = butter(order, fc / (0.5 * fs), 'low');
[b_cheb1, a_cheb1] = cheby1(order, 1, fc / (0.5 * fs), 'low');
[b_ellip, a_ellip] = ellip(order, 1, 40, fc / (0.5 * fs), 'low');

% Time vector
t = 0:1/fs:1; % Assuming 1 second duration

% Generate the original signal
signal_original = sin(120 * 2 * pi * t);

% Add noise to the original signal

noise = sin(200 * 2 * pi * t) + sin(210 * 2 * pi * t) + sin(220 * 2 * pi * t) + sin(1400 * 2 * pi * t);
noisy_signal = signal_original + noise;

% Apply filters to the noisy signal
filtered_butter = filter(b_butter, a_butter, noisy_signal);
filtered_cheb1 = filter(b_cheb1, a_cheb1, noisy_signal);
filtered_ellip = filter(b_ellip, a_ellip, noisy_signal);

% Calculate SNR
signal_power = mean(signal_original.^2);
noise_power = mean(noise.^2);

snr_original = 10 * log10(signal_power / noise_power);

snr_butter = snr(filtered_butter, noisy_signal);
snr_cheb1 =  snr( filtered_cheb1, noisy_signal);
snr_ellip = snr(filtered_ellip, noisy_signal);

% Display SNR values
fprintf('SNR of Original Signal: %.2f dB\n', snr_original);
fprintf('SNR of Butterworth Filtered Signal: %.2f dB\n', snr_butter);
fprintf('SNR of Chebyshev Type I Filtered Signal: %.2f dB\n', snr_cheb1);
fprintf('SNR of Elliptic Filtered Signal: %.2f dB\n', snr_ellip);