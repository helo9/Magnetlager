function Br = calcBrM(R1i,R1a,z1,h1,K1,r,z)
% Br = calcBrM(R1i,R1a,z1,h1,K1,r,z)
% Berechnet die Flussdichte eines Multi-Ring-Lagers am Punkt (r,z) in radialer Richtung.

dim = size(r);

Br = zeros(size(r));

for ii = 1:length(R1i)
    for jj = 1:dim(1)
        for kk = 1:dim(2)
            Br(jj,kk) = Br(jj,kk) + calcBr(R1i(ii),R1a(ii),z1(ii),h1(ii),K1(ii),r(jj,kk),z(jj,kk));
        end %for
    end %for  
end %for

end %function

