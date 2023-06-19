clear 
clc
n_file=1; 
textpath='E:\����\cantontower\';
textfiles=dir(fullfile(textpath,'/*.txt'));
textname=[textpath,textfiles(n_file,1).name];
AY=load(textname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs=50;
Nfft=4096;
N=20;%ͨ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N
    for j=1:N
        [P,f]=cpsd(AY(:,i),AY(:,j),kaiser(Nfft),Nfft/2,Nfft,fs);%�������ף�Pff2������f����
        G0(j,i,:)=P;
     end
end

k=0;
s=zeros(Nfft/2+1,N);%����ֵ����
 for m=1:Nfft/2+1;
     k=k+1;   
    [U,S,V]=svd(squeeze(G0(:,:,m)));
    for n=1:N
        s(k,n)=S(n,n);    
    end
 end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear tmax vmax fmax ;
[vmax, tmax]=findpeaks(s(:,1));%ѡ��Χ
for i=1:length(tmax)

fmax(i,1)=f(tmax(i,1));
end


semilogy(f(:,1),s(:,1),'b-','LineWidth',2.8)
hold on; 

semilogy(fmax, vmax, 'ro'); 
aa=num2str(fmax);
text(fmax,vmax,aa,'fontsize',20,'FontWeight','demi');
set(gca,'FontSize',26,'FontWeight','demi');
xlabel('Frequency(Hz)'); 
ylabel('��'); 
% grid


