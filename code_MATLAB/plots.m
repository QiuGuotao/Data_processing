a = ones(4000,6);
b = ones(4000,6);
c = ones(4000,6);%�������
pm3_1=dir('C:\Users\guota\OneDrive\����\Matlab\*.txt'); %�����ļ����е��ļ���ʽ��ѡ���ȡ����
pm3_2=dir('C:\Users\guota\OneDrive\����\Matlab\*.txt');
pm3_3=dir('C:\Users\guota\OneDrive\����\Matlab\*.txt');
n = length(pm3_1); %%�ļ�����
full_data1 = cell(n,1);%%����n*1��Ԫ��
full_data2 = cell(n,1);
full_data3 = cell(n,1);
for k=1:n
filename = ['C:\Users\guota\OneDrive\����\Matlab\',pm3_1(k).name];%%�����k���ļ���λ��
full_data1{k} = importdata(filename);%%���ļ����е��ļ�ÿ����Ϊһ��Ԫ�����д洢��Ԫ����
temp = cell2mat(full_data1(k,:));%��struct�ж�ȡ�ļ����ؾ�����ʽ���Ա��������ʹ��
temp = size(temp);
temp = temp(1,1);
a(1:temp,k) = cell2mat(full_data1(k,:));

filename = ['C:\Users\guota\OneDrive\����\Matlab\',pm3_2(k).name];%%�����k���ļ���λ��
full_data2{k} = importdata(filename);%%���ļ����е��ļ�ÿ����Ϊһ��Ԫ�����д洢��Ԫ����
temp = cell2mat(full_data2(k,:));%��struct�ж�ȡ�ļ����ؾ�����ʽ���Ա��������ʹ��
temp = size(temp);
temp = temp(1,1);
b(1:temp,k) = cell2mat(full_data2(k,:));

filename = ['C:\Users\guota\OneDrive\����\Matlab\',pm3_3(k).name];%%�����k���ļ���λ��
full_data3{k} = importdata(filename);%%���ļ����е��ļ�ÿ����Ϊһ��Ԫ�����д洢��Ԫ����
temp = cell2mat(full_data3(k,:));%��struct�ж�ȡ�ļ����ؾ�����ʽ���Ա��������ʹ��
temp = size(temp);
temp = temp(1,1);
c(1:temp,k) = cell2mat(full_data3(k,:));
end
for i=1:3          
subplot(3,3,i);
p1 = plot(a(:,(2*i-1)),'r');
hold on;
p2 = plot(a(:,(2*i)),'g');
grid on;  
xlabel('pm3_1','Interpreter','none');
if(i<3)
 legend('test1','test2');
else
 legend('biaozhun1','biaozhun2'); 
end 
end

for i=1:3          
subplot(3,3,i+3);
p1 = plot(b(:,(2*i-1)),'r');
hold on;
p2 = plot(b(:,(2*i)),'g');
grid on;  
xlabel('pm3_2','Interpreter','none');
if(i<3)
 legend('test1','test2');
else
 legend('biaozhun1','biaozhun2'); 
end 
end

for i=1:3          
subplot(3,3,i+6);
p1 = plot(c(:,(2*i-1)),'r');
hold on;
p2 = plot(c(:,(2*i)),'g');
grid on;  
xlabel('pm3_3','Interpreter','none');
if(i<3)
 legend('test1','test2');
else
 legend('biaozhun1','biaozhun2'); 
end 
end


