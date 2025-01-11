x=[1 0 2 -1 4 2 3 8]
N=length(x)
k=N
n=0;1:N-1
figure(1)
subplot(311)
stem(n,x)
title('Input sequencee')
xlabel('Time Index(n)')
ylabel('Amplitude')
y_func = fft(x,k)
k=0:1:k-1
subplot(312)
stem(k,y_func)
title('FFt sequence using matlab command')
xlabel('Frequency Index')
ylabel('Amplitude')

y_mannual = []
for k=0:1:k-1
    val=0
    for  n=0:1:N-1

val=val+(x(n+1)*exp(-i*2*pi*k*n/N))
    end
    y_mannual = [y_manual,val]
end
k= 0:1:k-1
subplot(313)
stem(k,y_mannual)
title('FFT sequence using Equation')
xlabel('Frequency Index')
ylabel('Amplitude')