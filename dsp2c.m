N=8;
x=[1 1 1 1 0 0 0 0]
m=8
y=fft(x,m)
n=0:N-1
k=0:m-1
subplot(311)
stem(n,x)
title('Input Sequence')
xlabel('Time index(n)')
ylabel('Amplitude')
subplot(312)
stem(k,abs(y))
title('Magnitude of DFT sample')
xlabel('Frequency index(k)')
ylabel('magnitude')

subplot(313)
stem(k,180*angle(y)/pi)
title('Phase of DFT sample')
xlabel('Frequency index(k)')
ylabel('Angle')