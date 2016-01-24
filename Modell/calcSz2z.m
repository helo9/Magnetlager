function sz = calcSz2z( x21,x22,z2,h2,K2,ffluxdensr )
% sz = calcSz2z( x21,x22,z2,h2,K2,fvecpot )
% Berechnet Steifigkeit in z-Richtung bei Magnetisierung in z-Richtung zweidimensional
% in Abhängigkeit der Flussdichte in x-Richtung, gegeben mit ffluxdensr

if(K2 == 0)
    sz = 0;
    return
end %if

sz = K2 .*(  ffluxdensr(x22,z2+h2)-ffluxdensr(x22,z2-h2)...
          -(ffluxdensr(x21,z2+h2)-ffluxdensr(x21,z2-h2)));

end

