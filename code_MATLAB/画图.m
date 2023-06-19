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
load('C:\Users\guota\OneDrive\桌面\Matlab\f1_total.mat');
Nd=2;        % 测组的自由度数      
Nt=2; 
zeta=[0.01 ]; % 阻尼初始值，可以取0.01 
refer=1;      % 传递比参考点位置
kai0=[0.5:0.5:4];     % 频率带宽，可以只取一个固定值来算，此处不断递增是为了考察不同带宽对识别结果的影响

            
for pattern=2
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
freq=[5];  % 频率初始值，可以只取峰值，识别多少阶就给多少个初始值

Nmode=length(freq);         % 识别的阶数  
Nkai=length(kai0);           
mpv_spec0=zeros(Nmode*3,3,Nkai);        %识别的频率，阻尼和v值（最优值，标准差，变异系数）
mpv_spat0=zeros(Nmode*Nd,3,Nkai);       %振型的最优值，标准差，变异系数
hess_tr0=zeros(Nmode*(Nt+3),Nt+3,Nkai); %振型的协方差

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for kk=1:Nkai
kai=kai0(kk);                       % Duration of measurement
[mpv_spec,mpv_spat,covm,hess]=baye_tran(refer,kai,Nmode);    
mpv_spec0(:,:,kk)=mpv_spec(:,:);   % 识别的频率，阻尼和v的最优值，标准差和变异系数
mpv_spat0(:,:,kk)=mpv_spat(:,:);   % 振型的最优值，标准差和变异系数
hess_tr0(:,:,kk)=hess(:,:);        % 振型的协方差 
end

end

for ii=1:Nmode
fs=squeeze(mpv_spec0((ii-1)*3+1,1,:));
ts=squeeze(mpv_spec0((ii-1)*3+2,1,:));
sf=squeeze(mpv_spec0((ii-1)*3+3,1,:));

fs0=squeeze(mpv_spec0((ii-1)*3+1,2,:));
ts0=squeeze(mpv_spec0((ii-1)*3+2,2,:));
sf0=squeeze(mpv_spec0((ii-1)*3+3,2,:));

fs_the_ex(:,ii)=fs;
ts_the_ex(:,ii)=ts;
sf_the_ex(:,ii)=sf;

fs_the_ex1(:,ii)=fs+2*fs0;
ts_the_ex1(:,ii)=ts+2*ts0;
sf_the_ex1(:,ii)=sf+2*sf0;

fs_the_ex2(:,ii)=fs-2*fs0;
ts_the_ex2(:,ii)=ts-2*ts0;
sf_the_ex2(:,ii)=sf-2*sf0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for jj=1:3 
for ii=1:Nmode
    
subplot(3,Nmode,(jj-1)*Nmode+ii);
if jj==1
plot(kai0,fs_the_ex(:,ii),'ro','MarkerSize',5);
hold on
plot(kai0,fs_the_ex(:,ii),'r-','MarkerSize',5);
plot(kai0,fs_the_ex1(:,ii),'r*','MarkerSize',10);
plot(kai0,fs_the_ex1(:,ii),'r-.','MarkerSize',10);
plot(kai0,fs_the_ex2(:,ii),'r*','MarkerSize',10);
plot(kai0,fs_the_ex2(:,ii),'r-.','MarkerSize',10);
set(gca,'FontSize',20,'FontWeight','demi');
title(['Mode',num2str(ii)]);
axis([0.9*min(kai0) 1.1*max(kai0) 0.98*min(fs_the_ex2(:,ii)) 1.02*max(fs_the_ex1(:,ii))])
% title('(a)')
text(1*max(kai0),1.01*max(max(fs_the_ex1(:,ii))),'\itf','fontsize',25,'FontWeight','demi')
% xlabel('Time duration','fontsize',20,'FontWeight','demi'); 
if ii==1
ylabel('Posterior variance','fontsize',20,'FontWeight','demi'); 
end
grid
end

if jj==2
subplot(3,Nmode,(jj-1)*Nmode+ii);
plot(kai0,ts_the_ex(:,ii),'ro','MarkerSize',5);
hold on
plot(kai0,ts_the_ex(:,ii),'r-','MarkerSize',5);
plot(kai0,ts_the_ex1(:,ii),'r*','MarkerSize',10);
plot(kai0,ts_the_ex1(:,ii),'r-.','MarkerSize',10);
plot(kai0,ts_the_ex2(:,ii),'r*','MarkerSize',10);
plot(kai0,ts_the_ex2(:,ii),'r-.','MarkerSize',10);
set(gca,'FontSize',20,'FontWeight','demi');
% title(['Mode',num2str(ii)]);
axis([0.9*min(kai0) 1.1*max(kai0) 0.75*min(ts_the_ex2(:,ii)) 1.25*max(ts_the_ex1(:,ii))])
% title('(a)')
text(1*max(kai0),1.1*max(max(ts_the_ex1(:,ii))),'\zeta','fontsize',25,'FontWeight','demi')
% xlabel('Time duration','fontsize',20,'FontWeight','demi'); 
if ii==1
ylabel('Posterior variance','fontsize',20,'FontWeight','demi'); 
end

grid
end

if jj==3
subplot(3,Nmode,(jj-1)*Nmode+ii);
plot(kai0,sf_the_ex(:,ii),'ro','MarkerSize',5);
hold on
plot(kai0,sf_the_ex(:,ii),'r-','MarkerSize',5);
plot(kai0,sf_the_ex1(:,ii),'r*','MarkerSize',10);
plot(kai0,sf_the_ex1(:,ii),'r-.','MarkerSize',10);
plot(kai0,sf_the_ex2(:,ii),'r*','MarkerSize',10);
plot(kai0,sf_the_ex2(:,ii),'r-.','MarkerSize',10);
set(gca,'FontSize',20,'FontWeight','demi');
% title(['Mode',num2str(ii)]);
axis([0.9*min(kai0) 1.1*max(kai0) 0.75*min(sf_the_ex2(:,ii)) 1.25*max(sf_the_ex1(:,ii))])
% title('(a)')
text(1*max(kai0),1.1*max(max(sf_the_ex1(:,ii))),'\itv','fontsize',25,'FontWeight','demi')
xlabel('Bandwidth factor','fontsize',20,'FontWeight','demi'); 
if ii==1
ylabel('Posterior variance','fontsize',20,'FontWeight','demi'); 
end

grid
end

end 
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for ii=1:Nmode
fs=squeeze(mpv_spec0((ii-1)*3+1,3,:));
ts=squeeze(mpv_spec0((ii-1)*3+2,3,:));
sf=squeeze(mpv_spec0((ii-1)*3+3,3,:));

fs_the_ex(:,ii)=fs;
ts_the_ex(:,ii)=ts;
sf_the_ex(:,ii)=sf;

% fs_the_ex(:,ii)=fs.^0.5;
% ts_the_ex(:,ii)=ts.^0.5;
% sf_the_ex(:,ii)=sf.^0.5;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,3,1);
plot(kai0,fs_the_ex(:,1),'rs','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',10);
hold on
% plot(kai0,fs_the_ex(:,2),'kv','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
% plot(kai0,fs_the_ex(:,3),'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
plot(kai0,fs_the_ex(:,1),'r-','LineWidth',2);
% hold on
% plot(kai0,fs_the_ex(:,2),'k--','LineWidth',2);
% plot(kai0,fs_the_ex(:,3),'g:','LineWidth',2);
set(gca,'FontSize',20,'FontWeight','demi');
axis([min(kai0) max(kai0) 0 1.5*max(max(fs_the_ex))])
title('(a)')
text(0.9*max(kai0),1.2*max(max(fs_the_ex)),'\itf','fontsize',25,'FontWeight','demi')
xlabel('Bandwidth factor','fontsize',20,'FontWeight','demi'); 
ylabel('Posterior c.o.v.','fontsize',20,'FontWeight','demi'); 
grid
hold off

subplot(1,3,2);
plot(kai0,ts_the_ex(:,1),'rs','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',10);
hold on
% plot(kai0,ts_the_ex(:,2),'kv','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
% plot(kai0,ts_the_ex(:,3),'go','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',10);
plot(kai0,ts_the_ex(:,1),'r-','LineWidth',2);
hold on
% plot(kai0,ts_the_ex(:,2),'k--','LineWidth',2);
% plot(kai0,ts_the_ex(:,3),'g:','LineWidth',2);
set(gca,'FontSize',20,'FontWeight','demi');
axis([min(kai0) max(kai0) 0 1.5*max(max(ts_the_ex))])
title('(b)')
text(0.9*max(kai0),1.2*max(max(ts_the_ex)),'\it\zeta','fontsize',25,'FontWeight','demi')
xlabel('Bandwidth factor','fontsize',20,'FontWeight','demi'); 
ylabel('Posterior c.o.v.','fontsize',20,'FontWeight','demi'); 
grid
hold off

subplot(1,3,3);
plot(kai0,sf_the_ex(:,1),'rs','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',10);
hold on
% plot(kai0,sf_the_ex(:,2),'kv','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
% plot(kai0,sf_the_ex(:,3),'go','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',10);
plot(kai0,sf_the_ex(:,1),'r-','LineWidth',2);
hold on
% plot(kai0,sf_the_ex(:,2),'k--','LineWidth',2);
% plot(kai0,sf_the_ex(:,3),'g:','LineWidth',2);
set(gca,'FontSize',20,'FontWeight','demi');
axis([min(kai0) max(kai0) 0 1.5*max(max(sf_the_ex))])
title('(c)')
text(0.9*max(kai0),1.2*max(max(sf_the_ex)),'\itv','fontsize',25,'FontWeight','demi')
xlabel('Bandwidth factor','fontsize',20,'FontWeight','demi'); 
ylabel('Posterior c.o.v.','fontsize',20,'FontWeight','demi'); 
grid
hold off

