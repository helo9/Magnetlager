function Bx = calcBx2(x11,x12,z1,h1,K1,x,z)
% Bx = calcBx2(x11,x12,z1,h1,K1,x,z)
% Berechnet die Flussdichte eines Ringmagneten an Position (x,z)
% in x-Richtung  zweidimensional.

% 
Bx = calcBx2z(x11,x12,z1,h1,real(K1),x,z) + calcBx2x(x11,x12,z1,h1,imag(K1),x,z);

end %function

