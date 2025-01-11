X=[1 0 2 0 1 1 0 2]
k=length(X)
N=k
x=ifft(X,N)
k=0:1:k-1
subplot(311)
stem(k,X)
title('DFT Samples')
xlabel('Frequency index (k)')
ylabel('Amplitude')
n = 0:1:N-1
subplot(312)
stem(n,real(x))
title('Real Part')
xlabel('Time Index')
ylabel('Real Numbers')

subplot(313)
stem(n,img(x))
title('Imaginary Part')
xlabel('Time Index')
ylabel('Imaginary Numbers')
