function p = predict( theta,X )
%	��������XԤ��
%   ���ݼ��躯��h����sigmoid������Ԥ�⣬����0.5��y��Ϊ1��С��0.5��y��Ϊ0

%% ��ʼ������
m = size(X,1);
p = zeros(m,1);

%% Ԥ��
p = sigmoid(X*theta); % ���ݼ��躯���������

for i = 1:m  %�����ж�
    if p(i)>0.5
        p(i)=1;
    else
        p(i)=0;
    end
end

end

