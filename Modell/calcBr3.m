function Br = calcBr3(R1i,R1a,z1,h1,K1,r,z)
% Br = calcBr3(R1i,R1a,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines Ringmagneten an Position (r,z)
% in radialer Richtung dreidimensional.

Br = calcBr3a(R1i,R1a,z1,h1,real(K1),r,z);

end %function
