maindata = readtable('Harmonic data Thesis.xlsx');
sheets = sheetnames('Harmonic data Thesis.xlsx');



% Preallocate a cell array to hold data from each sheet
data = cell(length(sheets), 1);

% Loop through each sheet and read the data
for i = 1:length(sheets)
    data{i} = readtable('Harmonic data Thesis.xlsx', 'Sheet', sheets{i});
end

Data1=data{1,1};
Data2=data{2,1};
Data3=data{3,1};
Data4=data{4,1};

clear data;
CurrentData1=[];
HarmonicData1=[];

for j=2:84

    if j<=8
    CurrentData1=[CurrentData1 Data1(:,j)];
    elseif j>8 
    HarmonicData1=[HarmonicData1 Data1(:,j)];
    end
end 


CurrentData2=[];
HarmonicData2=[];

for h=2:327
    if h<=26
    CurrentData2=[CurrentData2 Data2(:,h)];
    elseif h>26
    HarmonicData2=[HarmonicData2 Data2(:,h)];
    end
end 


CurrentData3=[];
HarmonicData3=[];

for g=2:246
    if g<=20
    CurrentData3=[CurrentData3 Data3(:,g)];
    elseif g>20
    HarmonicData3=[HarmonicData3 Data3(:,g)];
    end
end 

CurrentData4=[];
HarmonicData4=[];

for f=2:246
    if f<=20
    CurrentData4=[CurrentData4 Data4(:,f)];
    elseif f>20
    HarmonicData4=[HarmonicData4 Data4(:,f)];
    end
end 

MINHarmonicData2=[];
AVGHarmonicData2=[];
MAXHarmonicData2=[];
for q=13:301
   if rem(q,3)==1
      MINHarmonicData2=[MINHarmonicData2 HarmonicData2(:,q)]; 
   elseif rem(q,3)==0
      MAXHarmonicData2=[MAXHarmonicData2 HarmonicData2(:,q)]; 
   else 
      AVGHarmonicData2=[AVGHarmonicData2 HarmonicData2(:,q)]; 
   end
end

MINHarmonicData3=[];
AVGHarmonicData3=[];
MAXHarmonicData3=[];
for w=10:226
   if rem(w,3)==1
      MINHarmonicData3=[MINHarmonicData3 HarmonicData3(:,w)]; 
   elseif rem(w,3)==0
      MAXHarmonicData3=[MAXHarmonicData3 HarmonicData3(:,w)]; 
   else 
      AVGHarmonicData3=[AVGHarmonicData3 HarmonicData3(:,w)]; 
   end
end


MINHarmonicData4=[];
AVGHarmonicData4=[];
MAXHarmonicData4=[];
for e=10:226
   if rem(e,3)==1
      MINHarmonicData4=[MINHarmonicData4 HarmonicData4(:,e)]; 
   elseif rem(e,3)==0
      MAXHarmonicData4=[MAXHarmonicData4 HarmonicData4(:,e)]; 
   else 
      AVGHarmonicData4=[AVGHarmonicData4 HarmonicData4(:,e)]; 
   end
end

clear Data1;
clear Data2;
clear Data3;
clear Data4;

Data1 = fullfile('D:\Documents\Matlab\Project', 'Data1.mat');
save(Data1, 'Data1'); % 'T' is your table variable

Data2 = fullfile('D:\Documents\Matlab\Project', 'Data2.mat');
save(Data2, 'Data2'); % 'T' is your table variable

Data3 = fullfile('D:\Documents\Matlab\Project', 'Data3.mat');
save(Data3, 'Data3'); % 'T' is your table variable

Data4 = fullfile('D:\Documents\Matlab\Project', 'Data4.mat');
save(Data4, 'Data4'); % 'T' is your table variable


%upload the min data to global 
MinHarDat2 = fullfile('D:\Documents\Matlab\Project', 'MinHarDat2');
save(MinHarDat2, 'MINHarmonicData2'); % 'T' is your table variable


MinHarDat3 = fullfile('D:\Documents\Matlab\Project', 'MinHarDat3');
save(MinHarDat3, 'MINHarmonicData3'); % 'T' is your table variable

MinHarDat4 = fullfile('D:\Documents\Matlab\Project', 'MinHarDat4');
save(MinHarDat4, 'MINHarmonicData4'); % 'T' is your table variable


%upload the average data to global 
AVGHarDat2 = fullfile('D:\Documents\Matlab\Project', 'AVGHarDat2');
save(AVGHarDat2, 'AVGHarmonicData2'); % 'T' is your table variable


AVGHarDat3 = fullfile('D:\Documents\Matlab\Project', 'AVGHarDat3');
save(AVGHarDat3, 'AVGHarmonicData3'); % 'T' is your table variable

AVGHarDat1 = fullfile('D:\Documents\Matlab\Project', 'AVGHarDat1');
save(AVGHarDat1, 'HarmonicData1'); % 'T' is your table variable

%upload the average data to global 
MAXHarDat2 = fullfile('D:\Documents\Matlab\Project', 'MAXHarDat2');
save(MAXHarDat2, 'MAXHarmonicData2'); % 'T' is your table variable


MAXHarDat3 = fullfile('D:\Documents\Matlab\Project', 'MAXHarDat3');
save(MAXHarDat3, 'MAXHarmonicData3'); % 'T' is your table variable

MAXHarDat4 = fullfile('D:\Documents\Matlab\Project', 'MAXHarDat4');
save(MAXHarDat4, 'MAXHarmonicData4'); % 'T' is your table variable


%upload the average data to global 
CurrentData1 = fullfile('D:\Documents\Matlab\Project', 'CurrentData1');
save(CurrentData1, 'CurrentData1'); % 'T' is your table variable

CurrentData2 = fullfile('D:\Documents\Matlab\Project', 'CurrentData2');
save(CurrentData2, 'CurrentData2'); % 'T' is your table variable

CurrentData3 = fullfile('D:\Documents\Matlab\Project', 'CurrentData3');
save(CurrentData3, 'CurrentData3'); % 'T' is your table variable

CurrentData4 = fullfile('D:\Documents\Matlab\Project', 'CurrentData4');
save(CurrentData4, 'CurrentData4'); % 'T' is your table variable
