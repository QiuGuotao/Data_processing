a = ones(4000,6);
b = ones(4000,6);
c = ones(4000,6);%定义变量
pm3_1=dir('C:\Users\guota\OneDrive\桌面\Matlab\*.txt'); %根据文件夹中的文件格式，选择读取类型
pm3_2=dir('C:\Users\guota\OneDrive\桌面\Matlab\*.txt');
pm3_3=dir('C:\Users\guota\OneDrive\桌面\Matlab\*.txt');
n = length(pm3_1); %%文件多少
full_data1 = cell(n,1);%%生成n*1的元胞
full_data2 = cell(n,1);
full_data3 = cell(n,1);
for k=1:n
filename = ['C:\Users\guota\OneDrive\桌面\Matlab\',pm3_1(k).name];%%构造第k个文件的位置
full_data1{k} = importdata(filename);%%将文件夹中的文件每个作为一个元胞按行存储在元胞中
temp = cell2mat(full_data1(k,:));%从struct中读取文件返回矩阵形式，以便后续处理使用
temp = size(temp);
temp = temp(1,1);
a(1:temp,k) = cell2mat(full_data1(k,:));

filename = ['C:\Users\guota\OneDrive\桌面\Matlab\',pm3_2(k).name];%%构造第k个文件的位置
full_data2{k} = importdata(filename);%%将文件夹中的文件每个作为一个元胞按行存储在元胞中
temp = cell2mat(full_data2(k,:));%从struct中读取文件返回矩阵形式，以便后续处理使用
temp = size(temp);
temp = temp(1,1);
b(1:temp,k) = cell2mat(full_data2(k,:));

filename = ['C:\Users\guota\OneDrive\桌面\Matlab\',pm3_3(k).name];%%构造第k个文件的位置
full_data3{k} = importdata(filename);%%将文件夹中的文件每个作为一个元胞按行存储在元胞中
temp = cell2mat(full_data3(k,:));%从struct中读取文件返回矩阵形式，以便后续处理使用
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


