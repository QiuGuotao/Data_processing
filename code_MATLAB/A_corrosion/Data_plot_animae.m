% ���û�ͼ����
figure;
xlabel('ʱ��');
ylabel('�Ÿ�Ӧ�źţ�Gs��');
title('XX_XX������');
grid on;

while true
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
    
    % ������������
   x = 1:length(data{1});
   plot(x,numeric_data(:,3), 'LineWidth', 2, 'DisplayName', 'ͨ��0');
%    hold on;
%    plot(x, numeric_data(:,6), 'LineWidth', 2, 'DisplayName', 'ͨ��1');
%     plot(x, numeric_data(:,9),  'LineWidth', 2, 'DisplayName', 'ͨ��2');
%      plot(x, numeric_data(:,12),  'LineWidth', 2, 'DisplayName', 'ͨ��3');
%       plot(x, numeric_data(:,15),  'LineWidth', 2, 'DisplayName', 'ͨ��4');
%          plot(x, numeric_data(:,18),  'LineWidth', 2, 'DisplayName', 'ͨ��5');
%             plot(x, numeric_data(:,21),  'LineWidth', 2, 'DisplayName', 'ͨ��6');
%                plot(x, numeric_data(:,24), 'LineWidth', 2, 'DisplayName', 'ͨ��7');
%    hold off;
   % ���ͼ��
   legend('Location', 'best');
    drawnow;
    
    % ��ͣ2����
    pause(2);
end
