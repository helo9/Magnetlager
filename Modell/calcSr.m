function sr = calcSr(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% sr = calcSr(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die radiale Magnetisierung aus der axialen Magnetisierung

sr = -0.5.*calcSz(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);

end %function