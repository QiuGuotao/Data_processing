
%% TAllFileInAFolder.m
function yyy=TAllFileInAFolder(MainFolderName,SubFolderName) %%�ϲ����ļ���������txt���浽���ļ����£������ļ�������
fileFolder=fullfile(MainFolderName,SubFolderName);
dirOutput=dir(fullfile(fileFolder,'*.env'));
fileNames={dirOutput.name}';
num=size(dirOutput);
 
file2=strcat(fileFolder,'\..\',SubFolderName,'.env');%%����·��
fid2=fopen(file2,'a');
for i=1:num(1)
file1=strcat(fileFolder,'\',fileNames{i,1});%%��ȡ���ļ�
fid=fopen(file1,'r');
%txt=fscanf(fid,'%s');
env=fread(fid,inf);
fclose(fid);
%fprintf(fid2,'%s',env);
fwrite(fid2,env);
%fprintf(fid2,'\r\n')��ʾ��д��ÿ��txt�ļ�֮��д��һ���س����з����õ���һ��txt���µ�һ�п�ʼд
fprintf(fid2,'\r\n'); 
end
fclose(fid2);
yyy=1
