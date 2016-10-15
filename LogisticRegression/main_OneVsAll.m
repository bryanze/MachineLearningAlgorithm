%% �ļ�˵��
%   �߼��ع�Ķ��������
%   ʶ����д����0-9
%   data_OneVsAll.mat�Ǵ���õ�20*20���ص��5000������
%   ���Ҫ��ʹ�ô˳���������Լ�����Ҫ�޸��С�@��ע�͵Ĵ���

%% Ԥ����
clear;close all;clc;

input_layer_size = 400;
num_labels = 10;

%% ��������
fprintf('����������...\n');
load('data_OneVsAll.mat');  %   @�޸��ļ���
m = size(X,1);  %����������¼��

%% ���ȡ�������ݽ�ͼ����ֳ���
rand_indices = randperm(m);         %��1-m֮���������
imgData = X(rand_indices(1:100),:); %ȡǰ100������     @������Ҫ�޸�

displayData_OneVsAll(imgData);      %������ʾ���ݺ���

fprintf('������ͣ�������������\n');
pause;

%% ���������߼��ع�ģ��
fprintf('\n�������߼��ع鿪ʼ...\n');

lambda = 0.1;   %�������򻯵Ĳ���   @������Ҫ����
[all_theta] = oneVsAll(X,y,num_labels,lambda);

fprintf('\n������߼��ع��������������������.\n');
pause;

%% ѵ������Ԥ�⾫׼��
pred = predict_OneVsAll(all_theta,X);
fprintf('\nѵ���õ��ľ�׼�Ȱٷֱ�Ϊ��%f\n',mean(double(pred == y))*100);

fprintf('������ͣ�������������\n');
pause;
%% �����µ�����Ԥ�⣨���ﻹ��ʹ��ѵ�����е�������ʾ��
for i = 1:m
    fprintf('\n��ʾͼƬ\n');
    displayData_OneVsAll(X(i, :));  %��ʾͼƬ

    pred = predict_OneVsAll(all_theta,X(i,:));  %Ԥ��
    fprintf('\nԤ��ֵΪ: %d (Ԥ���Ӧ����ʵֵΪ %d)\n', pred, mod(pred, 10)); %��ʵֵ10ӳ�䵽0����������
    
    % Pause
    fprintf('������ͣ�������������\n');
    pause;
end
