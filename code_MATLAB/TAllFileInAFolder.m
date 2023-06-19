
%% TAllFileInAFolder.m
function yyy=TAllFileInAFolder(MainFolderName,SubFolderName) %%合并子文件夹下所有txt，存到主文件夹下，以子文件夹命名
fileFolder=fullfile(MainFolderName,SubFolderName);
dirOutput=dir(fullfile(fileFolder,'*.env'));
fileNames={dirOutput.name}';
num=size(dirOutput);
 
file2=strcat(fileFolder,'\..\',SubFolderName,'.env');%%保存路径
fid2=fopen(file2,'a');
for i=1:num(1)
file1=strcat(fileFolder,'\',fileNames{i,1});%%读取的文件
fid=fopen(file1,'r');
%txt=fscanf(fid,'%s');
env=fread(fid,inf);
fclose(fid);
%fprintf(fid2,'%s',env);
fwrite(fid2,env);
%fprintf(fid2,'\r\n')表示在写完每个txt文件之后，写入一个回车换行符，得到下一个txt从新的一行开始写
fprintf(fid2,'\r\n'); 
end
fclose(fid2);
yyy=1
