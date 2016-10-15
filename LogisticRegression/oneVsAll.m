function [ all_theta ] = oneVsAll( X,y,num_labels,lambda )
%	ʹ���ݶ��½���������е�thetaֵ
%   �߼��ع���������ʵ��������0-1�������⣬
        %��ĳ������������е�����룬��������3����,����Ҫ����3��������
%% ��ʼ���������
m = size(X,1);  %��������
n = size(X,2);  %��������

all_theta = zeros(n+1,num_labels);  %theta���о��󣬹���num_labels�࣬������num_labels��
X = [ones(m,1),X];  %X����һ��1

%% �ݶ��½�����theta
class_y = zeros(m,num_labels);  %����y�������Ӧ��0-1����
for i = 1:num_labels    %�����������
    class_y(:,i)= y==i; %�����ǰy==i������Ϊ1������Ϊ0
end
%�����ǵ����ݶ��½����Ż�����
initial_theta = zeros(n+1,1);
options = optimset('GradObj','on','MaxIter',50);

for i = 1:num_labels
    [all_theta(:,i)] = fmincg(@(t)(costFunctionReg(t,X,class_y(:,i),lambda)),...
                        initial_theta,options);
end

all_theta = all_theta';

end

