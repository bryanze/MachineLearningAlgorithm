function [ theta ] = normalEquations( X,y )
%	���淽����⣬����������ʱ��һ��>10000���������Ǵ˷���

%% ��ʼ������
theta = zeros(size(X,2),1);

%% ����theta

theta = pinv(X'*X)*X'*y;

end

