function [r,z,Br,Bz] = Field(Param,varargin)
% [r,z,Br,Bz] = Field(Lager[,delta_z])
% Plottet Magnetfeld eines Lagers übergeben als Funktionsname
% oder als Struct. Optional kann eine Verschiebung angegeben
% werden.

%% Parameter laden
[R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,Multi] = extractData( Param );

% optionalen Verschiebungsparameter auslesen
if ( length(varargin) == 0 )
    delta_z = 0;
elseif ( length(varargin) == 1 && isnumeric(varargin{1}) )
    delta_z = varargin{1};
else
    warning('Fehlerhafte Parameter')
    delta_z = 0;
end

% zweiten Ring verschieben
z2 = z2 + delta_z;


if( ischar(Multi) )
    % Multiringlager
    plotFieldM(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);
else
    % Einfachringlager
    plotField(R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2);
end %if

end %fuction