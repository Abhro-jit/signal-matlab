x = [4 3 2 1 -1 -2 -3 -4];
N = length(x);  % Length of input sequence
k=N
k = 0:N-1;  % Frequency index

figure(1)

% Plot the input sequence
subplot(311)
stem(k, x)
title('Input sequence')
xlabel('Time Index (n)')
ylabel('Amplitude')

% Compute the FFT using the MATLAB command
x_func = ifft(x, N);

n = 0:1:N-1;  % Time index

% Plot the FFT sequence using MATLAB command
subplot(312)
stem(n, x_func)
title('FFT sequence using MATLAB command')
xlabel('Time Index (n)')
ylabel('Amplitude')

% Compute FFT manually
x_manual = [];
for n = 0:1:N-1
    val = 0;
    for k = 0:1:N-1
        val = val + (x(k+1) * exp(1i * 2 * pi * k * n / N));
    end
    x_manual = [x_manual, val / N];
end

% Plot the FFT sequence using the equation
subplot(313)
stem(n, x_manual)
title('FFT sequence using Equation')
xlabel('Time Index (n)')
ylabel('Amplitude')
