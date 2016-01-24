function Phi = calcPhi2z(x11,x12,z1,h1,K1,x,z)
% Phi = calcPhi2z(x11,x12,z1,h1,K1,x,z)
% Berechnet das Skalarpotential eines Rechteckquerschnittes mit Magnetisierung in z-Richtung an
% der Position (x,z)

per0 = 4*pi*10^-7;

rx1 = x - x11;
rx2 = x - x12;
rzo = z-(z1+h1);
rzu = z-(z1-h1);

if (rx1 == 0 )
    rx1 = realmin;
end %if
if (rx2 == 0 )
    rx2 = realmin;
end %if
if (rzo == 0 )
    rzo = realmin;
end %if
if (rzu == 0)
    rzu = realmin;
end
 
  Phi_B = - K1 / ( 2*pi) .* ( rzo.*atan(rzo./rx2)-rzu.*atan(rzu./rx2)-rx2/2.*log(rx2.^2+rzo.^2)+rx2/2.*log(rx2.^2+rzu.^2) ...
                           -rzo.*atan(rzo./rx1)+rzu.*atan(rzu./rx1)+rx1/2.*log(rx1.^2+rzo.^2)-rx1/2.*log(rx1.^2+rzu.^2));

  if (x<x11 || x>x12)
     Phi_M = 0;
  elseif(rzo > 0)
     Phi_M = K1.*h1;
  elseif(rzo <= 0 && rzu >= 0)
     Phi_M = K1 .* (z-z1);
  elseif(rzu<0)
     Phi_M = -K1.*h1;
  end %if
  
Phi = Phi_M+Phi_B;

end %function
