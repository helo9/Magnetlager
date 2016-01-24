function A_phi = calcAp3a_part(R,z1,h,K,r,z)
% A_phi = calcAp3a_part(R1,z1,h,K1,r,z)
% Berechnet das Vektorpotential eines Zylindermagneten an 
% Position (r,z) in Umfangsrichtung dreidimensional.

%Definition
per0 = 4*pi*10^-7;

% Abkürzungen nach Lang
rzo = z-(z1+h);
rzu = z-(z1-h);

co = (R+r).^2 + rzo.^2;
cu = (R+r).^2 + rzu.^2;

ko = sqrt(4*R.*r./((R+r).^2+rzo.^2));
ku = sqrt(4*R.*r./((R+r).^2+rzu.^2));

par = (4*R.*r)./(R+r).^2; %lambda^2

% Zerlegung der Formel in zwei Teile
part1 = (rzo.^2+2*R.^2+2.*r.^2)./sqrt(co) .* calcK(ko)-sqrt(co).*calcE(ko)-(R-r).^2./sqrt(co).*calcPi(ko,par);
part2 = (rzu.^2+2*R.^2+2.*r.^2)./sqrt(cu) .* calcK(ku)-sqrt(cu).*calcE(ku)-(R-r).^2./sqrt(cu).*calcPi(ku,par);

% Berechnung des Vektorpotentials
A_phi = -per0*K/(4*pi).*(rzo./r .* part1 - rzu./r .* part2);

end %function
