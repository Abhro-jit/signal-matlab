clc;
clear all;
close all;
num=[0.25,0,0,0.25];
den=[1,-2,2,-1];
[z,p,k]= tf2zp(num,den);
z plane(z,p)
[sos,g]=zp2sos(z,p,k)
figure(1)
