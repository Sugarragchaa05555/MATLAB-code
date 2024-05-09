HarL1= load('sumHar1L1.mat');
HarL2= load('sumHar1L2.mat');
HarL3= load('sumHar1L3.mat');

THD1=HarL1.sumHar1L1;
THD2=HarL2.sumHar1L2;
THD3=HarL3.sumHar1L3;


THD1STR = cellfun(@num2str, THD1, 'UniformOutput', false);
THD2STR = cellfun(@num2str, THD2, 'UniformOutput', false);
THD3STR = cellfun(@num2str, THD3, 'UniformOutput', false);

% Load current data from MAT files
Current1 = load('CurrentData1STR.mat');

% Extract L1 current data
Current1L1 = Current1.CurrentData1STR(:, 1);
Current1L2 = Current1.CurrentData1STR(:, 2);
Current1L3 = Current1.CurrentData1STR(:, 3);



% Create CorDAT matrix by concatenating THD1 and Current1L1
Cor1DAT = str2double([Current1L1 ,THD1]);
Cor2DAT = str2double([Current1L2 ,THD2]);
Cor3DAT = str2double([Current1L3 ,THD3]);


corrMatrix1L1 = corr(Cor1DAT, 'Rows', 'complete');
corrMatrix2L1 = corr(Cor2DAT, 'Rows', 'complete');
corrMatrix3L1 = corr(Cor3DAT, 'Rows', 'complete');


figure;

subplot(2, 2, 1)
scatter(Cor1DAT(:,1), Cor1DAT(:,2));
xlabel('Load Current');
ylabel('THD current');
title('Scatter Plot at MEAS41');

subplot(2, 2, 2)
scatter(Cor2DAT(:,1), Cor2DAT(:,2));
xlabel('Load Current');
ylabel('THD current');
title('Scatter Plot at MEAS428SH');

subplot(2, 2, 3)
scatter(Cor3DAT(:,1), Cor3DAT(:,2));
xlabel('Load Current');
ylabel('THD current');
title('Scatter Plot at 35H10N0H');

% Titles for each subplot
titles = {'Line 1', 'Line2', 'Line 3'};

% List of all correlation matrices
correlationMatrices = {corrMatrix1L1, corrMatrix2L1, corrMatrix3L1};

% Loop through each correlation matrix and plot it
for i = 1:3
    subplot(2, 2, i); % Arrange in 2x2 grid
    heatmap(correlationMatrices{i}, 'CellLabelColor','none');
    title(titles{i});
    colormap('cool'); % You can choose any colormap that fits your visual needs
end

% Adjust subplot spacing
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0, 1, 1]); % Maximize figure window to see better
sgtitle('Correlation Matrices Comparison of Load Current and THD of current'); % Overall figure title



%Futher analyzes 
n1=512; 
n2=512; 
n3=512;

corrValue1 = corr(Cor1DAT(:,1), Cor1DAT(:,2));

Tstat1 = (corrValue1 * sqrt(n1 - 2)) / sqrt(1 - corrValue1^2);
p1 = 2 * tcdf(-abs(Tstat1), n1 - 2); 
disp(['p-value = ', num2str(p1)])


mdl1 = fitlm(Cor1DAT(:,1), Cor1DAT(:,2));
figure;
plotResiduals(mdl1, 'fitted');
title('Residuals vs. Fitted Values at MEAS 41');


corrValue2 = corr(Cor2DAT(:,1), Cor2DAT(:,2));

Tstat2 = (corrValue2 * sqrt(n2 - 2)) / sqrt(1 - corrValue2^2);
p2 = 2 * tcdf(-abs(Tstat2), n2 - 2); 
disp(['p-value = ', num2str(p2)])


mdl2 = fitlm(Cor2DAT(:,1), Cor2DAT(:,2));
figure;
plotResiduals(mdl2, 'fitted');
title('Residuals vs. Fitted Values at MEAS 28SH');


corrValue3 = corr(Cor3DAT(:,1), Cor3DAT(:,2));

Tstat3 = (corrValue3 * sqrt(n3 - 2)) / sqrt(1 - corrValue3^2);
p3 = 2 * tcdf(-abs(Tstat3), n3 - 2); 
disp(['p-value = ', num2str(p3)])


mdl3 = fitlm(Cor3DAT(:,1), Cor3DAT(:,2));
figure;
plotResiduals(mdl3, 'fitted');
title('Residuals vs. Fitted Values at MEAS 35H10N0H');
