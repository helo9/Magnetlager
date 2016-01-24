function A_phi = calcAp(R1i,R1a,z1,h1,K1,r,z)
% A_phi = calcVecpot(R1i,R1a,z1,h1,K1,r,z)
% Berechnet das Vektorpotential an Position (r,z) eines Ringmagneten 
% in Umfangsrichtung.

global twodim;

if(K1 == 0)
    A_phi = 0;
    return
elseif(twodim)
	A_phi = calcAy2(R1i,R1a,z1,h1,K1,r,z);
else
	A_phi = calcAp3a(R1i,R1a,z1,h1,K1,r,z);
end %if

end %function
