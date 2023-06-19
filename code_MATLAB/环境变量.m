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
if kk1==1
env_signalPOS(:,:)=str2num(char(tline1)); %将数组tline1变化到数字数组env_signal2% 
else
env_signalPRE(:,:)=str2num(char(tline1));
end
tline1=[];%清空数组tline1里卖的内容%
end%结束第一个for循环%