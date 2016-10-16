function [ J grad ] = nnCostFunction( nn_params,...
                                      input_layer_size,...
                                      hidden_layer_size,...
                                      num_labels,...
                                      X,y,lambda)
%	������ۺ�����ͬʱ�����ݶȣ��Ż����ݶ��½��㷨����Ҫ��
%   @��Ҫ����������Ľṹ�޸�

%% ��ʼ������
Theta1 = reshape(nn_params(1:hidden_layer_size*(input_layer_size+1)),...
                hidden_layer_size,(input_layer_size+1));    %���µ�����Theta1Ϊ��һ���Ӧ��theta����������25x401��
Theta2 = reshape(nn_params((1+(hidden_layer_size*(input_layer_size+1))):end),...
                num_labels,(hidden_layer_size+1));
m = size(X,1);
J = 0;  %����
Theta1_grad = zeros(size(Theta1));  %��һ���ݶȣ���Ϊƫ�����������Ϊһ����������
Theta2_grad = zeros(size(Theta2));  %�ڶ����ݶȣ���Ϊƫ����

%% ����һЩ��Ҫ�ı���

class_y = zeros(m,num_labels);  %ӳ��y����Ҫ������Jʹ��
for i = 1:num_labels
    class_y(:,i) = y==i;
end

Theta1_x = Theta1(:,(2:end));   %ȥ����һ�У���Ϊ���򻯲�����theta(0)
Theta2_x = Theta2(:,(2:end));
regterm = [Theta1_x(:);Theta2_x(:)]'*[Theta1_x(:);Theta2_x(:)];

%% ���򴫲�
a1 = [ones(m,1),X]; %��һ����������
z2 = a1*Theta1';
a2 = sigmoid(z2);   %�ڶ���
a2 = [ones(m,1),a2];
z3 = a2*Theta2';
h = sigmoid(z3);    %�����㣬�����

%% ���򴫲�
for i = 1:m
    delta3(i,:) = h(i,:)-class_y(i,:);              %���һ������(1x10)
    Theta2_grad = Theta2_grad+delta3(i,:)'*a2(i,:); %�ݶ�Ϊ��һ���delta(L+1)*��ǰ��a(L)
    delta2(i,:) = (delta3(i,:)*Theta2_x).*sigmoidGradient(z2(i,:));     %deltaΪ��һ���delta*��ǰ��theta*��g(z)�ĵ�����zΪ��ǰ��ģ�
    Theta1_grad = Theta1_grad+delta2(i,:)'*a1(i,:); 
end

%% �������򻯵Ĵ���J
J = -((class_y(:)'*(log(h(:))))+((1-class_y(:))'*(log(1-h(:))))-(lambda*regterm/2))/m;  %   ���򻯵�J

%% �������򻯵��ݶ�
Theta1(:,1) = 0;    %���򻯵�J�󵼺��1�����lambda�����Ը�ֵΪ0
Theta2(:,1) = 0;
grad = ([Theta1_grad(:) ; Theta2_grad(:)] + lambda*[Theta1(:); Theta2(:)])/m;   %���򻯵�grad

end

