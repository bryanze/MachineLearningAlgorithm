%% K-Mean�㷨�����г���

%   �С�@���ַ���λ�ø�����Ҫ�޸�

%% Ԥ����
clear;close all;clc
load('data.mat');

%% �������������ĸ�������¼����ࣨ������

% ����ÿ�����������ĸ���
K = 3;  %���������@
initial_centroids = [3 3;6 2;8 5];  %��ʼ�������  @
idx = findClosestCentroids(X,initial_centroids);    %��������X�ֱ������ĸ���

fprintf('ǰ�����������ݵ���: \n')
fprintf(' %d', idx(1:3));

fprintf('\nÿ�����������ĸ��������ϣ��������������\n');
pause;

% ���¼�������

centroids = computeCentroids(X,idx,K);
fprintf('\n���¼�������Ϊ��\n');
fprintf(' %f %f \n' , centroids');

fprintf('���¼������Ľ�����ϣ��������������\n');
pause;

%% K-Means���������ʾ���������㣩

fprintf('\n�ڲ�������������K-Means�����㷨...\n');
load('data.mat');

K = 3;
max_iters = 10;
initial_centroids = [3 3; 6 2; 8 5];
[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);
fprintf('\nK-Means���н������������������\n');
pause;

%% K-Means����ͼƬ�����ص�

fprintf('\nK-Mean����ѹ��ͼƬ...\n');
A = double(imread('bird.png')); %��ȡͼƬ
A = A/255;  %����ֵ��Լ����0-1֮��

img_size = size(A); %A��һ����ά����,ǰ��άΪ���ص�λ�ã�����άΪrgbֵ

X = reshape(A,img_size(1)*img_size(2),3);  %����ΪN*3�ľ���N���������ص����

K = 16;     %��������ɫ��Ϊ16�࣬���ʹ����16����ɫ��ʾ���ͼ��  @
max_iters = 10; %��������10��  @
initial_centroids = kMeansInitCentroids(X, K);  %��ʼ��������
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);  %����K-Mean�����㷨

fprintf('\nK-Means���н������������������\n');
pause;

%% ѹ��ͼƬ
fprintf('\nʹ��K-Means�㷨ѹ��ͼƬ...\n');

idx = findClosestCentroids(X, centroids);   % ÿ�����ص���ɫ�����ĸ���
X_recovered = centroids(idx,:);             % ʹ���Ǹ��������ص��ʾ
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);    %�ָ�ͼ�����

% ��ʾ�����ͼƬ
subplot(1, 2, 1);
imagesc(A);         %��ʾͼ��
title('ԭͼ��');

% ��ʾѹ�����ͼƬ
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('ѹ��ͼ�� %d ����ɫ��ʾ.', K));



