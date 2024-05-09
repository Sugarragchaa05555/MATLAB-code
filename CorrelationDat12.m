DataHar1 = load('AVGHarDat1.mat');

DataHar1L1 = [];
DataHar1L2 = [];
DataHar1L3 = [];

for i = 4:3:75
        DataHar1L1 = [DataHar1L1, DataHar1.HarmonicData1(:, i)];
end

for y=2:3:75
 DataHar1L2 = [DataHar1L2, DataHar1.HarmonicData1(:, y)];
end

for r=3:3:75
 DataHar1L3 = [DataHar1L3, DataHar1.HarmonicData1(:, r)];
end 

DataCurrentL1 = [];
DataCurrentL2 = [];
DataCurrentL3 = [];

for j = 1:6  
    if rem(j, 3) == 0
        DataCurrentL3 = [DataCurrentL3, CurrentData1STR(:, j)];
    elseif rem(j, 2) == 0
        DataCurrentL2 = [DataCurrentL2, CurrentData1STR(:, j)];
    else
        DataCurrentL1 = [DataCurrentL1, CurrentData1STR(:, j)];
    end
end

DataCurrentL1Table=array2table(str2double(DataCurrentL1),'VariableNames', {'Average Current', 'Peak Current'}); 
DataCurrentL2Table=array2table(str2double(DataCurrentL2),'VariableNames', {'Average Current', 'Peak Current'}); 
DataCurrentL3Table=array2table(str2double(DataCurrentL3),'VariableNames', {'Average Current', 'Peak Current'}); 


selectedDataL1 = [DataCurrentL1Table, DataHar1L1];
selectedDataL2 = [DataCurrentL2Table, DataHar1L2];
selectedDataL3 = [DataCurrentL3Table, DataHar1L3];

corrMatrixL1 = corr(table2array(DataHar1L1), 'Rows', 'complete');
corrMatrixL2 = corr(table2array(DataHar1L1), 'Rows', 'complete');
corrMatrixL3 = corr(table2array(DataHar1L1), 'Rows', 'complete');

sumofROW=sum(selectedDataL1,2);
sumofCUAVG=sumofROW.sum-selectedDataL1.("Average Current")-selectedDataL1.("Peak Current");

ActualVALTHDL1=[];
for lkj=1:512
    ActualVALTHDL1=[ActualVALTHDL1 ;(selectedDataL1.("Average Current")(lkj)/100)*(HarL1MEAS1(lkj,1))];
end

figure;

subplot(3,1,1)
title('THD and Load current');
plot(1:1:512, sumofCUAVG)
subplot(3,1,2)
plot(1:1:512, selectedDataL1.("Average Current"))

