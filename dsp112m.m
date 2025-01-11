fs= 40000; 
kp= 1;
ks= 40;
fp= 4000;
fstop= 8000;
wp= fp/(fs/2);
wstop= fstop/(fs/2);
[N, wc]= buttord(wp,wstop,kp,ks);
[b a]= butter(N,wc,'low');
figure(1)
freqz(b,a,20000,fs);