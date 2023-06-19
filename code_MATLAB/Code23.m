maindir0=uigetdir('*.*','Select SPS or DGNSS File Folders');
subpath0=fullfile(maindir0,'*.aaa');
textfiles0=dir(subpath0);
num_re0=size(textfiles0,1);
for kk0=1:num_re0
textname0=textfiles0(kk0,1).name; 
fid0=fopen(textname0,'r');
signal_cell0=textscan(fid0,'%s');
signal_acc0=signal_cell0{1,1}(4:TT/dt1+3,1);
res_signal0(:,kk0)=str2num(char(signal_acc0));
fclose(fid0);
end

maindir1=uigetdir('*.*','Select SPS or DGNSS File Folders');
subpath1=fullfile(maindir1,'*.env');
textfiles1=dir(subpath1);
num_re1=size(textfiles1,1); 
for kk1=1:num_re1
textname1=textfiles1(kk1,1).name;
fid1=fopen(textname1,'r');
tline0=fgetl(fid1)
for kk=1:10
tline_temp=fgetl(fid1); 
tline1(kk,:)=tline_temp; 
end
fclose(fid1);
if kk1==1
env_signal1(:,:,pattern)=str2num(tline1); 
else 
env_signal2(:,:,pattern)=str2num(tline1);
end
tline1=[];
end