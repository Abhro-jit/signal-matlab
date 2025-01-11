fs= 2000;
fc=100;
order= 20;
[b_butter,a_butter]=butter(order,fc/(0.5*fs),'low');

[b_cheb1,a_cheb1]=cheby1(order,1,fc/(0.5*fs),'low');
 
[b_ellip,a_ellip]=ellip(order,1,40,fc/(0.5*fs),'low');
 
    
 t=0:1/fs:1;
 signal_orginal=sin(120*2*pi*t);
 noise=sin(200*2*pi*t)+sin(210*2*pi*t)+sin(220*2*pi*t)+sin(1400*2*pi*t);
 noisy_signal=signal_orginal+noise;
 figure(1)
 filtered_butter=filter(b_butter,a_butter,noisy_signal);
 filtered_cheb1=filter(b_cheb1,a_cheb1,noisy_signal);
 filtered_ellip=filter(b_ellip,a_ellip,noisy_signal);
 signal_power=mean(signal_orginal.^2);
 noise_power=mean(noise.^2);
 snr_orginal=10*log10(signal_power/noise_power);
snr_butter=snr(filtered_butter,noisy_signal);
  snr_cheb1=snr(filtered_cheb1,noisy_signal);
 snr_ellip=snr(filtered_ellip,noisy_signal);
 fprintf('SNR of orginal signal:%.2fdb\n',snr_orginal);
 fprintf('SNR of butterworth filtered signal:%.2fdb\n',snr_butter);
 fprintf('SNR of chebyshev type 1 filtered signal:%.2fdb\n',snr_cheb1);
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
grid on;rintf('SNR of elliptic filtered signal:%.2fdb\n',snr_ellip);