function res = CalcChar(param)
% res = CalcChar(param)
% Berechne Lagerkennwerte für durch param definiertes Lager.

    function comp = isacomplex(a)
        for jj = 1:length(a)
            if ( real(a(jj))~=0)
                comp = false;
                return
            end %if
        end %if
        comp = true;
    end %function


[R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,Multi,Fg] = extractData( param );
    



if ( length(K1) == 1 && length(K2) == 1)
    % Einfachringe
    
    % Attraktive Anordnungen
    if (( isreal([K1,K2]) && K1*K2 < 0 ) || (isacomplex([K1,K2]) && K1*K2 > 0) )
      
        sz = @(z) calcSz(R1i,R1a,0,h1,K1,R2i,R2a,z,h2,K2);
        fz = @(z) calcFzM(R1i,R1a,0,h1,K1,R2i,R2a,z,h2,K2);

        res.zmax = fsolve(sz,-0.3*sum(h1+h2)/length(h1));
        
        % maximale Kraft berechnen
        res.Fmax = fz(res.zmax);

        % maximale Steifigkeit berechnen
        res.szmax = sz(0);

        if exist('Fg','var')
            % Arbeitspunkt finden
            Fz = @(z) fz(z)-Fg;

            if( res.Fmax < Fg )
                warning('Maximalkraft des Magneten zu klein');
            else
                res.z0 = fzero(Fz,[res.zmax/10000,res.zmax]); %Arbeitspunkt wird zwischen 0 und zmax vermutet, 0 ~ zmax/10000, da Fz(0) = Nan
                res.s0 = sz(res.z0);
            end %if
        end %if
        
    % Repulsive Anordung
    elseif( (isreal([K1,K2]) && K1*K2 > 0 ) || (isacomplex([K1,K2]) && K1*K2 < 0) )
    
        fz = @(z) calcFz(R1i,R1a,0,h1,K1,R2i,R2a,z,h2,K2);
        sz = @(z) calcSzM(R1i,R1a,0,h1,K1,R2i,R2a,z,h2,K2);
        
        h = (h1+h2)/2;
        
        res.zmax = fminbnd(@(z)-fz(z),h,1.9*2*h);    
        
        res.Fmax = fz(res.zmax);
        
        if exist('Fg','var')
            % Arbeitspunkt finden
            Fz = @(z) fz(z)-Fg;

            if( res.Fmax < Fg )
                warning('Maximalkraft des Magneten zu klein');
            else
                res.z0 = fzero(Fz,[res.zmax,2.3*res.zmax]); %Arbeitspunkt wird zwischen 0 und zmax vermutet, 0 ~ zmax/10000, da Fz(0) = Nan
                res.s0 = sz(res.z0);
            end %if
        end %if
        
    elseif( K1*K2 ~=0)
      % axial und radial Magnetisierter Ring
      res.Fmax = calcFz(R1i,R1a,0,h1,K1,R2i,R2a,0,h2,K2);
      res.zmax = 0;
      
      sz = @(z) calcSz(R1i,R1a,z1,h1,K1,R2i,R2a,z,h2,K2);
      
      % Maximale Steifigkeit finden (Vorzeichen umgekehrt)
      [res.zmaxS,res.szmax] = fminsearch(@(z)-sz(z),1e-9);
      
      % Vorzeichen muss wieder umgedreht werden
      res.szmax = -res.szmax;

      Fz = @(z) abs(calcFz(R1i,R1a,z1,h1,K1,R2i,R2a,z,h2,K2))-Fg;
      
      res.z0 = fsolve(Fz,res.zmaxS);
      res.sz0 = sz(res.z0);
      
    end %if
    
    % Charakteristische Punkte plotten
    
    cchars = calcChars(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,130);  
    

elseif ischar(Multi) 
    % Multiringmagnete
    
    if strcmp(Multi,'halbach')
        % Halbach Array
        funFz = @(z) calcFzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2+z,h2,K2);
        sz = @(z) calcSzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2+z,h2,K2);
        
        % KraftMaximum finden
        [res.zmax, negFmax, info] = fminbnd(@(z)-funFz(z),-3*h1(1),-1.2*h1(1));
        
        % maximale Kraft
        res.Fmax = -negFmax;    
        
        if(res.Fmax >  Fg )
        
            FFz = @(z) funFz(z)-Fg;
            
            % Arbeitspunkt
            res.z0 = fzero(FFz,[res.zmax/1e9,res.zmax]);
            % Steifigkeit im Arbeitspunkt
            res.s0 = sz(res.z0);
            
        end %if
    elseif strcmp(Multi,'vstack')
        % Alternierende Stapelung vertikal
        % Verschiebung mit maximaler Kraft finden
        
        % Luftspalt ausrechnen
        if ( R2i(1) > R1a(1) )
            g = R2i(1)-R1a(1);
        else
            g = R1i(1)-R2a(1);
        end %if
        
        sz = @(z) calcSzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2+z,h2,K2);
        
        res.zmax = fsolve(sz,-0.6*g);
                
        % maximale Kraft berechnen
        res.Fmax = calcFzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2+res.zmax,h2,K2);
        
        if(res.Fmax >  Fg )
            FFz = @(z) calcFzM(R1i,R1a,z1,h1,K1,R2i,R2a,z2+z,h2,K2)-Fg;
            res.z0 = fzero(FFz,[res.zmax/1e9,res.zmax]);
            res.s0 = sz(res.z0);
        end %if
    else
        error([Multi ' ist keine bekannte Art von Multiringlagern']);
    end %if
    
    % Kontrollplot erstellen
    % Charakteristische Punkte plotten
    
    cchars = calcCharsM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,130);

else
    error('Der Multi-Parameter muss ein String sein');
end %if

figure(2)
clf;

% Kraftverlauf
subplot(2,1,1);
plot(cchars.z,cchars.Fz,'b-');
hold('on');
plot(res.z0,Fg,'ro');
hold('off');
 
% Steifigkeitsverlauf
subplot(2,1,2);
plot(cchars.z,cchars.sz);
hold('on');
plot(res.z0,res.s0,'ro');
hold('off');

res.V = calcVolume(R1i,R1a,h1,R2i,R2a,h2);

end %function
