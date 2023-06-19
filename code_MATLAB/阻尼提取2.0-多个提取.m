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
load('C:\Users\guota\OneDrive\����\f123.mat');
Nd=8;        % ��������ɶ���      
Nt=8; 
zeta=[0.02 ]; % �����ʼֵ������ȡ0.01 
refer=1;      % ���ݱȲο���λ��
kai0=[2];     % Ƶ�ʴ�������ֻȡһ���̶�ֵ���㣬�˴����ϵ�����Ϊ�˿��첻ͬ�����ʶ������Ӱ��
Nkai=length(kai0);
Nmode=1;         % ʶ��Ľ���  

            
for pattern=1:10
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
% freq=[3.9844];  % Ƶ�ʳ�ʼֵ������ֻȡ��ֵ��ʶ����ٽ׾͸����ٸ���ʼֵ
freq=f123(pattern,3); 

[mpv_spec,mpv_spat,covm,hess]=baye_tran(refer,kai0,Nmode);    
mpv_spec0(:,:,pattern)=mpv_spec(:,:);   % ʶ���Ƶ�ʣ������v������ֵ����׼��ͱ���ϵ��
mpv_spat0(:,:,pattern)=mpv_spat(:,:);   % ���͵�����ֵ����׼��ͱ���ϵ��
hess_tr0(:,:,pattern)=hess(:,:);        % ���͵�Э���� 

a_frequence(pattern,1)=mpv_spec0(1,1,pattern);
a_damp(pattern,1)=mpv_spec0(2,1,pattern);
a_vvalue(pattern,1)=mpv_spec0(3,1,pattern);

a_snr(pattern,1)=(a_vvalue(pattern,1)^-1)/(4*(a_damp(pattern,1)^2));

end

% [a_damp,a_frequence,a_vvalue,a_snr] = damping(refer0,kai0,zeta0,length_pattern)
% [a_damp,a_frequence,a_vvalue,a_snr] = damping(1,1,0.01,5);
