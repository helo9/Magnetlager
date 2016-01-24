function Phi = calcPhi2(R1i,R1a,z1,h1,K1,x,z)
% Phi = calcPhi2(R1i,R1a,z1,h1,K1,x,z)
% Berechnet das Skalarpotential eines Reckteckquerschnittes zweidimensional.

Phi = calcPhi2z(R1i,R1a,z1,h1,real(K1),x,z) + calcPhi2x(R1i,R1a,z1,h1,imag(K1),x,z);

end %function
