clc;
clear all;
close all;
num=[0.25,0,0,0.25];
den=[1,-2,2,-1];
[z,p,k]= tf2zp(num,den);
zplane(z,p)
[sos,g]=zp2sos(z,p,k)
figure(1)
sys = tf(num, den);  % create the transfer function
pol es = pole(sys);  % to get the poles of the transfer function
% checks for stable, marginally stable and unstable
if all(real(poles) < 0) 
    disp('The transfer function is stable.');
elseif all(real(poles) <= 0) && any(real(poles) < 0)
    disp('The transfer function is marginally stable.');
else
    disp('The transfer function is unstable.');
end