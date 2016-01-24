function Ay = calcAy2a(x11,x12,z1,h1,K1,x,z)
% Ay = calcAy2r(x11,x12,z1,h1,K1,x,z)
% Berechnet das Vektorpotential eines Rechteckquerschnittes mit Magnetisierung
% in x-Richtung an der Position (x,z) zweidimensional.

%Vakuumpermeabilität
per0 = 4*pi*10^-7;

% Abkürzungen
rx1 = x - x11;
rx2 = x - x12;
rzo = z-(z1+h1);
rzu = z-(z1-h1);

% eigentliche Berechnung
Ay = per0*K1/(2*pi) * ((rx2 * atan(rzo/rx2)-rx2*atan(rzu/rx2) ...
                        +rzo/2 * log(rx2^2+rzo^2) - rzu/2 * log(rx2^2+rzu^2) + 2 * h1)...
                    -((rx1 * atan(rzo/rx1)-rx1*atan(rzu/rx1) ...
                        +rzo/2 * log(rx1^2+rzo^2) - rzu/2 * log(rx1^2+rzu^2) + 2 * h1)));
                        
end %function
