function sz = calcSz3a(R2i,R2a,z2,h2,K2,ffluxdensr)
% sr = calcSz3a(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die Axialsteifigkeit eines Ringmagneten in Abhängigkeit der vorliegenden
% Flussdichte, gegeben durch ffluxdensr

if( K2 == 0)
  sz = 0;
  return
end

z2o = z2+h2;
z2u = z2-h2;

part1 = R2a.*( ffluxdensr(R2a,z2o) - ffluxdensr(R2a,z2u) );
part2 = R2i.*( ffluxdensr(R2i,z2o) - ffluxdensr(R2i,z2u) );

sz = 2*pi*K2.*(part1-part2);

end %function
