%% ���ٶ���ȡ
maindir0=uigetdir('*.*','Select SPS or DGNSS File Folders');%����ѡ���ļ���%
subpath0=fullfile(maindir0,'*.aaa');%�����ļ�������չ��Ϊ.aaa���ļ�%
textfiles0=dir(subpath0);%�����������������ļ�������������textfiles0��%
num_re0=size(textfiles0,1);%����num_re0��һ�еĳ���%
for kk0=1:num_re0%forѭ�� kk0�Ǵ�1��num_re0-1�ĵȲ�����%
textname0=textfiles0(kk0,1).name; %�õ�.aaa�ļ����ļ���%
fid0=fopen(textname0,'r');%��.aaa�ļ���'r'��ʾfor reading%
signal_cell0=textscan(fid0,'%s');%ɨ����ļ������ݣ�������ϸ������%
signal_acc0=signal_cell0{1,1}(4:TT/dt1+3,1);%����ϸ������Ľ��������õ�����ļ��ٶ�ϸ������%   %���������������TT��dt1��֪��%
res_signal0(:,kk0)=str2num(char(signal_acc0));  %�����ٶ�ϸ������仯Ϊ�ַ����飬Ȼ��仯Ϊ��������%
fclose(fid0);  %�رմ򿪵��ļ�%
end%����forѭ��%

%% ����������ȡ
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
if kk1==1%���kk1==1,˵��num_re1=1%
env_signal1=str2num(char(tline1)); %������tline1�仯����������env_signal1% %�������pattern�����%
else 
env_signal2=str2num(char(tline1)); %������tline1�仯����������env_signal2% 
end%����ifѭ��%
tline1=[];%�������tline1����������%
end%������һ��forѭ��%