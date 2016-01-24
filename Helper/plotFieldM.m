function plotFieldM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% plotFieldM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2)
% Zeigt das Magnetfeld eines Ringmagneten an
% Input: R1i -> Innenradius des Ringmagneten
% Input: R1a -> Auenradius des Ringmagneten
% Input: z1 -> Axiale position des Ringmagneten
% Input: h1 -> halbe Hhe des Ringmagneten
% Input: K1 -> Flchenstrom des Ringmagneten

% Netz erstellen
Ramax = max([max(R1a),max(R2a)]);
zmax = max([max(z1+h1),max(z2+h2)]);
zmin = min([min(z1-h1),min(z2-h2)]);
hmax = max([max(h1),max(h2)]);

global fieldpts;

[r,z] = meshgrid(linspace(1e-9,1.5*Ramax,fieldpts),linspace(zmin-2*hmax,zmax+2*hmax,fieldpts));

% radiale Komponente der Feldstärke
disp('Berechnet radiale Komponente der Flussdichte');

if( isOctave() )
    fflush(stdout);
end %if

Br = calcBrM(R1i,R1a,z1,h1,K1,r,z)+calcBrM(R2i,R2a,z2,h2,K2,r,z);

% axiale Komponente der Feldstärke
disp('Berechnet axiale Komponente der Flussdichte')

if( isOctave() )
    fflush(stdout);
end %if

Bz = calcBzM(R1i,R1a,z1,h1,K1,r,z)+calcBzM(R2i,R2a,z2,h2,K2,r,z);

% Plotten
figure(3);

% Vektorfeld plotten
quiver(r,z,Br,Bz);

hold on;

% Magnetquerschnitte plotten
for ii = 1:length(R1a)
    plotMagnetCSec(R1i(ii),R1a(ii),z1(ii),h1(ii),3);
    plotMagnetCSec(R2i(ii),R2a(ii),z2(ii),h2(ii),3);
end %for

hold off;

end %function
