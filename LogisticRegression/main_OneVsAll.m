%% �ļ�˵��
%   �߼��ع�Ķ��������
%   ʶ����д����0-9
%   data_OneVsAll.mat�Ǵ���õ�20*20���ص��5000������

%% Ԥ����
clear;close all;clc;

input_layer_size = 400;
num_labels = 10;

%% ��������
fprintf('����������...\n');
load('data_OneVsAll.mat');
m = size(X,1);

%% ���ȡ�������ݽ�ͼ����ֳ���
rand_indices = randperm(m);
imgData = X(rand_indices(1:100),:);

displayData_OneVsAll(imgData);

