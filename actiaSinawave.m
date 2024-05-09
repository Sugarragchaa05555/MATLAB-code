HarL1= load('CurrentData1STR.mat');
HarL2= load('CurrentData2STR.mat');

DataHar1=load('AVGHarDat1.mat');
DataHar2=load('AVGHarDat2.mat');

DataHar1L1=[];
DataHar1L2=[];
DataHar1L3=[];

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
    DataCurrentL3 = [DataCurrentL3 HarL1.CurrentData1STR(:,j)];
 elseif rem(j,2)==0
    DataCurrentL2= [DataCurrentL2 HarL1.CurrentData1STR(:,j)];
 else
    DataCurrentL1 = [DataCurrentL1 HarL1.CurrentData1STR(:,j)];
 end 
end 

DataCurrent2L1={};
DataCurrent2L2={};
DataCurrent2L3={};
for a=1:3
 if rem(a,3)==0
    DataCurrent2L3 = [DataCurrent2L3 HarL2.CurrentData2STR(:,a)];
 elseif rem(a,2)==0
    DataCurrent2L2= [DataCurrent2L2 HarL2.CurrentData2STR(:,a)];
 else
    DataCurrent2L1 = [DataCurrent2L1 HarL2.CurrentData2STR(:,a)];
 end 
end 

num_samples1 = length(DataCurrentL1);
num_samples2 = length(DataCurrent2L1);
sampling_interval = 0.25; 
total_duration1 = num_samples1 * sampling_interval;
total_duration2 = num_samples2 * sampling_interval;
fundamental_freq = 50;
time_vector = 0:sampling_interval:(num_samples1-1) * sampling_interval;

start_time = datetime(2024,5,7,16,18,35,145); 
x_time = start_time + seconds(time_vector);

distorted_waveform = zeros(size(time_vector));



distorted_waveform = zeros(size(time_vector));
for k = 1:num_samples1
    current_rms =  str2double(DataCurrentL1(k,1)); % Current RMS value at this sample
    waveform_sample = current_rms * sqrt(2) * sin(2 * pi * fundamental_freq * time_vector); % Fundamental sine
    
    % Apply harmonic distortion
    for harmonic_num = 24:24 % Only odd harmonics
       
        harmonic_numL1=3:2:49;
        harmonic_amplitude = DataHar1L1(k, harmonic_num); % Get harmonic distortion percentage
        harmonic_freq = harmonic_numL1(harmonic_num) * fundamental_freq; % Harmonic frequency
        harmonic_contrib = harmonic_amplitude / 100 * current_rms * sqrt(2) * sin(2 * pi * harmonic_freq * time_vector);
        waveform_sample = waveform_sample + harmonic_contrib; % Add harmonic contribution

    end

    distorted_waveform(k) = waveform_sample(k);
end




plot(x_time, current_rms * sqrt(2) * sin(2 * pi * fundamental_freq * time_vector))

