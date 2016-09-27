function [ X_norm mu sigma ] = featureNormalize( X )

%% ��ʼ���������
X_norm = X;
mu = zeros(1,size(X,2));    %Xÿ����λ����1�У�X��Ӧ����
sigma = zeros(1,size(X,2)); %Xÿ�б�׼�1�У�X��Ӧ����

%% ��һ��X
mu = mean(X_norm);  %��ÿ�е�ƽ����
sigma = std(X_norm);%��ÿ�еı�׼��
for i=1:size(X,2)   %����X����
    X_norm(:,i) = (X_norm(:,i)-mu(i))./sigma(i);    %��i��ÿ�е����ݶ�Ӧ��һ��
end

end

