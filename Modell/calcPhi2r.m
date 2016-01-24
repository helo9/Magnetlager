function Phi = calcPhi2r (R1i,R1a,z1,h1,K1,r,z)
% Phi = calcPhi2r (R1i,R1a,z1,h1,K1,r,z)
% Berechnet das Skalarpotential bei radialer Magnetisierung zweidimensional 
% 
% Parameter
% R1i : Innenradius
% R1a : Außenradius
% z1  : z-Koordinate der mittleren Höhe des Rechtecks
% h1  : halbe Höhe des Rechtecks
% K1  : Flächenstrom in y-Richtung
% x   : x-Koordinate des Feldpunktes
% z   : z-Koordinate des Felpunktes
%
% Rückgabewerte
% Phi : Skalarpotential des rechteckigen Querschnittes an Stelle x,z

Phi = -calcPhi2a(0,2*h1,0,(R1a-R1i)/2,K1,z-z1+h1,r-(R1a+R1i)/2);

endfunction
