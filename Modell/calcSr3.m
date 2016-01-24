function sr = calcSr3(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% sr = calcSr3(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die Steifigkeit eines Lagers in radialer Richtung dreidimensional.

sr = - 0.5 * calcSz3(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);

end %function
