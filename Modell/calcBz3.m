function Bz = calcBz3(R1i,R1a,z1,h1,K1,r,z)
% Bz = calcBz3(R1i,R1a,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines Ringmagneten an Position (r,z)
% in z-Richtung  dreidimensional.

Bz = calcBz3a(R1i,R1a,z1,h1,real(K1),r,z);

end %function
