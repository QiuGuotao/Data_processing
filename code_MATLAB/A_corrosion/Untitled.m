clc;
clear all;
   % 指定txt文件路径和文件名
fileID = fopen('C:\Users\guota\OneDrive\桌面\Matlab\A_corrosion\无线传输\5_31.txt');
    % 读取txt文件并将每行数据存储为一个字符串
data = textscan(fileID, '%s', 'Delimiter', '\n');

% 关闭txt文件
fclose(fileID);

% 提取数字部分并将其存储为一个数值数组
numeric_data = zeros(length(data{1}), 24);
for i = 1:1000
    % 使用正则表达式提取数字部分
    str = data{1}{i};
    numeric_str = regexp(str, '[-]?\d+[.]?\d*', 'match');
    % 将字符串转换为数值
    numeric_data(i, :) = str2double(numeric_str);
end

last_value = numeric_data(1,3);

for i = 2:1000  % 从第二行开始读取一行数据
    % 读取新数据并计算差值
    new_value(:,i-1) = numeric_data(i,3); %通道3的值
    diff = 100*(new_value(:,i-1) - last_value) / new_value(:,i-1);
    
    mass_loss(:,i-1) = 80*diff;
    
    % 绘制数据曲线

 
   plot(1:i-1,new_value, 'LineWidth', 2, 'DisplayName', '通道0');   
   xlabel('Time');
ylabel('Magnetic signal(Gs)');
title('Magnetic signal');
   ylim([427.0 427.6]);
   drawnow;
end
