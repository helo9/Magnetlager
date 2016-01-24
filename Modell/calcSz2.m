function sz = calcSz2(x11,x12,z1,h1,K1,x21,x22,z2,h2,K2)
% sz = calcSz2(x11,x12,z1,h1,K1,x21,x22,z2,h2,K2)
% Berechnet die Steifigkeit in z-Richtung bei einem Rechteckquerschnitt zweidimensional.


ffluxdensr = @(x,z)calcBx22(x11,x12,z1,h1,real(K1),x,z)+calcBr2r(x11,x12,z1,h1,imag(K1),x,z);
ffluxdensz = @(x,z)-calcBz2a(x11,x12,z1,h1,real(K1),x,z)+calcBz2r(x11,x12,z1,h1,imag(K1),x,z);
% Minus vor CalcBz2a unbegründet!!

sz1 = calcSz2z(x21,x22,z2,h2,real(K2),ffluxdensr);
sz2 = calcSz2x(x21,x22,z2,h2,imag(K2),ffluxdensz);

sz = sz1+sz2;

end %function
