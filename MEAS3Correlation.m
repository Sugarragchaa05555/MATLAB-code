DataHar3 = load('AVGHarDat3.mat');

DataHar1L1 = [];
DataHar1L2 = [];
DataHar1L3 = [];

for i = 4:3:72
        DataHar1L1 = [DataHar1L1, DataHar3.AVGHarmonicData3(:, i)];
end

for y=2:3:72
 DataHar1L2 = [DataHar1L2, DataHar3.AVGHarmonicData3(:, y)];
end

for r=3:3:72
 DataHar1L3 = [DataHar1L3, DataHar3.AVGHarmonicData3(:, r)];
end 


DataCurrentL1 =CurrentData3STR(:, 1);
DataCurrentL2 = CurrentData3STR(:, 2);
DataCurrentL3 = CurrentData3STR(:, 3);


DataCurrentL1Table=array2table(str2double(DataCurrentL1),'VariableNames', {'Average Current'}); 
DataCurrentL2Table=array2table(str2double(DataCurrentL2),'VariableNames', {'Average Current'}); 
DataCurrentL3Table=array2table(str2double(DataCurrentL3),'VariableNames', {'Average Current'}); 


selectedDataL1 = [DataCurrentL1Table, DataHar1L1];
selectedDataL2 = [DataCurrentL2Table, DataHar1L2];
selectedDataL3 = [DataCurrentL3Table, DataHar1L3];

corrMatrixL1 = corr(table2array(DataHar1L1), 'coloumns', 'complete');
corrMatrixL2 = corr(table2array(DataHar1L1), 'coloumns', 'complete');
corrMatrixL3 = corr(table2array(DataHar1L1), 'coloumns', 'complete');

figure;
subplot(3, 1, 1);
imagesc(corrMatrixL1);
colorbar;
title('Correlation Matrix L1');

subplot(3, 1, 2);
imagesc(corrMatrixL2);
colorbar;
title('Correlation Matrix L2');

subplot(3, 1, 3);
imagesc(corrMatrixL3);
colorbar;
title('Correlation Matrix L3');