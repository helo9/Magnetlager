function sz = calcSz(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% sz = calcSz(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die axiale Steifigkeit eines Lagers mit zwei Magnetringen

global twodim;

if( twodim )
    R = getRadius(R1i,R1a,R2i,R2a);
	sz = 2*pi*R.*calcSz2(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);
else
	sz = calcSz3(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);
end %if

end %function
