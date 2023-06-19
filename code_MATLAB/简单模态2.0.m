clear
close all
clc  
global Nt Nm Nsig rr omegat11 k11 k12 T dt1 Nd trans
global Nmode freq zeta kai point_pre 
global TT freq_low freq_up %���ù�

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

dt1=1/100;    
TT=64000*dt1; 
kai=4;       



freq_low=[3.5 4.5 9.5 10.6]; 
freq_up=[4.4 5.8 10.6 11.5]; 


Nmode=length(freq_up);  
aa=1; 
textpath=pathfun(aa); 


for pattern=1  
textpath0=textpath(pattern,:);  
textfiles0=dir(fullfile(textpath0,'/*.aaa'));
num_re0=size(textfiles0,1);                  


kkk=1;
for kk0=[2,5,4,6]
textname0=textfiles0(kk0,1).name; 
fid0=fopen(textname0,'r');
signal_cell0=textscan(fid0,'%s');
signal_acc0=signal_cell0{1,1}(4:TT/dt1+3,1);
res_signal0(:,kkk)=str2num(char(signal_acc0)); 
kkk=kkk+1;
fclose(fid0);  
end 

Ytt=res_signal0(:,:)*9.8; 
Nfft=1024;
AY=detrend(Ytt); 
f_sam=1/100; 
Nd=length(AY(1,:)); 
channel=[1:Nd];
             
G0 = zeros(length(channel),length(channel),(Nfft/2+1));

for i=1:length(channel)
    for j=1:length(channel)
               
        [Pff2,f_disc]=cpsd(AY(:,channel(i)),AY(:,channel(j)),hanning(Nfft),Nfft/2,Nfft,f_sam);
        G0(j,i,:) = Pff2;
       
    end

end

end




m=1; %m �ǵڼ���ģ̬

mode_freq=modefreq(pattern,:);

mode1_freq=mode_freq(1,m);  %��ȡ���Զ���ȡ��ֵ��ֵ��Ƶ��

                            %mode1_freq�������ǵڼ����ļ��ڼ����Զ���ȡ���ķ�ֵƵ�ʣ������꣩

[a,b]=find(f_disc==mode1_freq);  % doc find  �ҵ������ֵƵ�ʣ������꣩��513��Ƶ�ʵĵڼ����������a���棬�൱��Ҫ42


SS=G0(:,:,a); % ȡ��ֵƵ�ʶ�Ӧ�Ļ������׾����൱��ȡ G0����ĵ�42��4*4�ľ���

[U,S,V]=svd(G0(:,:,a));% doc svd ����ֵ�ֽ⣬�ֽ�G0����ĵ�42��4*4�ľ���S������ֵ����V��������������


for i=1:9
    for j=1:6
        y1(j,i)=y0(j,i)/y0(6,i);
    end
end

y2=abs(y1);
y3=real(y1);


for k=1:6
    for m=1:9
if y3(k,m)>0
    y4(k,m)=1;
else
  y4(k,m)=-1;
end
    end
end

y5=y4.*y2;







