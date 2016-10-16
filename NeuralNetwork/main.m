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

initial_nn_params = [initial_Theta1(:),initial_Theta2(:)];  %չ��theta

%% �ݶȼ��

