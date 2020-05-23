%Program demonstrates reflectivity response to a multilayer dielectric structure.
na = 1;                                     % Air  
nH = 2.4;                                   % High n -> (Titanium Dioxide(TiO2))  
nL = 1.46;                                  % Low n -> (Silicon Dioxide(SiO2))
nb = 1.52;                                  % Glass
LH = 0.25; LL = 0.25;                       % Thickness in respect to Lambda0 (0.25 * Lambda0)
la0 = 500;                                  % Lambda0 in nm
N = 8;                                      % Number of repeating layers
n = [na, nH, repmat([nL,nH], 1, N), nb];    % Indices for the layers Air|H((LH)^N)|Glass
L = [LH, repmat([LL,LH], 1, N)];            % Lengths of the layers H((LH)^N)
la = linspace(300,2000,501);                % Plotting range is [300,2000]nm (Wavelength)
[gamma,z] = repeatedDielectric(n,L,la/la0); % Calls function to calculate gamma and impedance
Gla = 100*abs(gamma).^2;                    % Reflectance as a function of lambda

tiledlayout(2,1)

ax1 = nexttile;
plot(ax1,la,Gla)
title(ax1,'Reflectivity Response')
ylabel(ax1,'Reflectivity (|Gamma|^2) [%]')

ax2= nexttile;
plot(ax2,la,z);
title(ax2,'Impedance as a function of Gamma')
ylabel(ax2,'Impedance (Z [Eta])')
xlabel(ax2,'Wavelength (Lamba [nm])')
