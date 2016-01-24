function Br = calcBr3a_part(R1,z1,h1,K1,r,z)
% Br = calcBr3a_part(R1,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines axial magnetisierten Zylindermagneten
% an Position (r,z) in radialer Richtung dreidimensional


%Definition
per0 = 4*pi*10^-7;

% Abkürzungen nach Lang
rzo = z-(z1+h1);
rzu = z-(z1-h1);

co = (R1+r).^2 + rzo.^2;
cu = (R1+r).^2 + rzu.^2;

ko = sqrt(4*R1.*r./((R1+r).^2+rzo.^2));
ku = sqrt(4*R1.*r./((R1+r).^2+rzu.^2));

% Zerlegung der Formel in zwei Teile
part1 = 4*R1./sqrt(co).* ( 2.*(calcK(ko)-calcE(ko))./ko.^2 - calcK(ko) );
part2 = 4*R1./sqrt(cu).* ( 2.*(calcK(ku)-calcE(ku))./ku.^2 - calcK(ku) );

% Berechnung der Flussdichte
Br = per0*K1/(4*pi) .* ( part1 - part2 );

end %function
