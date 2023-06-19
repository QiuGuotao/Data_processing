clc;
clear all;
   % ָ��txt�ļ�·�����ļ���
fileID = fopen('C:\Users\guota\OneDrive\����\Matlab\A_corrosion\���ߴ���\test-wireless.txt');
    % ��ȡtxt�ļ�����ÿ�����ݴ洢Ϊһ���ַ���
data = textscan(fileID, '%s', 'Delimiter', '\n');

% �ر�txt�ļ�
fclose(fileID);

% ��ȡ���ֲ��ֲ�����洢Ϊһ����ֵ����
numeric_data = zeros(length(data{1}), 24);
for i = 1:length(data{1})
    % ʹ��������ʽ��ȡ���ֲ���
    str = data{1}{i};
    numeric_str = regexp(str, '[-]?\d+[.]?\d*', 'match');
    % ���ַ���ת��Ϊ��ֵ
    numeric_data(i, :) = str2double(numeric_str);
end

x = [];
y = [];
last_value = numeric_data(1,3);

for i = 2:length(numeric_data)  % �ӵڶ��п�ʼ��ȡһ������
    % ��ȡ�����ݲ������ֵ
    new_value = numeric_data(i,3); %ͨ��3��ֵ
    diff = 100*(new_value - last_value) / new_value;
    
    mass_loss(:,i) = 80*diff;
    
    % �������ݺͼ���õ��Ĳ�ֵ�洢��������
    x = [x new_value];
    y = [y mass_loss];
% ���û�ͼ����
figure;
xlabel('Time');
ylabel('Rust_layer_thickness(um)');
title('XX_XXsensor');
grid on;
    % ������������
   plot(1:i,mass_loss, 'LineWidth', 2, 'DisplayName', 'ͨ��0');
    drawnow;
  
end
