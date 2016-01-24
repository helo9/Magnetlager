function Fz = calcFz3(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Fz = calcFz3(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die axiale Kraft zwischen zwei Ringmagneten dreidimensional.


if ( imag(K1) ~= 0 ) 
    warning('Modell unterstützt keine Radiale Magnetisierung des felderzeugenden Ringes');
end %if

% Aufstellen Vektorpotential und Flussdichte des 1. Ringes; axial und
% radial
fvecpot = @(r,z)calcAp3a(R1i,R1a,z1,h1,real(K1),r,z);
ffluxdens = @(r,z)calcBr3a(R1i,R1a,z1,h1,real(K1),r,z);


% Berechnung Axialkraft axial und radial
Fz1 = calcFz3a(R2i,R2a,z2,h2,real(K2),fvecpot);
Fz2 = calcFz3r(R2i,R2a,z2,h2,imag(K2),ffluxdens);

% Addition axialer und radialer Kraftanteil
Fz = Fz1+Fz2;

end %function
