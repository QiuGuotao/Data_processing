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
kai=4; 

for pattern=1:length(textpath(:,1))   
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

end

T=length(Ytt(:,1))*dt1;
freq=[3.9];  % 频率初始值，可以只取峰值，识别多少阶就给多少个初始值
Nd=length(Ytt(1,:));                     % 测组的自由度数      
Nt=length(Ytt(1,:)); 
Nmode=length(freq);  % 识别的阶数  
zeta=[0.01 ];       % 阻尼初始值，可以取0.01 
refer=1;            % 传递比参考点位置
kai0=[2];           % 频率带宽，可以只取一个固定值来算，此处不断递增是为了考察不同带宽对识别结果的影响
Nkai=length(kai0);   


mpv_spec0=zeros(Nmode*3,3,Nkai);        %识别的频率，阻尼和v值（最优值，标准差，变异系数）
mpv_spat0=zeros(Nmode*Nd,3,Nkai);       %振型的最优值，标准差，变异系数
hess_tr0=zeros(Nmode*(Nt+3),Nt+3,Nkai); %振型的协方差

for kk=1:Nkai
kai=kai0(kk);                       % Duration of measurement
[mpv_spec,mpv_spat,covm,hess]=baye_tran(refer,kai,Nmode);    
mpv_spec0(:,:,kk)=mpv_spec(:,:);   % 识别的频率，阻尼和v的最优值，标准差和变异系数
mpv_spat0(:,:,kk)=mpv_spat(:,:);   % 振型的最优值，标准差和变异系数
hess_tr0(:,:,kk)=hess(:,:);        % 振型的协方差 
end


