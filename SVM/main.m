%% ֧��������Support Vector Machines��SVM���������ļ�
%  ��Ϊ3���֣�
   %���Ժ˺���
   %��˹�˺���
   %��˹SVM���Զ�ѡ�����ŵ�C��sigma
%  �С�@�����ŵĵط�������Ҫ�޸�


%% Ԥ����
clear;close all;clc

%% ���Ժ˺���

%��ͼ��X=��x1,x2��
fprintf('���ӻ�����...');
load('data1.mat');
plotData(X,y);
fprintf('\n������ͣ���������������\n');
pause;

%����SVM
fprintf('\nѵ�� Linear SVM...\n');

C = 1;  %@������Ҫ�޸ģ�CԽ��marginԽ��
model = svmTrain(X,y,C,@linearKernel,1e-3,20);  %����SVM������������
plotBoundary(X,y,model,0);  % 0�������Ծ��߽߱�
fprintf('\n������ͣ���������������\n');
pause;

%% ��˹�˺���

%��ͼ��X=��x1,x2��
fprintf('���ӻ�����...');
load('data2.mat');
plotData(X,y);
fprintf('\n������ͣ���������������\n');
pause;

%��˹SVM
C = 1;  %@������Ҫ�޸ģ�CԽ����ϵ�Խ�ã�high variance
sigma = 0.1;    %@������Ҫ�޸ģ�sigmaԽС�����Խ��
model = svmTrain(X,y,C,@(x1,x2)gaussianKernel(x1,x2,sigma));
plotBoundary(X,y,model,1);  %1���������Ծ��߽߱�
fprintf('\n������ͣ���������������\n');
pause;


%% ��˹SVM���Զ�ѡ�����ŵ�C��sigma

%��ͼ��X=��x1,x2��
fprintf('���ӻ�����...');
load('data3.mat');
plotData(X,y);
fprintf('\n������ͣ���������������\n');
pause;

%ѡ�����ŵ�C��sigma
[C, sigma] = dataset3Params(X, y, Xval, yval);
model = svmTrain(X,y,C,@(x1,x2)gaussianKernel(x1,x2,sigma));
plotBoundary(X,y,model,1);  %1���������Ծ��߽߱�