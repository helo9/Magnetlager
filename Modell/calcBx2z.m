function Bx = calcBx2z(x11,x12,z1,h1,K1,x,z)
% Bx = calcBx2z(x11,x12,z1,h1,K1,x,z)
% Berechnet die Flussdichte eines Rechteckquerschnittes mit Magnetisierung
% in z-Richtung an Position (x,z) in x-Richtung  zweidimensional.

if ( K1 == 0)
    Bx = 0;
    return;
end %if

per0 = 4*pi*10^-7;

rx1 = x - x11;
rx2 = x - x12; 
rzo = z-(z1+h1);
rzu = z-(z1-h1);

Bx = - per0 * K1/(4*pi) .* (log((rx2.^2+rzo.^2)/(rx2.^2+rzu.^2))-log((rx1.^2+rzo.^2)./(rx1.^2+rzu.^2)));

end %function
