clc;
clear all;

   % 指定txt文件路径和文件名
fileID = fopen('C:\Users\guota\OneDrive\桌面\Matlab\A_corrosion\无线传输\test-wireless.txt');
    % 读取txt文件并将每行数据存储为一个字符串
data = textscan(fileID, '%s', 'Delimiter', '\n');

% 关闭txt文件
fclose(fileID);

% 提取数字部分并将其存储为一个数值数组
numeric_data = zeros(length(data{1}), 24);
for i = 1:length(data{1})
    % 使用正则表达式提取数字部分
    str = data{1}{i};
    numeric_str = regexp(str, '[-]?\d+[.]?\d*', 'match');
    % 将字符串转换为数值
    numeric_data(i, :) = str2double(numeric_str);
end

x = [];
y = [];
last_value = numeric_data(1,3);

for i = 2:length(numeric_data)  % 从第二行开始读取一行数据
    % 读取新数据并计算差值
    new_value = numeric_data(i,3); %通道3的值
    diff = (new_value - last_value) / new_value;
    
    mass_loss = 80*diff;
    
    
    
    % 将新数据和计算得到的差值存储到变量中
    x = [x new_value];
    y = [y mass_loss];

    % 绘制数据曲线
   plot(mass_loss, 'LineWidth', 2, 'DisplayName', '通道0');
%    hold on;
%    plot(x, numeric_data(:,6), 'LineWidth', 2, 'DisplayName', '通道1');
%     plot(x, numeric_data(:,9),  'LineWidth', 2, 'DisplayName', '通道2');
%      plot(x, numeric_data(:,12),  'LineWidth', 2, 'DisplayName', '通道3');
%       plot(x, numeric_data(:,15),  'LineWidth', 2, 'DisplayName', '通道4');
%          plot(x, numeric_data(:,18),  'LineWidth', 2, 'DisplayName', '通道5');
%             plot(x, numeric_data(:,21),  'LineWidth', 2, 'DisplayName', '通道6');
%                plot(x, numeric_data(:,24), 'LineWidth', 2, 'DisplayName', '通道7');
%    hold off;
   % 添加图例
   legend('Location', 'best');
    drawnow;
% 设置绘图参数
figure;
xlabel('Time');
ylabel('Rust_layer_thickness');
title('XX_XXsensor');
grid on;
end
