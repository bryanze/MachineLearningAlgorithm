function g = sigmoid( z )
%	S�κ���
%   ���ݹ���z,���Ӧ�ļ��躯��h��ֵ

%% ��ʼ������
g = zeros(size(z));

%% ��s�κ���
g = 1./(1+exp(-z));

end

