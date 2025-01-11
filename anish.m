z= tf('z');
%CREATING TRANSFER FUNCTION AND CHECK WHETHER IT IS STABLE OR NOT
H=(0.5*(1+z^-1)*(1-z^-1 +z^-2))/((1-z^-1)*(1-z^-1+z^-2))


figure(1)
pzmap(H)
if isstable(H)
    disp("The system is stable");
else 
    disp("The system is not stable");
end


cascade realization structure of second order section 
of the transfer function
[num,den] = tfdata(H,'v');
[z,p,k] = tf2zp(num,den);
[sos, g] = zp2sos(z,p,k)
