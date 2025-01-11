t=0:0.01:10
x1_t= sin(0.06*pi*t)+ 3*sin(0.14*pi*t);
x2_t= exp(0.4*t)
n=0:9
x1_n=sin(0.06*pi*n)+3*sin(0.14*pi*n);
x2_n= exp(0.4*n);
figure;
subplot(2,2,1);
plot(t,x1_t)
title('x1(t)')
xlabel('Time(s)')
ylabel('Amplitude')


subplot(2,2,2)
stem(n, x1_n);
title('x1(n)');
xlabel('Sample Index');
ylabel('Amplitude');


subplot(2, 2, 3);
plot(t, x2_t);
title('x2(t)');
xlabel('Time (s)');
ylabel('Amplitude');


subplot(2, 2, 4);
stem(n, x2_n);
title('x2(n)');
xlabel('Sample Index');
ylabel('Amplitude');

x_result_n = x1_n + x2_n;
circular_convolution = ifft(fft(x1_n) .* fft(x2_n));
figure;
subplot(2, 1, 1);
stem(n, x_result_n);
title('x_result(n) = x1(n) + x2(n)');
xlabel('Sample Index');
ylabel('Amplitude');


subplot(2, 1, 2);
stem(n, circular_convolution);
title('Circular Convolution (x1 * x2)');
xlabel('Sample Index');
ylabel('Amplitude');