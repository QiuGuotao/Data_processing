%%一些基本的变量赋值
dt1=1/100;    
TT=64000*dt1; 
kai=4;        

%%限定的频率范围
% freq_low=[3.5 4.5 9.5 10.5 12.0]; 
% freq_up=[4.5 5.8 10.5 11.5 13.0]; 

freq_low=[3.5 4.5 9.5 10.6]; 
freq_up=[4.4 5.8 10.6 11.5]; 

% freq_low=[3.5 4.5 9.45 ];
% freq_up=[4.4 5.8 10.6 ];  

Nmode=length(freq_up);         
aa=1; 
%% 读取文件路径
textpath=pathfun(aa);

% cpu=feature('numCores'); 
% parpool(cpu);            

for pattern=1%:length(textpath(:,1))%第一个循环，读取一个时间段的文件
textpath0=textpath(pattern,:); 
textfiles0=dir(fullfile(textpath0,'/*.aaa'));
num_re0=size(textfiles0,1);                  

for kk0=[2,4,5,6]%第二个循环，读取同一个文件里的8个加速度文件

textname0=textfiles0(kk0,1).name; 
fid0=fopen(textname0,'r');
signal_cell0=textscan(fid0,'%s');
signal_acc0=signal_cell0{1,1}(4:TT/dt1+3,1);
res_signal1(:,kk0)=str2num(char(signal_acc0));  
fclose(fid0);  
end 
res_signal0(:,1)=res_signal1(:,2);
res_signal0(:,2)=res_signal1(:,4);
res_signal0(:,3)=res_signal1(:,5);
res_signal0(:,4)=res_signal1(:,6);

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%方法二：采用奇异值生成峰值曲线
% for ii=1:Nfft/2
% [U,S,V]=svd(squeeze(G0_real(:,:,ii)));
% psd_svd(ii,1)=S(1,1);
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%方法三：采用PSDT生成峰值曲线
% channel = [1:Nd];
% Tran_matr= zeros(length(channel),length(channel),(Nfft/2+1));  
% 
% k=0;
% for m=1:Nd
% for j=m:Nd
% if j~=m
%    G0_trans1=((G0_real(j,j,:))./(G0_real(m,j,:)));
%    G0_trans2=(G0_real(j,m,:)./G0_real(m,m,:));
%    CSD_change=G0_trans1-G0_trans2;
%    k=k+1;
%    PSDT_inverse(:,k)=(1./abs(CSD_change));
% end
% end
% end
% PSDT_inverse0=sum((PSDT_inverse),2);

xlabel01=f_disc;     %这个变量就是图的X值


%ylabel01=G1; %这个是自功率谱
ylabel01=G2(:,1); %这个是互功率谱
%ylabel01=psd_svd(:,1);%奇异值
% ylabel01=PSDT_inverse0;%PSDT法，他的自创方法

%这个是图的Y值，你用哪个就是哪个方法画图

%plot(xlabel01(10:512),ylabel01(10:512),'b-','LineWidth',2);%画图

[pks,locs]=findpeaks(ylabel01(10:512),xlabel01(10:512));

M1=locs(3.5<locs&locs<4.4);
if length(M1)==1
    motai(pattern,1)=M1;
else
for mm=1:length(M1)

    MM1(mm,1)=find(locs==M1(mm,1));

    MMM1(1,mm)=pks(MM1(mm,1),1);
    
end
[pksmax,locsmax]=max(MMM1);
    motai(pattern,1)=M1(locsmax,1);
end

M2=locs(4.5<locs&locs<5.8);
if length(M2)==1
    motai(pattern,2)=M2;
else
for mm=1:length(M2)

    MM2(mm,1)=find(locs==M2(mm,1));

    MMM2(1,mm)=pks(MM2(mm,1),1);
    
end
[pksmax,locsmax]=max(MMM2);
    motai(pattern,2)=M2(locsmax,1);
end

M3=locs(9.5<locs&locs<10.6);
if length(M3)==1
    motai(pattern,3)=M3;
else
for mm=1:length(M3)

    MM3(mm,1)=find(locs==M3(mm,1));

    MMM3(1,mm)=pks(MM3(mm,1),1);
    
end
[pksmax,locsmax]=max(MMM3);
    motai(pattern,3)=M3(locsmax,1);
end

M4=locs(10.6<locs&locs<11.5);
if length(M4)==1
    motai(pattern,4)=M4;
else
for mm=1:length(M4)

    MM4(mm,1)=find(locs==M4(mm,1));

    MMM4(1,mm)=pks(MM4(mm,1),1);
    
end
[pksmax,locsmax]=max(MMM4);
    motai(pattern,4)=M4(locsmax,1);
end
M1=[];M2=[];M3=[];M4=[];
MM1=[];MMM1=[];
MM2=[];MMM2=[];
MM3=[];MMM3=[];
MM4=[];MMM4=[];
end

