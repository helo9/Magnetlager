function Bx = calcBx2x(x11,x12,z1,h1,K1,x,z)
% Bx = calcBx2x(x11,x12,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines Rechteckquerschnittes mit Magnetisierung
% in x-Richtung an Position (x,z) in x-Richtung  zweidimensional.


if ( K1 == 0)
    Bx = 0;
    return;
end %if

% Zurückführen auf Flussdichte eines Rechteckquerschnittes mit
% Magnetisierung in z-Richtung.
Bx = calcBz2z(0,2*h1,0,(x12-x11)/2,K1,z-z1+h1,x-(x11+x12)/2);

end %function
