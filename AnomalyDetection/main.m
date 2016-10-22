%% �쳣���������
%   ��˹�ֲ�

%% Ԥ����
clear;close all;clc
load('data1.mat');

%% ͼ����ʾ����ά���ݣ�
figure();
plot(X(:,1),X(:,2),'bx');
axis([0 30 0 30]);      %@
xlabel('X1');
ylabel('X2');

fprintf('\n������ͣ���������������\n');
pause;

%% �������ƣ���ֵ�ͷ��

[mu sigma2] = estimateGaussian(X);

%% ��Ԫ��˹�ֲ�����
p = multivariateGaussian(X,mu,sigma2);

%% ���ӻ���ϵı߽�
visualizeFit(X,mu,sigma2);

fprintf('\n������ͣ���������������\n');
pause;

%% ѡ���쳣�㣨�ڽ�����֤��CV��ѵ���õ���õ�epsilon��

pval = multivariateGaussian(Xval,mu,sigma2);    %����CV�ϵĸ����ܶ�ֵ
[epsilon F1] = selectThreshold(yval,pval);      %ѡ�����ŵ�epsilon�ٽ�ֵ

fprintf('\n��CV�ϵõ�����õ�epsilon�ǣ�%e\n',epsilon);
fprintf('\n��Ӧ��F1ScoreֵΪ��%f\n',F1);
fprintf('\n��epsilon��ֵӦ��Ϊ��8.99e-05��\n');

outliers = find(p < epsilon);

hold on
plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
hold off












