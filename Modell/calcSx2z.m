function sx = calcSx2z( R2i,R2a,z2,h2,K2,ffluxdensz )
% sx = calcSx2z( R2i,R2a,z2,h2,K2,ffluxdensz )
% Berechnet die Steifigkeit f�r einen Rechteckquerschnitt mit 
% Magnetisierung in z-Richtung zweidimensional in Abh�ngigkeit
% der in ffluxdensz gegeben Flussdichte in z-Richtung

sr = -calcSz2a(R2i,R2a,z2,h2,K2,ffluxdensz)

end %function
