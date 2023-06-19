maindir0=uigetdir('*.*','Select SPS or DGNSS File Folders');
subpath0=fullfile(maindir0,'*.aaa');
textfiles0=dir(subpath0);
num_re0=size(textfiles0,1);
for kk0=1:num_re0
textname0=textfiles0(kk0,1).name; 
fid0=fopen(textname0,'r');
signal_cell0=textscan(fid0,'%s');
signal_acc0=signal_cell0{1,1}(1000:1019,1);
res_signal0(:,kk0)=str2num(char(signal_acc0));
fclose(fid0);
end