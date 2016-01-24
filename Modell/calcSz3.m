function sz = calcSz3(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% sz = calcSz3(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die axiale Steifigkeiten zwischen zwei Ringmagneten dreidimensional.

if ( imag(K1) ~= 0 ) 
    warning('Modell unterstützt keine Radiale Magnetisierung des felderzeugenden Ringes');
end %if

ffluxdensr = @(r,z)calcBr3a(R1i,R1a,z1,h1,real(K1),r,z);
ffluxdensz = @(r,z)calcBz3a(R1i,R1a,z1,h1,real(K1),r,z);

sz1 = calcSz3a(R2i,R2a,z2,h2,real(K2),ffluxdensr);
sz2 = calcSz3r(R2i,R2a,z2,h2,imag(K2),ffluxdensz);

sz = sz1+sz2;

end %function
