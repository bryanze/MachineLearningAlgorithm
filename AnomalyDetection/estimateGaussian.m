function [ mu sigma2 ] = estimateGaussian( X )
%	��������
%   �����ֵ�ͷ�����ﲻ��ʹ���������

%% ��ʼ������
[m n] = size(X);
mu = zeros(n,1);    %������
sigma2 = zeros(n,1);%������

%% �����ֵ�ͷ���

mu = mean(X,1)';            %ÿ�еľ�ֵ��ת��Ϊ������
sigma2 = ((m-1)*var(X)/m)'; %var(X)��ÿ�е��������������m-1����תΪ����

end

