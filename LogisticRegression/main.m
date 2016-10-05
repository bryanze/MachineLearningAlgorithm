%% �߼��ع��㷨���ļ�
%   ʹ������(regularization)����
%   ֻ����������x1,x2
%   �ļ�˵������@���ŵĵط���Ҫ�����Լ�����Ҫ�����޸�

clear;close all;clc;

%% ��������
data = load('data2.txt');   %��������  @�޸��ļ���
cols = size(data,2);
X = data(:,1:cols-1);
y = data(:,cols);

%% ��ͼ
plotData(X,y);  %����plotData������ͼ

hold on;
xlabel('X1');
ylabel('X2');

legend('y = 1','y = 0');
hold off;

%% ���򻯵��߼��ع�׼��������1��ӳ�����ʽ 2���������J���ݶȵĺ�����

X = mapFeature(X(:,1),X(:,2));      %��xӳ��Ϊ����ʽ��ʽ�����ض���ʽ��Ӧ������   @�ؼ�����������Ҫ�Ķ���ʽ������������ߴ�Ϊ2�η�

initial_theta = zeros(size(X,2),1); %��ʼ��theta�����Ӧ����ʽ����һ��
lambda = 1;                         %�������򻯲���Ϊ1    @������Ҫ����

[cost,grad] = costFunctionReg(initial_theta,X,y,lambda);    %�����ʼthetaΪ0�Ĵ��ۺ���J�Ͷ�Ӧ���ݶ�

%���һ��
fprintf('��ֵthetaΪ0�Ĵ���JΪ��%f\n',cost);

fprintf('������ͣ���������������\n');
pause;

%% ���򻯵��߼��ع�(�����ݶ��½����Ż�����fminunc)

initial_theta = zeros(size(X,2),1); %��ʼ��theta�����Ӧ����ʽ����һ��
lambda = 1;                         %�������򻯲���Ϊ1    @������Ҫ����
options = optimset('GradObj', 'on', 'MaxIter', 400);   %����matlab���ݶ��½����Ż���������Ӧ�Ĳ�������
[theta, J, exit_flag] = fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

%% �����߽߱磨decision boundary��

plotDecisionBoundary(theta,X,y);    %���û����߽߱�ĺ���    @��Ҫ���޸ĺ���������

hold on;
title(sprintf('lambda = %g',lambda));
xlabel('X1');
ylabel('X2');
legend('y = 1','y = 0','���߽߱�');
hold off;

%% ����ѵ�����ж�Ԥ�⾫׼��
p = predict(theta,X);       %����Ԥ��ĺ���������ѵ�����ٸ��ݼ��躯��Ԥ��

fprintf('ѵ����׼��Ϊ(�ٷֱ�)��%f\n',mean(double(p == y))*100);   %����Ԥ����ȷ�İٷֱ�






