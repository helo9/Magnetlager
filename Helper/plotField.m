function [r,z,Br,Bz] = plotField(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)

% Berechnungspunkte erstellen
global fieldpts twodim;

Ramax = max([R1a,R2a]);
Rimin = min([R1i,R2i]);
hmax = max([h1,h2]);

z1u = z1-h1;
z1o = z1+h1;
z2u = z2-h2;
z2o = z2+h2;

zumin = min([z1u,z2u]);
zomax = max([z1o,z2o]);

[r,z] = meshgrid(linspace(R1i*0.5,1.5*Ramax,fieldpts),linspace(zumin-3*hmax,zomax+3*hmax,fieldpts));

% Matrizen für Ergebnisse deklarieren
dim = size(r);

Br = zeros(dim);
Bz = zeros(dim);

% Eigentliche Berechnung
for ii = 1:dim(1)
    for jj = 1:dim(2)
        
        disp(['  Berechnung ',num2str((ii-1)*dim(1)+jj),'/',num2str(dim(1)*dim(2))]);
        
        if isOctave()
          fflush(stdout);
        end %if
        
        Br(ii,jj) = calcBr(R1i,R1a,z1,h1,K1,r(ii,jj),z(ii,jj))+calcBr(R2i,R2a,z2,h2,K2,r(ii,jj),z(ii,jj));
        Bz(ii,jj) = calcBz(R1i,R1a,z1,h1,K1,r(ii,jj),z(ii,jj))+calcBz(R2i,R2a,z2,h2,K2,r(ii,jj),z(ii,jj));
        
    end %for
end %for


B = sqrt(Br.^2+Bz.^2);

%
figure(3);

hold on;

% Vektorfeld plotten
quiver(r,z,Br,Bz,'r');


% Magnetquerschnitte plotten
plotMagnetCSec(R1i,R1a,z1,h1,3);
plotMagnetCSec(R2i,R2a,z2,h2,3);

end %function