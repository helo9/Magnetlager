function Lager = genHalbachPar(LagerEinfach,num)
% Funktion zur Generierung von  Halbach-Anordnung

dimension = ones(num,1);

Lager = LagerEinfach;

Lager.R1i = dimension*LagerEinfach.R1i;
Lager.R1a = dimension*LagerEinfach.R1a;
Lager.z1 = dimension*LagerEinfach.z1;
Lager.h1 = dimension*LagerEinfach.h1;
Lager.Br1 = dimension*LagerEinfach.Br1;
Lager.R2i = dimension*LagerEinfach.R2i;
Lager.R2a = dimension*LagerEinfach.R2a;
Lager.z2 = dimension*LagerEinfach.z2;
Lager.h2 = dimension*LagerEinfach.h2;
Lager.Br2 = dimension*LagerEinfach.Br2;

for count = 1:num-1
   Lager.z1(count+1) = LagerEinfach.z1 + 2*count*LagerEinfach.h1;
   Lager.z2(count+1) = LagerEinfach.z2 + 2*count*LagerEinfach.h2;
   Lager.Br1(count+1) = Lager.Br1(count)*1i; % Multiplikation mit i entspricht Drehung um 90 im Uhrzeigersinn
   Lager.Br2(count+1) = Lager.Br2(count)*(-1i); % mit -i um -90
end %for

Lager.Multi = 'halbach';

%real axiale magn, / imag radiale magn



