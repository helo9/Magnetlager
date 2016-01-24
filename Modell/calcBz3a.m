function Bz = calcBz3a(R1i,R1a,z1,h1,K1,r,z)
% Bz = calcBz3a(R1i,R1a,z1,h1,K1,r,z)
% Berechnet die Flussdiche eines axial magnetisierten Ringmagneten
% in axialer Richtung an der Stelle (r,z) dreidimensional.

% Überlagern der Flussdichten von zwei Zylindermagneten
Bz = calcBz3a_part(R1a,z1,h1,K1,r,z) + calcBz3a_part(R1i,z1,h1,-K1,r,z);

end %function
