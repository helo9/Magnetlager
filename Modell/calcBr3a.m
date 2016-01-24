function Br = calcBr3a(R1i,R1a,z1,h1,K1,r,z)
% Br = calcBr3a(R1i,R1a,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines axial magnetisierten Ringmagneten
% an Position (r,z) in radialer Richtung dreidimensional


Br = calcBr3a_part(R1a,z1,h1,K1,r,z) + calcBr3a_part(R1i,z1,h1,-K1,r,z);

end %function
