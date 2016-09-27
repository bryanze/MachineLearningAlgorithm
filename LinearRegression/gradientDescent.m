function [ theta,J_history ] = gradientDescent( X,y,theta,alpha,num_iters )
%   �ݶ��½��㷨����������
%   ע������ֻ�ǹ���x��һ�η��������h=theta(0)+theta(1)x1+theta(2)x2+...����������޸�

%% ��ʼ������
m = length(y);
n= length(theta);
temp = zeros(n,num_iters);
J_history = zeros(num_iters,1);

%% ��������
for iter = 1:num_iters
    h = X*theta;
    temp(:,iter) = theta - ((alpha/m)*(X'*(h-y)));
    theta = temp(:,iter);
    
    J_history(iter) = computerCost(X,y,theta);
end

