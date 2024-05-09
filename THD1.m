DataHar1 = load('AVGHarDat1.mat');
DataHar2 = load('AVGHarDat2.mat');
DataHar3 = load('AVGHarDat3.mat');
DataHar4 = load('AVGHarDat4.mat');

%------------Case 1 separation of the 3 phase------------------------------
DataHar1L1=[];
DataHar1L2=[];
DataHar1L3=[];

for i = 4:3:75
        DataHar1L1 = [DataHar1L1, DataHar1.HarmonicData1(:, i)];
end

for y=2:3:75
 DataHar1L2 = [DataHar1L2, DataHar1.HarmonicData1(:, y)];
end

for r=3:3:75
 DataHar1L3 = [DataHar1L3, DataHar1.HarmonicData1(:, r)];
end 
ActualHar1L1=DataHar1L1./100;
ActualHar1L2=DataHar1L2./100;
ActualHar1L3=DataHar1L3./100;
%--------------------------------------------------------------------------



%------------Case 2 separation of the 3 phase------------------------------
DataHar2L1=[];
DataHar2L2=[];
DataHar2L3=[];
DataHar2LN=[];

for q = 1:4:96
        DataHar2L1 = [DataHar2L1, DataHar2.AVGHarmonicData2(:, q)];
end

for w=2:4:96
 DataHar2L2 = [DataHar2L2, DataHar2.AVGHarmonicData2(:, w)];
end

for e=3:4:96
 DataHar2L3 = [DataHar2L3, DataHar2.AVGHarmonicData2(:, e)];
end 

for m=4:4:96
 DataHar2LN = [DataHar2LN, DataHar2.AVGHarmonicData2(:, m)];
end
ActualHar2L1=DataHar2L1./100;
ActualHar2L2=DataHar2L2./100;
ActualHar2L3=DataHar2L3./100;
ActualHar2LN=DataHar2LN./100;
%--------------------------------------------------------------------------

%------------Case 3 separation of the 3 phase------------------------------
DataHar3L1=[];
DataHar3L2=[];
DataHar3L3=[];

for z = 1:3:72
        DataHar3L1 = [DataHar3L1, DataHar3.AVGHarmonicData3(:, z)];
end

for x=2:3:72
 DataHar3L2 = [DataHar3L2, DataHar3.AVGHarmonicData3(:, x)];
end

for c=3:3:72
 DataHar3L3 = [DataHar3L3, DataHar3.AVGHarmonicData3(:, c)];
end 
ActualHar3L1=DataHar3L1./100;
ActualHar3L2=DataHar3L2./100;
ActualHar3L3=DataHar3L3./100;
%--------------------------------------------------------------------------

%------------Case 4 separation of the 3 phase------------------------------
DataHar4L1=[];
DataHar4L2=[];
DataHar4L3=[];

for v = 1:3:72
        DataHar4L1 = [DataHar4L1, DataHar4.AVGHarmonicData4(:, v)];
end

for b=2:3:72
 DataHar4L2 = [DataHar4L2, DataHar4.AVGHarmonicData4(:, b)];
end

for n=3:3:72
 DataHar4L3 = [DataHar4L3, DataHar4.AVGHarmonicData4(:, n)];
end 
ActualHar4L1=DataHar4L1./100;
ActualHar4L2=DataHar4L2./100;
ActualHar4L3=DataHar4L3./100;
%--------------------------------------------------------------------------

sumHar1L1={};
sumHar1L2={};
sumHar1L3={};
for qw=1:512
sumHar1L1 = [sumHar1L1; sqrt(sum(ActualHar1L1{qw,:}.^2))];
sumHar1L2 = [sumHar1L2; sqrt(sum(ActualHar1L2{qw,:}.^2))];
sumHar1L3 = [sumHar1L3; sqrt(sum(ActualHar1L3{qw,:}.^2))];
end

sumHar2L1={};
sumHar2L2={};
sumHar2L3={};
sumHar2LN={};
for qe=1:1059
sumHar2L1 = [sumHar2L1; sqrt(sum(ActualHar2L1{qe,:}.^2))];
sumHar2L2 = [sumHar2L2; sqrt(sum(ActualHar2L2{qe,:}.^2))];
sumHar2L3 = [sumHar2L3; sqrt(sum(ActualHar2L3{qe,:}.^2))];
sumHar2LN = [sumHar2LN; sqrt(sum(ActualHar2LN{qe,:}.^2))];
end

sumHar3L1={};
sumHar3L2={};
sumHar3L3={};
for qr=1:398
sumHar3L1 = [sumHar3L1; sqrt(sum(ActualHar3L1{qr,:}.^2))];
sumHar3L2 = [sumHar3L2; sqrt(sum(ActualHar3L2{qr,:}.^2))];
sumHar3L3 = [sumHar3L3; sqrt(sum(ActualHar3L3{qr,:}.^2))];
end

sumHar4L1={};
sumHar4L2={};
sumHar4L3={};
for qt=1:565
sumHar4L1 = [sumHar4L1; sqrt(sum(ActualHar4L1{qt,:}.^2))];
sumHar4L2 = [sumHar4L2; sqrt(sum(ActualHar4L2{qt,:}.^2))];
sumHar4L3 = [sumHar4L3; sqrt(sum(ActualHar4L3{qt,:}.^2))];
end








