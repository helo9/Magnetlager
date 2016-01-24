function Bz = calcBz(R1i,R1a,z1,h1,K1,r,z)
% Bz = calcBz(R1i,R1a,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines Ringmagneten in axialer Richtung.

global twodim;

if(twodim)
	Bz = calcBz2(R1i,R1a,z1,h1,K1,r,z);
else
	Bz = calcBz3(R1i,R1a,z1,h1,K1,r,z);
end %if

end %function
