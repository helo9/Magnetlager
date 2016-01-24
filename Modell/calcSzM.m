function sz = calcSzM( R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2 )
% sz = calcSzM( R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2 )
% Berechnet die Axialsteifigkeit eines Multiringlagers


global twodim;


ffluxdensr = @(r,z)calcBrM(R1i,R1a,z1,h1,+real(K1)+1i*imag(K1),r,z);
ffluxdensz = @(r,z)calcBzM(R1i,R1a,z1,h1,+real(K1)+1i*imag(K1),r,z);

if twodim
    Rm = (sum(R1i)+sum(R1a)+sum(R2a)+sum(R2i))/(2*length(R1i)+2*length(R2a));
    sz1 = 2*pi*Rm*calcSz2z(R2i,R2a,z2,h2,real(K2),ffluxdensr);
    sz2 = 2*pi*Rm*calcSz2x(R2i,R2a,z2,h2,imag(K2),ffluxdensz);
else
    sz1 = calcSz3a(R2i,R2a,z2,h2,real(K2),ffluxdensr);
    sz2 = 0;
    if imag(K2) ~= 0
        warning('Radiale Magnetisierung wird ignoriert')
    end %if
end %if

sz = sum(sz1+sz2);

end

