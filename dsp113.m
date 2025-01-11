n=6;
Fs=2000;
fc=100;
wc=2*fc/Fs;
[bz,az]=butter(n,wc);
[H,f]=freqz(bz,az,fc,Fs);
figure(1)
plot(f,20*log10(abs(H)))
xlabel("Frequency (HZ)")
ylabel('magnitude Response(db)')
t=0:1/fs:5;
sw=sin(120*pi*t);
n=sin(200*pi*t)+sin(210*pi*t)+sin(220*pi*t)+sin(1400*pi*t);
swn=sw+n;
figure(2)
subplot('411')
plot(t,sw),axis([0 ])
