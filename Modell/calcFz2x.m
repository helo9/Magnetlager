function Fz = calcFz2x( x21,x22,z2,h2,K2,fscalpot )
% Fz = calcFz2x( x21,x22,z2,h2,K2,fvecpot )
% Berechnet Kraft in z-Richtung auf einen in x-Richtung Magnetisierten
% Rechteckquerschnitt zweidimensional. Der Parameter fscalpot beinhaltet
% eine anonmye Funktion zur Berechnung des Skalarpotentials.


if(K2 == 0)
    Fz = 0;
    return
end %if

%Definition
per0 = 4*pi*10^-7;

z2o = z2+h2;
z2u = z2-h2;

Fz = K2*per0.*(fscalpot(x22,z2+h2)-fscalpot(x21,z2+h2)...
              -fscalpot(x22,z2-h2)+fscalpot(x21,z2-h2));;

end

