function Fz = calcFz2(x11,x12,z1,h1,K1,x21,x22,z2,h2,K2)
% Fz = calcFz2(x11,x12,z1,h1,K1,x21,x22,z2,h2,K2)
% Berechnet die Kraft in z-Richtung zwischen zwei Rechteckquerschnitten

% Aufstellen Vektorpotential und Flussdichte des 1. Querschnittes; axial und
% radial
fvecpot = @(r,z)calcAy2(x11,x12,z1,h1,K1,r,z);
fscalpot = @(r,z)calcPhi2(x11,x12,z1,h1,K1,r,z);

% Berechnung Axialkraft axial und radial
Fz1 = calcFz2z(x21,x22,z2,h2,real(K2),fvecpot);
Fz2 = calcFz2x(x21,x22,z2,h2,imag(K2),fscalpot);

% Addition axialer und radialer Kraftanteil
Fz = Fz1+Fz2;

end %function
