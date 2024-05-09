% Load data from MAT files
Har1L1 = load('sumHar1L1.mat');
Har1L2 = load('THDMEAS1.mat');
Har1L3 = load('THDMEAS1.mat');


Har2L2 = load('SumHar2L1.mat');
Har3L3 = load('SumHar3L1.mat');
Har4L4 = load('SumHar4L1.mat');

% Assign variables for THD data
THD1 = Har1L1.sumHar1L1;
THD2 = Har2L2.sumHar2L1;
THD3 = Har3L3.sumHar3L1;
THD4 = Har4L4.sumHar4L1;

THD1STR = cellfun(@num2str, THD1, 'UniformOutput', false);

% Load current data from MAT files
Current1 = load('CurrentData1STR.mat');
Current2 = load('CurrentData2STR.mat');
Current3 = load('CurrentData3STR.mat');
Current4 = load('CurrentData4STR.mat');

% Extract L1 current data
Current1L1 = Current1.CurrentData1STR(:, 1);
Current2L1 = Current2.CurrentData2STR(:, 1);
Current3L1 = Current3.CurrentData3STR(:, 1);
Current4L1 = Current4.CurrentData4STR(:, 1);

% Create CorDAT matrix by concatenating THD1 and Current1L1
Cor1DAT = str2double([Current1L1 ,THD1]);
Cor2DAT = str2double([Current2L1 ,THD2]);
Cor3DAT = str2double([Current3L1 ,THD3]);
Cor4DAT = str2double([Current4L1 ,THD4]);

corrMatrix1L1 = corr(Cor1DAT, 'Rows', 'complete');
corrMatrix2L1 = corr(Cor2DAT, 'Rows', 'complete');
corrMatrix3L1 = corr(Cor3DAT, 'Rows', 'complete');
corrMatrix4L1 = corr(Cor4DAT, 'Rows', 'complete');


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

subplot(2, 2, 4)
scatter(Cor4DAT(:,1), Cor4DAT(:,2));
xlabel('Load Current');
ylabel('THD current');
title('Scatter Plot at 40H11');
figure;

% Titles for each subplot
titles = {'MEAS 41', 'MEAS 28SH', '35H10N0H', 'MEAS 40H11'};

% List of all correlation matrices
correlationMatrices = {corrMatrix1L1, corrMatrix2L1, corrMatrix3L1, corrMatrix4L1};

% Loop through each correlation matrix and plot it
for i = 1:4
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
n2=1059; 
n3=398; 
n4=565; 

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


corrValue4 = corr(Cor4DAT(:,1), Cor4DAT(:,2));

Tstat4 = (corrValue4 * sqrt(n4 - 2)) / sqrt(1 - corrValue4^2);
p4 = 2 * tcdf(-abs(Tstat3), n4 - 2); 
disp(['p-value = ', num2str(p4)])


mdl4 = fitlm(Cor4DAT(:,1), Cor4DAT(:,2));
figure;
plotResiduals(mdl4, 'fitted');
title('Residuals vs. Fitted Values at MEAS 40H11');

% Polynomial regression models
mdl_poly3_1 = fitlm(Cor1DAT(:, 1), Cor1DAT(:, 2), 'poly3');
mdl_poly3_2 = fitlm(Cor2DAT(:, 1), Cor2DAT(:, 2), 'poly3');
mdl_poly3_3 = fitlm(Cor3DAT(:, 1), Cor3DAT(:, 2), 'poly3');
mdl_poly3_4 = fitlm(Cor4DAT(:, 1), Cor4DAT(:, 2), 'poly3');

% Residual plots for polynomial regression
figure;
subplot(2, 2, 1);
plotResiduals(mdl_poly1, 'fitted');
title('Residuals vs. Fitted Values at MEAS 41');

subplot(2, 2, 2);
plotResiduals(mdl_poly2, 'fitted');
title('Residuals vs Fitted Values at MEAS 28SH');

subplot(2, 2, 3);
plotResiduals(mdl_poly3, 'fitted');
title('Residuals vs Fitted Values at MEAS 35H10N0H');

subplot(2, 2, 4);
plotResiduals(mdl_poly4, 'fitted');
title('Residuals vs Fitted Values at MEAS 40H11'); 

sgtitle('Polynomial Regression Residuals vs. Fitted Values');


% Calculate residuals for model 1
residuals1 = mdl1.Residuals.Raw;
squaredResiduals1 = residuals1 .^ 2;

% Auxiliary regression for Breusch-Pagan test
auxModel1 = fitlm(Cor1DAT(:, 1), squaredResiduals1);

% Extract R-squared and compute the Breusch-Pagan test statistic
R2_aux1 = auxModel1.Rsquared.Ordinary;
n1 = height(Cor1DAT);
bp_stat1 = n1 * R2_aux1;
p_bp1 = 1 - chi2cdf(bp_stat1, 1);

disp(['Breusch-Pagan p-value at MEAS 41: ', num2str(p_bp1)]);

% Repeat for other models as needed
% Model 2
residuals2 = mdl2.Residuals.Raw;
squaredResiduals2 = residuals2 .^ 2;
auxModel2 = fitlm(Cor2DAT(:, 1), squaredResiduals2);
R2_aux2 = auxModel2.Rsquared.Ordinary;
n2 = height(Cor2DAT);
bp_stat2 = n2 * R2_aux2;
p_bp2 = 1 - chi2cdf(bp_stat2, 1);
disp(['Breusch-Pagan p-value at MEAS 28SH: ', num2str(p_bp2)]);

% Model 3
residuals3 = mdl3.Residuals.Raw;
squaredResiduals3 = residuals3 .^ 2;
auxModel3 = fitlm(Cor3DAT(:, 1), squaredResiduals3);
R2_aux3 = auxModel3.Rsquared.Ordinary;
n3 = height(Cor3DAT);
bp_stat3 = n3 * R2_aux3;
p_bp3 = 1 - chi2cdf(bp_stat3, 1);
disp(['Breusch-Pagan p-value at MEAS 35H10N0H: ', num2str(p_bp3)]);

% Model 4
residuals4 = mdl4.Residuals.Raw;
squaredResiduals4 = residuals4 .^ 2;
auxModel4 = fitlm(Cor4DAT(:, 1), squaredResiduals4);
R2_aux4 = auxModel4.Rsquared.Ordinary;
n4 = height(Cor4DAT);
bp_stat4 = n4 * R2_aux4;
p_bp4 = 1 - chi2cdf(bp_stat4, 1);
disp(['Breusch-Pagan p-value at MEAS 40H11: ', num2str(p_bp4)]);

cookDist1 = mdl_poly1.Diagnostics.CooksDistance;
influential1 = find(cookDist1 > 4 / length(cookDist1)); 
mdl_robust1 = fitlm(Cor1DAT(:, 1), Cor1DAT(:, 2), 'RobustOpts', 'on');

Cor1DAT(:, 2) = log(Cor1DAT(:, 2) + 1); 
mdl_transformed1 = fitlm(Cor1DAT(:, 1), Cor1DAT(:, 2));


segmentThreshold = 0.15;
lowerRange = Cor3DAT(Cor3DAT(:, 1) <= segmentThreshold, :);
upperRange = Cor3DAT(Cor3DAT(:, 1) > segmentThreshold, :);

mdl_lower = fitlm(lowerRange(:, 1), lowerRange(:, 2));
mdl_upper = fitlm(upperRange(:, 1), upperRange(:, 2));


