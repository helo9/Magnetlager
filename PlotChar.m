function chars = PlotChar( varargin )
% Generiere Kraft und Steifigkeitsverlauf
%  chars = PlotChar(parameterfile) Plottet Verläufe für parameterfile und gibt diese mit chars zurück
%  chars = PlotChar(parameterfile,range) Verschiebungsbereich range wird vorgegeben
%  chars = PlotChar(parameterfile1[,range1],parameterfile2,...) mehrere Kennlinien zusammen

% Rückgabewert initialisieren
chars = struct();

%
figure(1);

for ii = 1:nargin

        clear Multi;
        
        try
            if(isnumeric(varargin{ii}))
                continue
            else if(ii<nargin && isvector(varargin{ii+1}))
                range = varargin{ii+1};
            else 
                range = 0;
            end % if
            
            [R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,Multi,Fg] = extractData( varargin{ii} ); 
            
            if(ischar(Multi)) 
                cchars = calcCharsM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,range);
            else
                cchars = calcChars(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,range);
            end % if
            
            % Verläufe plotten
            subplot(2,1,1);
            plot(cchars.z,cchars.Fz);
            hold all;
            subplot(2,1,2);
            plot(cchars.z,cchars.sz);
            hold all;
            
            chars(ii).z     = cchars.z;
            chars(ii).Fz    = cchars.Fz;
            chars(ii).sz    = cchars.sz;
            
        end %try     
end %for

subplot(2,1,1);
hold off;
subplot(2,1,2);
hold off;

end %function