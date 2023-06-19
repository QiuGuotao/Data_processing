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
freq=[3.9];  % Ƶ�ʳ�ʼֵ������ֻȡ��ֵ��ʶ����ٽ׾͸����ٸ���ʼֵ
Nd=length(Ytt(1,:));                     % ��������ɶ���      
Nt=length(Ytt(1,:)); 
Nmode=length(freq);  % ʶ��Ľ���  
zeta=[0.01 ];       % �����ʼֵ������ȡ0.01 
refer=1;            % ���ݱȲο���λ��
kai0=[2];           % Ƶ�ʴ�������ֻȡһ���̶�ֵ���㣬�˴����ϵ�����Ϊ�˿��첻ͬ�����ʶ������Ӱ��
Nkai=length(kai0);   


mpv_spec0=zeros(Nmode*3,3,Nkai);        %ʶ���Ƶ�ʣ������vֵ������ֵ����׼�����ϵ����
mpv_spat0=zeros(Nmode*Nd,3,Nkai);       %���͵�����ֵ����׼�����ϵ��
hess_tr0=zeros(Nmode*(Nt+3),Nt+3,Nkai); %���͵�Э����

for kk=1:Nkai
kai=kai0(kk);                       % Duration of measurement
[mpv_spec,mpv_spat,covm,hess]=baye_tran(refer,kai,Nmode);    
mpv_spec0(:,:,kk)=mpv_spec(:,:);   % ʶ���Ƶ�ʣ������v������ֵ����׼��ͱ���ϵ��
mpv_spat0(:,:,kk)=mpv_spat(:,:);   % ���͵�����ֵ����׼��ͱ���ϵ��
hess_tr0(:,:,kk)=hess(:,:);        % ���͵�Э���� 
end


