
DataHar1=load('AVGHarDat1.mat');
DataHar2=load('AVGHarDat2.mat');

DataHar1L1={};
DataHar1L2={};
DataHar1L3={};

for i=1:75
 if rem(i,3)==0
    DataHar1L3 = [DataHar1L3 table2array(DataHar1.HarmonicData1(:,i))];
 elseif rem(i,2)==0
    DataHar1L2 = [DataHar1L2 table2array(DataHar1.HarmonicData1(:,i))];
 else
    DataHar1L1 = [DataHar1L1 table2array(DataHar1.HarmonicData1(:,i))];
 end 
end 


DataHar2L1={};
DataHar2L2={};
DataHar2L3={};

for iu=1:76
 if rem(iu,3)==0
    DataHar2L3 = [DataHar2L3 table2array(DataHar2.AVGHarmonicData2(:,iu))];
 elseif rem(iu,2)==0
    DataHar2L2 = [DataHar2L2 table2array(DataHar2.AVGHarmonicData2(:,iu))];
 else
    DataHar2L1 = [DataHar2L1 table2array(DataHar2.AVGHarmonicData2(:,iu))];
 end 
end 

DataCurrentL1={};
DataCurrentL2={};
DataCurrentL3={};

for j=1:6
 if rem(j,3)==0
    DataCurrentL3 = [DataCurrentL3 CurrentData1STR(:,j)];
 elseif rem(j,2)==0
    DataCurrentL2= [DataCurrentL2 CurrentData1STR(:,j)];
 else
    DataCurrentL1 = [DataCurrentL1 CurrentData1STR(:,j)];
 end 
end 

DataCurrent2L1={};
DataCurrent2L2={};
DataCurrent2L3={};
for a=1:3
 if rem(a,3)==0
    DataCurrent2L3 = [DataCurrent2L3 CurrentData2STR(:,a)];
 elseif rem(a,2)==0
    DataCurrent2L2= [DataCurrent2L2 CurrentData2STR(:,a)];
 else
    DataCurrent2L1 = [DataCurrent2L1 CurrentData2STR(:,a)];
 end 
end 



selectedDataL1={DataCurrentL1 DataHar1L1};
selectedDataL2={DataCurrentL2 DataHar1L2};
selectedDataL3={DataCurrentL3 DataHar1L3};

CorrMATRIX1=[];
CorrMATRIX2=[];
CorrMATRIX3=[];

for h=2:25
CorrMATRIX1=[CorrMATRIX1 corr(str2double(DataCurrentL1(:,1)),(DataHar1L1{1,h}))];
CorrMATRIX2=[CorrMATRIX2 corr(str2double(DataCurrentL2(:,1)),(DataHar1L2{1,h}))];
CorrMATRIX3=[CorrMATRIX3 corr(str2double(DataCurrentL3(:,1)),(DataHar1L3{1,h}))];
end 

selectedData2L1={DataCurrent2L1 DataHar2L1};
selectedData2L2={DataCurrent2L2 DataHar2L2};
selectedData2L3={DataCurrent2L3 DataHar2L3};

CorrMATRIX12=[];
CorrMATRIX22=[];
CorrMATRIX32=[];

for hi=2:25
CorrMATRIX12=[CorrMATRIX12 corr(str2double(DataCurrent2L1(:,1)),(DataHar2L1{1,hi}))];
CorrMATRIX22=[CorrMATRIX22 corr(str2double(DataCurrent2L2(:,1)),(DataHar2L2{1,hi}))];
CorrMATRIX32=[CorrMATRIX32 corr(str2double(DataCurrent2L3(:,1)),(DataHar2L3{1,hi}))];
end 
CorrMATRIXnet1=[CorrMATRIX1;CorrMATRIX2;CorrMATRIX3];
CorrMATRIXnet2=[CorrMATRIX12;CorrMATRIX22;CorrMATRIX32];
figure; 

plot(3:2:49,CorrMATRIXnet1)
title('Correlation Between Load Current and Harmonic orders MEAS 41')
xlabel('harmonic Order')
ylabel('Correlation quantity')
legend('Line 1(Phase A)', 'Line 2(Phase B)', 'Line 3(Phase c)');
yLimits = ylim;

% Increase the range by a factor of 2 (or any other factor)
factor = 10;
newYLimits = [yLimits(1) - (yLimits(2) - yLimits(1))/factor, yLimits(2) + (yLimits(2) - yLimits(1))/factor];

% Apply new limits
ylim(newYLimits);

figure;

plot(3:2:49,CorrMATRIXnet2)
title('Correlation Between Load Current and Harmonic orders MEAS 28SH')
xlabel('harmonic Order')
ylabel('Correlation quantity')
legend('Line 1(Phase A)', 'Line 2(Phase B)', 'Line 3(Phase c)');
yLimits = ylim;

% Increase the range by a factor of 2 (or any other factor)
factor = 3;
newYLimits = [yLimits(1) - (yLimits(2) - yLimits(1))/factor, yLimits(2) + (yLimits(2) - yLimits(1))/factor];

% Apply new limits
ylim(newYLimits);