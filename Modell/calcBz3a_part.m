function Bz = calcBz3a_part(R1,z1,h1,K1,r,z)
% Bz = calcBz3a_part(R1,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines Zylindermagneten in axialer Richtung an Position (r,z) dreidimensional.´

%Definition
per0 = 4*pi*10^-7;

% Abkürzungen nach Lang
rzo = z-(z1+h1);
rzu = z-(z1-h1);

co = (R1+r).^2 + rzo.^2;
cu = (R1+r).^2 + rzu.^2;

ko = sqrt(4*R1.*r./((R1+r).^2+rzo.^2));
ku = sqrt(4*R1.*r./((R1+r).^2+rzu.^2));

par = (4*R1.*r)./(R1+r).^2; %lambda^2

% Zerlegung der Formel in zwei Teile
part1 = 2.*rzo./sqrt(co).*(calcK(ko)+(R1-r)./(R1+r).*calcPi(ko,par));
part2 = 2.*rzu./sqrt(cu).*(calcK(ku)+(R1-r)./(R1+r).*calcPi(ku,par));

% Berechnung der Flussdichte
Bz = -per0*K1/(4*pi) .* ( part1 - part2 );

end %function
