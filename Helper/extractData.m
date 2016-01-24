function [R1i,R1a,z1,h1,K1,R2i,R2a,z2,h2,K2,Multi,Fg] = extractData( data )

    if( ischar(data) )
        try
            datastruct = eval(data);
        catch
            error(['Fehler beim ausführen von ',data]);
        end %try
        data = datastruct;
    end %if

    R1i = data.R1i;
    R1a = data.R1a;
    z1  = data.z1;
    h1  = data.h1;
    K1  = calcKfromBr(data.Br1);
    R2i = data.R2i;
    R2a = data.R2a;
    z2  = data.z2;
    h2  = data.h2;
    K2  = calcKfromBr(data.Br2);
    
    if (isfield(data,'Multi'))
        Multi = data.Multi;
    else 
        Multi = 0;
    end %if
    
    if (isfield(data,'Fg'))
        Fg = data.Fg;
    else
        Fg = -1;
    end %if

    
end %function