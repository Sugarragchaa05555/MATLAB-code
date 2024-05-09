DataHar4 = load('AVGHarDat4.mat');

DataHar1L1 = [];
DataHar1L2 = [];
DataHar1L3 = [];

for i = 4:3:72
        DataHar1L1 = [DataHar1L1, DataHar4.AVGHarmonicData4(:, i)];
end

for y=2:3:72
 DataHar1L2 = [DataHar1L2, DataHar4.AVGHarmonicData4(:, y)];
end

for r=3:3:72
 DataHar1L3 = [DataHar1L3, DataHar4.AVGHarmonicData4(:, r)];
end 


DataCurrentL1 =CurrentData4STR(:, 1);
DataCurrentL2 = CurrentData4STR(:, 2);
DataCurrentL3 = CurrentData4STR(:, 3);


DataCurrentL1Table=array2table(str2double(DataCurrentL1),'VariableNames', {'Average Current'}); 
DataCurrentL2Table=array2table(str2double(DataCurrentL2),'VariableNames', {'Average Current'}); 
DataCurrentL3Table=array2table(str2double(DataCurrentL3),'VariableNames', {'Average Current'}); 


selectedDataL1 = [DataCurrentL1Table, DataHar1L1];
selectedDataL2 = [DataCurrentL2Table, DataHar1L2];
selectedDataL3 = [DataCurrentL3Table, DataHar1L3];

corrMatrixL1 = corr(table2array(DataHar1L1), 'Rows', 'complete');
corrMatrixL2 = corr(table2array(DataHar1L1), 'Rows', 'complete');
corrMatrixL3 = corr(table2array(DataHar1L1), 'Rows', 'complete');

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