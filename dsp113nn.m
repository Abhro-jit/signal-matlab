% Specifications
cutoff_freq = 100; % Hz
filter_order = 20;
fs = 2000; % Sampling frequency in Hz

% Design the filters
[b_butter, a_butter] = butter(filter_order, cutoff_freq/(fs/2));
[b_cheby1, a_cheby1] = cheby1(filter_order, 0.5, cutoff_freq/(fs/2));
[b_cheby2, a_cheby2] = cheby2(filter_order, 40, cutoff_freq/(fs/2));
[b_ellip, a_ellip] = ellip(filter_order, 0.5, 40, cutoff_freq/(fs/2));
[b_bessel, a_bessel] = besself(filter_order, cutoff_freq/(fs/2));

% Compute frequency responses
frequencies = linspace(0, fs/2, 1024);
h_butter = freqz(b_butter, a_butter, frequencies, fs);
h_cheby1 = freqz(b_cheby1, a_cheby1, frequencies, fs);
h_cheby2 = freqz(b_cheby2, a_cheby2, frequencies, fs);
h_ellip = freqz(b_ellip, a_ellip, frequencies, fs);
h_bessel = freqz(b_bessel, a_bessel, frequencies, fs);

% Plot the magnitude responses
figure;
plot(frequencies, 20*log10(abs(h_butter)), 'b');
hold on;
plot(frequencies, 20*log10(abs(h_cheby1)), 'g');
plot(frequencies, 20*log10(abs(h_cheby2)), 'r');
plot(frequencies, 20*log10(abs(h_ellip)), 'm');
plot(frequencies, 20*log10(abs(h_bessel)), 'c');
hold off;

title('Magnitude Response of Different Filters');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Butterworth', 'Chebyshev Type I', 'Chebyshev Type II', 'Elliptical', 'Bessel');
grid on;