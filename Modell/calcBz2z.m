function Bz = calcBz2z(x11,x12,z1,h1,K1,x,z)
% Bz = calcBz2a(x11,x12,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines Rechteckquerschnittes in z-Richtung mit Magnetisierung
% in z-Richtung an Position (x,z) zweidimensional.

if(K1 == 0)
    Bz = 0;
    return;
end %if

per0 = 4*pi*10^-7;

rx1 = x - x11;
rx2 = x - x12;
rzo = z-(z1+h1);
rzu = z-(z1-h1);

Bz =  per0 * K1 / (2 * pi) * (atan(rzo/rx2) - atan(rzu/rx2) ...
                                - atan(rzo/rx1) + atan(rzu/rx1));

end %function
