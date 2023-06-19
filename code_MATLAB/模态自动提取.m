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

for ii=1:Nfft/2
[U,S,V]=svd(squeeze(G0_real(:,:,ii)));
psd_svd(ii,1)=S(1,1);
end


xlabel01=f_disc;     
ylabel01=G1; 
ylabel01=G2(:,1); 

[pks,locs]=findpeaks(ylabel01(10:512),xlabel01(10:512));

M1=locs(3.5<locs&locs<4.4);
if length(M1)==1
    Motai(pattern,1)=M1;
else 
    M1_1(1,:)=M1(:,1);
  for mm=1:length(M1)
      MM1(1,mm)=find(locs==M1_1(1,mm));
      MMM1(1,mm)=pks(MM1(1,mm),1);
      [pksmax,maxlocs]=max(MMM1);
      
  end
  Motai(pattern,1)=M1(maxlocs,1);
end


  
    
end
    