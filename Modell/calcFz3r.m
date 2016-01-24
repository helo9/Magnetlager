function Fz = calcFz3r(R2i,R2a,z2,h2,K2,ffluxdens)
% Fz = calcFz3r(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Berechnet die axiale Kraft auf einen radial magnetisierten Ringmagneten.
% Dazu wird als Parameter ffluxdens, die Flussdichte in radialer Richtung 
% des vorliegenden Magnetfeldes übergeben. 

if( z2 == 0)
    z2 = realmin;
end % if

if(  K2 == 0)
    Fz = 0;
    return
end %if

% Abkürzungen
z2o = z2+h2;
z2u = z2-h2;

% Integrand aufstellen
Int = @(r) r.*(ffluxdens(r,z2o)-ffluxdens(r,z2u));

% numerische Integration
erg = quadgk(Int,R2i,R2a);

% Berechnung Axialkraft
Fz = -2*pi.*K2.*erg;

end %function
