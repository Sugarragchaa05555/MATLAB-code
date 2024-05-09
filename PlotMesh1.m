LoadedAVGHarmonic2=load('AVGHarDat2.mat'); 
LoadedCurrentData2=load('CurrentData2.mat');


Time1=table2array(CurrentData2(:,1));

Frequency1=(3:2:50).*50;

[TimeGrid, HarmonicGrid] = meshgrid(Time1, Frequency1);
Amplitude1={};

for M=1:4:96
   
    Amplitude1=[Amplitude1 table2array(AVGHarDat2(:,M))];

end

AmplitudeMatrix = cell2mat(Amplitude1);
[X, Y] = meshgrid(TimeGrid, HarmonicGrid);
F = scatteredInterpolant(X(:), Y(:), AmplitudeMatrix(:));
Z = F(X, Y);


figure;
surf(X, Y, Z, 'EdgeColor', 'none');
xlabel('Time or Condition');
ylabel('Harmonic Order');
zlabel('Amplitude');
title('3D Representation of Amplitude across Harmonics');
colorbar;
shading interp;




