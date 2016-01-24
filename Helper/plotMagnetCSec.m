function plotMagnetCSec(Ri,Ra,z,h,fig)
% plotMagnetCSec(Ri,Ra,z,h,fig)
% Plottet einen Magnetquerschnitt (cross section) in die
% Figure mit ID fig.

figure(fig);
hold on;
rectangle('Position', [Ri, z-h, Ra-Ri, 2*h],'linewidth',2);
hold off;

end %function