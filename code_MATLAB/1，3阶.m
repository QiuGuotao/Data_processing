clear all
close all
clc  
global Nt Nm Nsig rr omegat11 k11 k12 T dt1 Nd trans
global Nmode freq zeta kai point_pre 
global TT freq_low freq_up 
global Nt omegat11 k11 k12 T dt1 Nd trans Ytt freq zeta point0  
aa=1; 
textpath=pathfun(aa);
dt1=1/100;    
TT=64000*dt1; 
load('C:\Users\guota\OneDrive\桌面\f123.mat');
Data=5;


for pattern=1:Data
% pattern=2368; 
textpath0=textpath(pattern,:); 
textfiles0=dir(fullfile(textpath0,'/*.aaa'));
num_re0=size(textfiles0,1);                  

for kk0=1:8
textname0=textfiles0(kk0,1).name; 
fid0=fopen(textname0,'r');
signal_cell0=textscan(fid0,'%s');
signal_acc0=signal_cell0{1,1}(4:TT/dt1+3,1);
res_signal0(:,kk0)=str2num(char(signal_acc0));  
fclose(fid0);  
end 
Ytt=res_signal0(:,:)*9.8;  

T=length(Ytt(:,1))*dt1;

freq=[f123(pattern,1),f123(pattern,3)]; 

Nd=length(Ytt(1,:));                     % 测组的自由度数      
Nt=length(Ytt(1,:)); 
Nmode=length(freq);  % 识别的阶数  
zeta=[0.01 ,0.01];       % 阻尼初始值，可以取0.01 
refer=1;            % 传递比参考点位置
kai0=[1.5];           % 频率带宽，可以只取一个固定值来算，此处不断递增是为了考察不同带宽对识别结果的影响


[mpv_spec,mpv_spat,covm,hess]=baye_tran(refer,kai0,Nmode);    
mpv_spec0(:,:,pattern)=mpv_spec(:,:);   % 识别的频率，阻尼和v的最优值，标准差和变异系数
mpv_spat0(:,:,pattern)=mpv_spat(:,:);   % 振型的最优值，标准差和变异系数
hess_tr0(:,:,pattern)=hess(:,:);        % 振型的协方差 

a_frequence(pattern,1)=mpv_spec0(1,1,pattern);
a_damp(pattern,1)=mpv_spec0(2,1,pattern);
a_vvalue(pattern,1)=mpv_spec0(3,1,pattern);
a_snr(pattern,1)=(a_vvalue(pattern,1)^-1)/(4*(a_damp(pattern,1)^2));

a_frequence(pattern,3)=mpv_spec0(4,1,pattern);
a_damp(pattern,3)=mpv_spec0(5,1,pattern);
a_vvalue(pattern,3)=mpv_spec0(6,1,pattern);
a_snr(pattern,3)=(a_vvalue(pattern,3)^-1)/(4*(a_damp(pattern,3)^2)); 
end
save myfile a_frequence a_vvalue a_damp a_snr;
clear all
load myfile;

close all
clc  
global Nt Nm Nsig rr omegat11 k11 k12 T dt1 Nd trans
global Nmode freq zeta kai point_pre 
global TT freq_low freq_up 
global Nt omegat11 k11 k12 T dt1 Nd trans Ytt freq zeta point0  
aa=1; 
textpath=pathfun(aa);
dt1=1/100;    
TT=64000*dt1; 
kai=4; 
load('C:\Users\guota\OneDrive\桌面\f123.mat');
Nd=2;        % 测组的自由度数      
Nt=2; 
zeta=[0.02 ]; % 阻尼初始值，可以取0.01 
refer=1;      % 传递比参考点位置
kai0=[1];     % 频率带宽，可以只取一个固定值来算，此处不断递增是为了考察不同带宽对识别结果的影响
Nkai=length(kai0);
Nmode=1;         % 识别的阶数  

for pattern=1:Data
% pattern=2368; 
textpath0=textpath(pattern,:); 
textfiles0=dir(fullfile(textpath0,'/*.aaa'));
num_re0=size(textfiles0,1);                  

for kk0=1:8
textname0=textfiles0(kk0,1).name; 
fid0=fopen(textname0,'r');
signal_cell0=textscan(fid0,'%s');
signal_acc0=signal_cell0{1,1}(4:TT/dt1+3,1);
res_signal0(:,kk0)=str2num(char(signal_acc0));  
fclose(fid0);  
end 
res_signal1(:,1)=res_signal0(:,7);
res_signal1(:,2)=res_signal0(:,8);

Ytt=res_signal1(:,:)*9.8;  

T=length(Ytt(:,1))*dt1;
%  freq=[5];  % 频率初始值，可以只取峰值，识别多少阶就给多少个初始值
freq=f123(pattern,2); 

[mpv_spec,mpv_spat,covm,hess]=baye_tran(refer,kai0,Nmode);    
mpv_spec0(:,:,pattern)=mpv_spec(:,:);   % 识别的频率，阻尼和v的最优值，标准差和变异系数
mpv_spat0(:,:,pattern)=mpv_spat(:,:);   % 振型的最优值，标准差和变异系数
hess_tr0(:,:,pattern)=hess(:,:);        % 振型的协方差 

a_frequence(pattern,2)=mpv_spec0(1,1,pattern);
a_damp(pattern,2)=mpv_spec0(2,1,pattern);
a_vvalue(pattern,2)=mpv_spec0(3,1,pattern);
a_snr(pattern,2)=(a_vvalue(pattern,2)^-1)/(4*(a_damp(pattern,2)^2));
end
