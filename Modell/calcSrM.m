function sr = calcSrM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% sr = calcSrM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die Radialsteifigkeit eines Multiringlagers

sr = -0.5*calcSzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);

end

