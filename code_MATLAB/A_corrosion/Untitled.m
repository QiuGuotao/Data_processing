clc;
clear all;
   % ָ��txt�ļ�·�����ļ���
fileID = fopen('C:\Users\guota\OneDrive\����\Matlab\A_corrosion\���ߴ���\5_31.txt');
    % ��ȡtxt�ļ�����ÿ�����ݴ洢Ϊһ���ַ���
data = textscan(fileID, '%s', 'Delimiter', '\n');

% �ر�txt�ļ�
fclose(fileID);

% ��ȡ���ֲ��ֲ�����洢Ϊһ����ֵ����
numeric_data = zeros(length(data{1}), 24);
for i = 1:1000
    % ʹ��������ʽ��ȡ���ֲ���
    str = data{1}{i};
    numeric_str = regexp(str, '[-]?\d+[.]?\d*', 'match');
    % ���ַ���ת��Ϊ��ֵ
    numeric_data(i, :) = str2double(numeric_str);
end

last_value = numeric_data(1,3);

for i = 2:1000  % �ӵڶ��п�ʼ��ȡһ������
    % ��ȡ�����ݲ������ֵ
    new_value(:,i-1) = numeric_data(i,3); %ͨ��3��ֵ
    diff = 100*(new_value(:,i-1) - last_value) / new_value(:,i-1);
    
    mass_loss(:,i-1) = 80*diff;
    
    % ������������

 
   plot(1:i-1,new_value, 'LineWidth', 2, 'DisplayName', 'ͨ��0');   
   xlabel('Time');
ylabel('Magnetic signal(Gs)');
title('Magnetic signal');
   ylim([427.0 427.6]);
   drawnow;
end
