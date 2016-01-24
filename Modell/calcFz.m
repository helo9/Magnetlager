function Fz = calcFz(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Fz = calcFz(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die axiale Kraft zwischen zwei Ringmagneten

global twodim;


if ( twodim )

    R = getRadius(R1i,R1a,R2i,R2a);
    
    Fz = 2*pi*R.*calcFz2(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);

else
	
	Fz = calcFz3(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);

end %function
