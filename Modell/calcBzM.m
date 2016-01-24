function Bz = calcBzM( R1i,R1a,z1,h1,K1,r,z)
% Bz = calcBzM( R1i,R1a,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines Multiringlagers in axialer Richtung an Position (r,z).
% Als Geometrieparameter werden Vektoren erwartet.

dim = size(r);

Bz = zeros(size(r));

for ii = 1:length(R1i)
    for jj = 1:dim(1)
        for kk = 1:dim(2)
            %disp([' Berechnung ',num2str((ii-1)*dim(1)*dim(2)+(jj-1)*dim(2)+kk),'/',num2str(dim(1)*dim(2)*length(R1i))]);
            Bz(jj,kk) = Bz(jj,kk) + calcBz(R1i(ii),R1a(ii),z1(ii),h1(ii),K1(ii),r(jj,kk),z(jj,kk));
        end %for
    end %for  
end %for

end %function

