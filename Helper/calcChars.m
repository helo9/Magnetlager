function chars = calcChars(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,crange)
	% chars = calcChars(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,crange)
	% Berechnet Kraft und Steifigkeitsverlauf abhängig von Geometrie
	% und Flächenströmen. Als optionaler Parameter kann der Verschiebungsbereich
	% angegeben werden.
	
	% Globale Variablen einbinden
    global fieldpts;
        
	% Wenn keine Punkte, für die Berechnung übergeben werden, selbst generieren
    
    if length(crange)>1
        z = crange;
    else
        if isscalar(crange) && crange > 0
            points = crange;
        else 
            points = fieldpts;
        end %if
        
        z = linspace(min(z1,z2)-2.2*max(h1,h2),max(z1,z2)+2.2*max(h1,h2),points)+(z2-z1);
    end %if
        
    % Kraft- und Steifigkeitsverlauf berechnen
    Fz = zeros(size(z));
    sz = zeros(size(z));
		
    for ii = 1:length(z)
        disp([' Berechnung ',num2str(ii),'/',num2str(length(z))]);
        if ( isOctave() )
            fflush(stdout);
        end %if
        z2 = z(ii);
            
        Fz(ii) = calcFz(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);
        sz(ii) = calcSz(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);
          
    end %for
        
    chars.z = z;
    chars.Fz = Fz;
    chars.sz = sz;
        
end %function
