% Load the .mat files
loadedAVGHarDat2 = load('AVGHarDat2.mat');

% Assuming timeStr2 is an array of strings representing time
timeObjects = datetime(timeStr2, 'Format', 'HH:mm:ss');
timeNumbers = datenum(timeObjects); % Convert datetime objects to serial date numbers

Frequency1 = (3:2:50) .* 50;

% Use timeNumbers instead of timeObjects for meshgrid
[TimeGrid, HarmonicGrid] = meshgrid(timeNumbers, Frequency1);
Amplitude1 = {};

for M = 1:4:96
    Amplitude1 = [Amplitude1 table2array(loadedAVGHarDat2.AVGHarmonicData2(:,M))];
end

AmplitudeMatrix = cell2mat(Amplitude1);

AmplitudeL2 = {};

for M = 2:4:96
    AmplitudeL2 = [AmplitudeL2 table2array(loadedAVGHarDat2.AVGHarmonicData2(:,M))];
end

AmplitudeMatrixL2 = cell2mat(AmplitudeL2);

AmplitudeL3 = {};

for M = 3:4:96
    AmplitudeL3 = [AmplitudeL3 table2array(loadedAVGHarDat2.AVGHarmonicData2(:,M))];
end

AmplitudeMatrixL3 = cell2mat(AmplitudeL3);

% Convert TimeGrid and HarmonicGrid back to X and Y for plotting
X = TimeGrid;
Y = HarmonicGrid;

F = scatteredInterpolant(X(:), Y(:), AmplitudeMatrix(:));
Z = F(X, Y);

XL2 = TimeGrid;
YL2 = HarmonicGrid;
FL2 = scatteredInterpolant(XL2(:), YL2(:), AmplitudeMatrixL2(:));
ZL2 = F(XL2, YL2);

XL3= TimeGrid;
YL3= HarmonicGrid;
FL3 = scatteredInterpolant(XL3(:), YL3(:), AmplitudeMatrixL3(:));
ZL3 = F(XL3, YL3);

% Plotting the figure
figure;
subplot(3,1,1)
% Convert X and Y back to datetime for plotting
X_datetime = datetime(X, 'ConvertFrom', 'datenum');
Y_datetime = datetime(Y, 'ConvertFrom', 'datenum');

surf( X_datetime, Y, Z, 'EdgeColor', 'none');
xlabel('Time');
ylabel('Frequency(Hz)');
zlabel('Amplitude(%)');
title('3D Representation of Amplitude across Harmonics Line 1(A-phase)');
colorbar;
shading interp;


subplot(3,1,2)
% Convert X and Y back to datetime for plotting
X_datetime = datetime(XL2, 'ConvertFrom', 'datenum');
Y_datetime = datetime(YL2, 'ConvertFrom', 'datenum');

surf( X_datetime, YL2, ZL2, 'EdgeColor', 'none');
xlabel('Time');
ylabel('Frequency(Hz)');
zlabel('Amplitude(%)');
title('3D Representation of Amplitude across Harmonics Line 2(B-phase)');
colorbar;
shading interp;


subplot(3,1,3)
X_datetime = datetime(XL3, 'ConvertFrom', 'datenum');
Y_datetime = datetime(YL3, 'ConvertFrom', 'datenum');

surf( X_datetime, YL3, ZL3, 'EdgeColor', 'none');
xlabel('Time');
ylabel('Frequency(Hz)');
zlabel('Amplitude(%)');
title('3D Representation of Amplitude across Harmonics Line 3(C-phase)');
colorbar;
shading interp;


