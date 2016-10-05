function [ J,grad ] = costFunctionReg( theta,X,y,lambda )
%	����ۺ���J�ʹ��ݹ�����theta��Ӧ���ݶ�

%% ��ʼ������
m = length(y);
J = 0;
grad = zeros(size(theta));

%% ��������ֵ
h = sigmoid(X*theta);   %�����Ӧ��S�κ���ֵ
theta1 = theta;
theta1(1) = 0; %������Ϊ���򻯷����в�����theta(1),���Ը���һ��theta,����ʹ�ø��Ƶ�theta1

%% ����ۺ���J���ݶ�

J = (-y'*log(h)-(1-y)'*log(1-h)+theta1'*theta1*lambda/2)/m; %���ݹ�ʽ�ó���������Ϳ��Խ�yת�ã��ɼ�������ۼӺͣ�

grad = X'*(h-y)/m+lambda/m*theta1;  %���ݹ�ʽ�ó�


end

