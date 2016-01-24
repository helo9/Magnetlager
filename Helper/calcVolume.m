function V = calcVolume(R1i,R1a,h1,R2i,R2a,h2)
% V = calcVolume(R1i,R1a,h1,R2i,R2a,h2)
% Berechnet das Lagervolumen mithilfe der Geometriedaten.

V = 2*pi*sum((R1a.^2-R1i.^2).*h1+(R2a.^2-R2i.^2).*h2);

end %function