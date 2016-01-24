function Fz = calcFzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Fz = calcFzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die Axialkraft auf Multiringlagern.

global twodim;

fvecpot = @(r,z)calcApM(R1i,R1a,z1,h1,K1,r,z);

if twodim
    Rm = (sum(R1i)+sum(R1a)+sum(R2a)+sum(R2i))/(2*length(R1i)+2*length(R2a));
    fscalpot = @(r,z)calcPhiM(R1i,R1a,z1,h1,-real(K1)+1i*imag(K1),r,z);

    Fz1 = 2*pi*Rm*calcFz2z(R2i,R2a,z2,h2,real(K2),fvecpot);
    Fz2 = 2*pi*Rm*calcFz2x(R2i,R2a,z2,h2,imag(K2),fscalpot);
    Fz = sum(Fz1+Fz2);

else
    ffluxdens = @(r,z)calcBrM(R1i,R1a,z1,h1,K1,r,z);
    Fz1 = calcFz3a(R2i,R2a,z2,h2,real(K2),fvecpot);
    Fz2 = 0;
    if imag(K2) ~= 0
        warning('Radiale Magnetisierung wird ignoriert')
    end %if
    Fz = sum(Fz1+Fz2);
end %if



end