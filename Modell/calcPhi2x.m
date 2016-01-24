function Phi = calcPhi2x (x11,x12,z1,h1,K1,x,z)
% Phi = calcPhi2x (x11,x12,z1,h1,K1,x,z)
% Berechnet das Skalarpotential eines Rechteckquerschnittes mit Magnetisierung in x-Richtung an
% der Position (x,z)

Phi = -calcPhi2z(0,2*h1,0,(x12-x11)/2,K1,z-z1+h1,x-(x12+x11)/2);

end %function
