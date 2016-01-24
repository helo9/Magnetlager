function Bz = calcBz2x(x11,x12,z1,h1,K1,x,z)
% Bz = calcBz2r(x11,x12,z1,h1,K1,x,z)
% Berechnet die Flussdichte eines Rechteckquerschnittes in z-Richtung mit Magnetisierung
% in x-Richtung an Position (x,z) zweidimensional.

% Zurückführen auf Querschnitt mit Magnetisierung in z-Richtung
Bz = calcBx2z(0,2*h1,0,(x12-x11)/2,K1,z-z1+h1,x-(x11+x12)/2);

end %function