function Fz = calcFz3a(R2i,R2a,z2,h2,K2,fvecpot)
% Fz = calcFz3a(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die axiale Kraft auf einen axial Magnetisierten Ringmagneten.
% Der Parameter fvecpot beinhaltet eine anonmye Funktion zur Berechnung 
% des Vektorpotentials.

if( K2 == 0)
    Fz = 0;
    return
end %if

% Abkürzungen
z2o = z2+h2;
z2u = z2-h2;

% Integrand aufstellen
Fz = 2*pi.*K2.*(R2a.*(fvecpot(R2a,z2o)-fvecpot(R2a,z2u))-R2i.*(fvecpot(R2i,z2o)-fvecpot(R2i,z2u)));

end %function
