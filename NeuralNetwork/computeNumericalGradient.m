function [ numgrad ] = computeNumericalGradient( J,theta )
%	���ؼ�����ݶ�
%   

%% ��ʼ������
numgrad = zeros(size(theta));   % ���
step = zeros(size(theta));      % 
e = 1e-4;   % ����

%% �����ݶ�
for i = 1:numel(theta)
    step(i) = e;    %��Ӧλ����Ϊ����
    loss1 = J(theta-step);  %������theta����᷵�ش���
    loss2 = J(theta+step);
    numgrad(i) = (loss2-loss1)/(2*e);   % �ݶȶ���
    step(i)=0;  %��ǰλ������Ϊ0
end

end

