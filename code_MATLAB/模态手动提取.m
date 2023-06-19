clear
close all
clc  
global Nt Nm Nsig rr omegat11 k11 k12 T dt1 Nd trans
global Nmode freq zeta kai point_pre 
global TT freq_low freq_up 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

dt1=1/100;    
TT=64000*dt1; 
kai=4;        

% freq_low=[3.5 4.5 9.5 10.5 12.0]; 
% freq_up=[4.5 5.8 10.5 11.5 13.0]; 

freq_low=[3.5 4.5 9.5 10.6]; 
freq_up=[4.4 5.8 10.6 11.5]; 

% freq_low=[3.5 4.5 9.45 ];
% freq_up=[4.4 5.8 10.6 ];  

Nmode=length(freq_up);         
aa=1; 
textpath=pathfun(aa);

% cpu=feature('numCores'); 
% parpool(cpu);            

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%方法一：采用功率谱生成峰值曲线

Nfft=1024; 
AY=detrend(Ytt);
f_sam=1/dt1;
Nd=length(AY(1,:));
channel=[1:Nd];

G0 = zeros(length(channel),length(channel),(Nfft/2+1));
G1=0; G3=0; 
for i=1:length(channel)
    for j=1:length(channel)
%       [Pff2,f] = csd(AY(:,channel(i)),AY(:,channel(j)),NFFT,fs,kaiser(NFFT),NFFT/2); bartlett
        [Pff2,f_disc]=cpsd(AY(:,channel(i)),AY(:,channel(j)),hanning(Nfft),Nfft/2,Nfft,f_sam);
        G0(j,i,:) = Pff2;
           G3=G3+abs(Pff2);
        if i==j
           G1=G1+Pff2;
           G2(:,i)=Pff2; 
           
        end
    end
end
G0_real=G0; 

channel = [1:Nd];
Tran_matr= zeros(length(channel),length(channel),(Nfft/2+1));  

k=0;
for m=1:Nd
for j=m:Nd
if j~=m
   G0_trans1=((G0_real(j,j,:))./(G0_real(m,j,:)));
   G0_trans2=(G0_real(j,mm,:)./G0_real(m,m,:));
   CSD_change=G0_trans1-G0_trans2;
   k=k+1;
   PSDT_inverse(:,k)=(1./abs(CSD_change));
end
end
end
PSDT_inverse0=sum((PSDT_inverse),2);

for ii=1:Nfft/2
[U,S,V]=svd(squeeze(G0_real(:,:,ii)));
psd_svd(ii,1)=S(1,1);
end


xlabel01=f_disc;     
ylabel01=G1; 
%ylabel01=G2(:,1); 
plot(xlabel01(10:512),ylabel01(10:512),'b-','LineWidth',2);

pause; 
    
end