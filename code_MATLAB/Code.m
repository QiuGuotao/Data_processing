%% 加速度提取
maindir0=uigetdir('*.*','Select SPS or DGNSS File Folders');%打开所选的文件夹%
subpath0=fullfile(maindir0,'*.aaa');%查找文件夹中拓展名为.aaa的文件%
textfiles0=dir(subpath0);%将满足条件的所有文件名保存在数组textfiles0中%
num_re0=size(textfiles0,1);%向量num_re0第一行的长度%
for kk0=1:num_re0%for循环 kk0是从1到num_re0-1的等差数列%
textname0=textfiles0(kk0,1).name; %得到.aaa文件的文件名%
fid0=fopen(textname0,'r');%打开.aaa文件，'r'表示for reading%
signal_cell0=textscan(fid0,'%s');%扫描打开文件的数据，构成新细胞矩阵%
signal_acc0=signal_cell0{1,1}(4:TT/dt1+3,1);%对新细胞矩阵的进行索引得到所需的加速度细胞矩阵%   %这里面的两个参数TT和dt1不知道%
res_signal0(:,kk0)=str2num(char(signal_acc0));  %将加速度细胞矩阵变化为字符数组，然后变化为数字数组%
fclose(fid0);  %关闭打开的文件%
end%结束for循环%

%% 环境变量提取
maindir1=uigetdir('*.*','Select SPS or DGNSS File Folders');%打开所选的文件夹%
subpath1=fullfile(maindir1,'*.env');%查找文件夹中拓展名为.env的文件%
textfiles1=dir(subpath1);%将满足条件的所有文件名保存在数组textfiles1中%
num_re1=size(textfiles1,1);  %向量num_re1第一行的长度%
for kk1=1:num_re1 %for循环 kk1是从1到num_re1的等差数列%
textname1=textfiles1(kk1,1).name; %得到.aaa文件的文件名%
fid1=fopen(textname1,'r'); %打开.aaa文件，'r'表示for reading%
tline0=fgetl(fid1);%读取打开文件的下一行%
for kk=1:10 %kk从1到10%
tline_temp=fgetl(fid1); %读取打开文件的下一行%
tline1(kk,:)=tline_temp;  %将读取的放入tline数组的第kk行内%
end%结束第二个for循环%
fclose(fid1);%关闭文件%
if kk1==1%如果kk1==1,说明num_re1=1%
env_signal1=str2num(char(tline1)); %将数组tline1变化到数字数组env_signal1% %这个变量pattern不清楚%
else 
env_signal2=str2num(char(tline1)); %将数组tline1变化到数字数组env_signal2% 
end%结束if循环%
tline1=[];%清空数组tline1里卖的内容%
end%结束第一个for循环%