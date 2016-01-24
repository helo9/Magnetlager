function A_phi = calcAp3a(R1i,R1a,z1,h1,K1,r,z)
% A_phi = calcAp3a(R1i,R1a,z1,h1,K1,r,z)
% Berechnet das Vektorpotential an Position (r,z) eines axial magnetisierten Ringmagneten
% dreidimensional in Umfangsrichtung.

% Abbrechen, wenn Fl�chenstrom = 0
if(K1 == 0)
    A_phi = 0;
    return
end %if

% �berlagern von Fl�chenstr�men zweier Zylindermantelfl�chen
A_phi = calcAp3a_part(R1a,z1,h1,K1,r,z)+calcAp3a_part(R1i,z1,h1,-K1,r,z);

end %function
