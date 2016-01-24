function Bz = calcBz2(x11,x12,z1,h1,K1,x,z)
% Bz = calcBz2(x11,x12,z1,h1,K1,x,z)
% Berechnet die Flussdichte eines Rechteckquerschnittes an Position (x,z)
% in z-Richtung  zweidimensional.


Bz = calcBz2z(x11,x12,z1,h1,real(K1),x,z)+calcBz2x(x11,x12,z1,h1,imag(K1),x,z);

end %function
