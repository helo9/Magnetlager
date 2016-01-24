function Phi = calcPhiM(R1i,R1a,z1,h1,K1,r,z)
% Phi = calcPhiM(R1i,R1a,z1,h1,K1,r,z)
% Berechnet das Skalarpotential eines Multi-Ring-Lagers

global twodim;

if ~twodim
    error('Keine Skalarpotentialberechnung bei zweidimensionaler Rechnung');
    return
end %if

dim = size(r);

Phi = zeros(dim);


for ii = 1:length(R1i)
    for jj = 1:dim(1)
        for kk = 1:dim(2)
                
            Phi(jj,kk) = Phi(jj,kk) + calcPhi2(R1i(ii),R1a(ii),z1(ii),h1(ii),K1(ii),r(jj,kk),z(jj,kk));
                
        end %for
    end %for
end %for

end %function
