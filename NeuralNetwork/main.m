%%  BP神经网络主程序
%   功能识别手写数字0-9
%   注释中有“@”符号的需要根据自己的需要修改

%%  预处理
clear;close all;clc

input_layer_size = 400; %20x20像素数据输入    @根据需要修改
hidden_layer_size = 25; %25个单元  @根据需要修改
num_labels = 10;        %类别个数  @根据需要修改


%% 加载数据
fprintf('加载数据...\n');
load('data.mat');
m = size(X,1);

%% 显示部分数据，画图
sel = randperm(m);              %将m个数打乱
displayData(X(sel(1:100),:));   %显示100条数据

fprintf('\n程序暂停，按任意键继续\n');
pause;

%% 加载已经保存的参数，这里是Theta1,Theta2
fprintf('\n加载已经保存的数据\n');
load('weights.mat');
nn_params = [Theta1(:);Theta2(:)];    %将Theta1,Theta2转为列向量

%% 计算代价（正则化，以及梯度）
lambda = 1;

J = nnCostFunction(nn_params,input_layer_size,hidden_layer_size,...
                    num_labels,X,y,lambda);

fprintf(['\n使用weight.mat中的参数计算出的J为：%f'...
        '\n(值应该为为0.383770)\n'],J);
    
fprintf('\n程序暂停，按任意键继续\n');
pause;

%% 初始化参数theta
fprintf('\n初始化参数theta...\n');

initial_Theta1 = randInitializeWeights(input_layer_size,hidden_layer_size); 
initial_Theta2 = randInitializeWeights(hidden_layer_size,num_labels);

initial_nn_params = [initial_Theta1(:),initial_Theta2(:)];  %展开theta

%% 梯度检查

