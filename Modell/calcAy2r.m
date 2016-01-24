function Ay = calcAy2r (x11,x12,z1,h1,K1,x,z)
% Ay = calcAy2r(R1i,R1a,z1,h1,K1,x,z)
% Berechnet das Vektorpotential eines Rechteckquerschnittes mit Magnetisierung
% in x-Richtung an der Position (x,z) zweidimensional.


if ( K1 == 0)
  Ay = 0;
  return
end %if

% Rückführung auf Magnetisierung in z-Richtung mit Koordinatentransformation
Ay = -calcAy2a(0,2*h1,0,(x12-x11)/2,K1,z-z1+h1,x-(x12+x11)/2);

end %function
