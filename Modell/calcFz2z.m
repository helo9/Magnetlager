function Fz = calcFz2z( x21,x22,z2,h2,K2,fvecpot )
% Fz = calcFz2z( x21,x22,z2,h2,K2,fvecpot)
% Berechnet Kraft in z-Richtung auf einen in z-Richtung Magnetisierten
% Rechteckquerschnitt zweidimensional. Der Parameter fvecpot beinhaltet
% eine anonmye Funktion zur Berechnung des Vektorpotentials.


if(K2 == 0)
    Fz = 0;
    return
end %if

z2o = z2+h2;
z2u = z2-h2;

Fz = K2 .* (fvecpot(x22, z2o)-fvecpot(x22, z2u)-fvecpot(x21,z2o)+fvecpot(x21,z2u));

end

