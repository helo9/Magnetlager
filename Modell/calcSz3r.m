function sz = calcSz3r(R2i,R2a,z2,h2,K2,ffluxdensz)
% sz = calcSz3r(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die Axialsteifigkeit eines radial magnetisierten Ringmagneten
% in Abhängigkeit der Vorliegenden Flussdichte in z-Richtung, gegeben durch ffluxdensz.


if( K2 == 0)
  sz = 0;
  return
end

z2o = z2+h2;
z2u = z2-h2;

part1 = R2a*( ffluxdensz(R2a,z2o) - ffluxdensz(R2a,z2u) ) -R2i*( ffluxdensz(R2i,z2o) - ffluxdensz(R2i,z2u) );

Integ = @(r)arrayfun(@(x) ffluxdensz(x,z2o)-ffluxdensz(x,z2u),r);
part2 = quad(Integ,R2i,R2a);

sz = 2*pi*K2*(part1-part2);

end %function
