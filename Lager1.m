function Lager = Lager1()
% Parameter für Einfachringlager

% Dreidimensionale Berechnung
global twodim;

twodim = false;

% Parameter definieren

Lager = struct();


% Ring1 -> Feld dieses Ringes wird bestimmt
%% Innenradius
Lager.R1i = 78*1e-3;
%% Auenradius
Lager.R1a = 88*1e-3;
%% halbe Höhe
Lager.h1 = 12.5/2*1e-3;
%% axiale Position
Lager.z1 = 0;
%% Remanenzflussdichte
Lager.Br1 = 1.35; 


% Ring2 -> Kraft des Feldes auf diesen Ring wird berechnet
%% Innenradius
Lager.R2i = 89*1e-3;
%% Aenradius
Lager.R2a = 99*1e-3;
%% halbe Höhe
Lager.h2 = 12.5/2*1e-3;
%% axiale Position
Lager.z2 = 0;
%% Remanenzflussdichte
Lager.Br2 = -1.35;

% Lagerbelastung -> für Arbeitspunktberechnung
Lager.Fg = 53.72*9.81;

end %function

