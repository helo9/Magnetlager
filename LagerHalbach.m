function Lager = LagerHalbach()
% Enthält Parameter zur Berechnung eines
% vertikalen Halbach-Array Lagers 

global twodim;

twodim = true;

% Ring1
%% Innenradius
Lager.R1i = 78*1e-3;
%% Außenradius
Lager.R1a = 88*1e-3;
%% halbe Höhe
Lager.h1 = 12.5/2*1e-3;
%% axiale Position
Lager.z1 = 0;
%% Remanenzflussdichte
Lager.Br1 = 1.35i; % imaginär bedeutet radiale Magnetisierung


% Ring2
%% Innenradius
Lager.R2i = 89*1e-3;
%% Aenradius
Lager.R2a = 99*1e-3;
%% halbe Höhe
Lager.h2 = 12.5/2*1e-3;
%% axiale Position
Lager.z2 = 0;
%% Remanenzflussdichte
Lager.Br2 = 1.35i; % imaginär bedeutet radiale Magnetisierung

% Lagerbelastung
Lager.Fg = 53.72*9.81;

Lager = genHalbachPar(Lager,3);

end %function