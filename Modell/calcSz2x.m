function sz = calcSz2x( x21,x22,z2,h2,K2,ffluxdensz )
% sz = calcSz2x( x21,x22,z2,h2,K2,fvecpot )
% Berechnet Steifigkeit in z-Richtung bei Magnetisierung in x-Richtung zweidimensional
% in Abhängigkeit der Flussdichte in z-Richtung, gegeben mit ffluxdensz


if(K2 == 0)
    sz = 0;
    return
end %if

sz = - K2 .*(  ffluxdensz(x22,z2+h2)-ffluxdensz(x22,z2-h2)...
          -ffluxdensz(x21,z2+h2)+ffluxdensz(x21,z2-h2));

end %function
