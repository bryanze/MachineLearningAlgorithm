function [ p ] = predict_OneVsAll( all_theta,X )
%	Ԥ��
%   �˴���ʾ��ϸ˵��

%% ��ʼ���������
m = size(X,1);
num_labels = size(all_theta,1);
p = zeros(size(X,1),1);
X = [ones(m,1),X];

h = sigmoid(X*all_theta');  %Ԥ��
[prob p] = max(h,[],2);     %����ÿ�е����ֵ�����ڵ��кţ������ĸ���ֵ�����ڵ��кţ��кŶ�Ӧ�ľ�������Ԥ��ֵ

end

