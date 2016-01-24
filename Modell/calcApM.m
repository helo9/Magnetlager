function A_phi = calcApM(R1i,R1a,z1,h1,K1,r,z)
% A_phi = calcVecpotM(R1i,R1a,z1,h1,K1,r,z)
% Berechnet das Vektorpotential eines Multiringlagers an Position (r,z)

dim = size(r);

A_phi = zeros(dim);


for ii = 1:length(R1i)
    for jj = 1:dim(1)
        for kk = 1:dim(2)
                
            A_phi(jj,kk) = A_phi(jj,kk) + calcAp(R1i(ii),R1a(ii),z1(ii),h1(ii),K1(ii),r(jj,kk),z(jj,kk));
                
        end %for
    end %for
end %for

end %function
