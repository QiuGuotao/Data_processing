% 设置绘图参数
figure;
xlabel('时间');
ylabel('磁感应信号（Gs）');
title('XX_XX传感器');
grid on;

while true
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
    
    % 绘制数据曲线
   x = 1:length(data{1});
   plot(x,numeric_data(:,3), 'LineWidth', 2, 'DisplayName', '通道0');
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
    
    % 暂停2秒钟
    pause(2);
end
