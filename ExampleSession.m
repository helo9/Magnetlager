% Beispielberechnung

%% Initialisieren (Path variable erweitern)
Init;

%% Kraft und Steifigkeitsverlauf plotten
PlotChar('Lager1',[-1e-2:1e-3:1e-2]);

%% Magnetfeld anzeigen lassen

Field('Lager1');

%% Axialkraft und -steifigkeit und Radialsteifigkeit berechnen

CalcChar('Lager1');