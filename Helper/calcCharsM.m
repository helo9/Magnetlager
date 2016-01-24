% M steht fr Mulitiring
function char = calcCharsM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,crange)
% char = calcCharsM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,varargin)
% Berechnet Kraft- und Steifigkeitsverlauf eines Multiring-Lagers.
% Geometriedaten und Flächenströme sind Vektoren, als optionaler 
% Parameter kann der Auslenkungsbereich übergeben werden.

% Globale Variable einbinden
global fieldpts;

if length(crange)>1
    char.z = crange;
else
    if isscalar(crange) && crange > 0
        points = crange;
    else 
        points = fieldpts;
    end %if
    
    hmax = max(max(h1),max(h2));
    char.z = linspace(-3.3*hmax, 3.3*hmax,points);
end %if

% Kraft- und Steifigkeitsverlauf berechnen
char.Fz = zeros(size(char.z));
char.sz = zeros(size(char.z));

for ii = 1:length(char.z)
    disp(['Berechnung ',num2str(ii),'/',num2str(length(char.z))]);
    if(isOctave())
      fflush(stdout);
    end %if
    char.Fz(ii) = calcFzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2+char.z(ii),h2,K2);
    char.sz(ii) = calcSzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2+char.z(ii),h2,K2);
end %for

end %function