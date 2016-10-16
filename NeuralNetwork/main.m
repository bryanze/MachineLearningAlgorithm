%%  BP������������
%   ����ʶ����д����0-9
%   ע�����С�@�����ŵ���Ҫ�����Լ�����Ҫ�޸�

%%  Ԥ����
clear;close all;clc

input_layer_size = 400; %20x20������������    @������Ҫ�޸�
hidden_layer_size = 25; %25����Ԫ  @������Ҫ�޸�
num_labels = 10;        %������  @������Ҫ�޸�


%% ��������
fprintf('��������...\n');
load('data.mat');
m = size(X,1);

%% ��ʾ�������ݣ���ͼ
sel = randperm(m);              %��m��������
displayData(X(sel(1:100),:));   %��ʾ100������

fprintf('\n������ͣ�������������\n');
pause;

%% �����Ѿ�����Ĳ�����������Theta1,Theta2
fprintf('\n�����Ѿ����������\n');
load('weights.mat');
nn_params = [Theta1(:);Theta2(:)];    %��Theta1,Theta2תΪ������

%% ������ۣ����򻯣��Լ��ݶȣ�
lambda = 1;

J = nnCostFunction(nn_params,input_layer_size,hidden_layer_size,...
                    num_labels,X,y,lambda);

fprintf(['\nʹ��weight.mat�еĲ����������JΪ��%f'...
        '\n(ֵӦ��ΪΪ0.383770)\n'],J);
    
fprintf('\n������ͣ�������������\n');
pause;

%% ��ʼ������theta
fprintf('\n��ʼ������theta...\n');

initial_Theta1 = randInitializeWeights(input_layer_size,hidden_layer_size); 
initial_Theta2 = randInitializeWeights(hidden_layer_size,num_labels);

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];  %չ��theta

%% �ݶȼ��(û�����򻯵�)

checkNNGradients;
fprintf('\n������ͣ�������������\n');
pause;


%% �ݶȼ��(���򻯵�)
lambda = 3;

checkNNGradients(lambda);

fprintf('\n������ͣ�������������\n');
pause;

%% ѵ��������
fprintf('\nѵ����������...\n')

%�����Ż����ݶ��½��㷨
options = optimset('MaxIter', 50);
lambda = 1;
% 
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
% ִ��fmincg                              
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% ���µ����õ���theta
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ���ӻ�Theta1
fprintf('\n���ӻ�Theta1\n');

displayData(Theta1(:,(2:end)));

fprintf('\n������ͣ�������������\n');
pause;

%% ����Ԥ�⾫׼��
pred = predict(Theta1,Theta2,X);

fprintf('\nѵ�����еľ�׼��Ϊ��%f\n',mean(double(pred==y))*100);


