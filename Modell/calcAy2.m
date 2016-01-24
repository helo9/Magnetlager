function Ay = calcAy2(x11,x12,z1,h1,K1,x,z)
% Ay = calcAy2(x11,x12,z1,h1,K1,x,z)
% Berechnet das Vektorpotential eines Rechteckquerschnittes normal
% zu betrachteten Ebene an der Position (x,z) zweidimensional.


Ay = calcAy2a(x11,x12,z1,h1,real(K1),x,z)+calcAy2r(x11,x12,z1,h1,imag(K1),x,z);
                        
end %function
 