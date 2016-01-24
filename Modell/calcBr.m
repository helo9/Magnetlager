function Br = calcBr(R1i,R1a,z1,h1,K1,r,z)
% Br = calcBr(R1i,R1a,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines Ringmagneten in radialer Richtung.

global twodim;

if(twodim)
	Br = calcBx2(R1i,R1a,z1,h1,K1,r,z);
else
	Br = calcBr3(R1i,R1a,z1,h1,K1,r,z);
end %if

end %function

