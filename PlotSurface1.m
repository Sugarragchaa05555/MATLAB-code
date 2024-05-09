% Load the .mat files
loadedAVGHarDat2 = load('AVGHarDat2.mat');

timeObjects = datetime(timeStr2, 'Format', 'HH:mm:ss');

Frequency1 = (3:2:50) .* 50;

[TimeGrid, HarmonicGrid] = meshgrid(timeObjects, Frequency1);
Amplitude1 = {};

for M = 1:4:96
    Amplitude1 = [Amplitude1 table2array(loadedAVGHarDat2.AVGHarmonicData2(:,M))];
end

AmplitudeMatrix = cell2mat(Amplitude1);
[X, Y] = meshgrid(TimeGrid, HarmonicGrid);
F = scatteredInterpolant(X(:), Y(:), AmplitudeMatrix(:));
Z = F(X, Y);

% Plotting the figure
figure;
surf(X, Y, Z, 'EdgeColor', 'none');
xlabel('Time or Condition');
ylabel('Harmonic Order');
zlabel('Amplitude');
title('3D Representation of Amplitude across Harmonics');
colorbar;
shading interp;