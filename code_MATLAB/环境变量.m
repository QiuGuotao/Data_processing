maindir1=uigetdir('*.*','Select SPS or DGNSS File Folders');%����ѡ���ļ���%
subpath1=fullfile(maindir1,'*.env');%�����ļ�������չ��Ϊ.env���ļ�%
textfiles1=dir(subpath1);%�����������������ļ�������������textfiles1��%
num_re1=size(textfiles1,1);  %����num_re1��һ�еĳ���%
for kk1=1:num_re1 %forѭ�� kk1�Ǵ�1��num_re1�ĵȲ�����%
textname1=textfiles1(kk1,1).name; %�õ�.aaa�ļ����ļ���%
fid1=fopen(textname1,'r'); %��.aaa�ļ���'r'��ʾfor reading%
tline0=fgetl(fid1);%��ȡ���ļ�����һ��%
for kk=1:10 %kk��1��10%
tline_temp=fgetl(fid1); %��ȡ���ļ�����һ��%
tline1(kk,:)=tline_temp;  %����ȡ�ķ���tline����ĵ�kk����%
end%�����ڶ���forѭ��%
fclose(fid1);%�ر��ļ�%
if kk1==1
env_signalPOS(:,:)=str2num(char(tline1)); %������tline1�仯����������env_signal2% 
else
env_signalPRE(:,:)=str2num(char(tline1));
end
tline1=[];%�������tline1����������%
end%������һ��forѭ��%