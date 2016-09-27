%% �ļ�˵������@���ŵĵط���Ҫ�����Լ�����Ҫ�����޸�



clear; close all;clc

%% �����ļ�����
fprintf('���������� ...\n');
data = load('data.txt');        % @���ļ���
cols = size(data,2);

X = data(:,1:cols-1);
y = data(:,cols);
m = length(y);  %��������������������

%% ��ӡһЩ���ݣ������Ƿ���سɹ�
fprintf('X����ǰ10�к�ǰ2�����ݣ��Լ�yǰ10������Ϊ��\n');
fprintf(' x = [%f %f], y = %f \n', [X(1:10,:) y(1:10,:)]'); % @��X�����������������Զ��ӡ�鿴 
fprintf('������ͣ�������������ִ�У�\n');
pause;

%% ����X�����е�ֵ����һ����
[X mu sigma] = featureNormalize(X);%ע�⣬�����X��Ӧ���������X_norm

%% X�ĵ�һ���������һ��
X = [ones(m,1) X];

%% �ݶ��½��㷨
fprintf('ִ���ݶ��½��㷨 ...\n');

alpha = 0.01;       % @ ѧϰ�ٶȣ���Ҫ���Ըı䣬һ��Ϊ0.01,0.03,0.1,0.3 ....
num_iters = 400;    % @ ���������������Ըı�

theta = zeros(cols,1);
[theta,J_history] = gradientDescent(X,y,theta,alpha,num_iters);

%% �����ۺ���J����������仯��ͼ
figure;
plot(1:numel(J_history),J_history,'-b','LineWidth',2);
xlabel('��������');
ylabel('���ۺ���J��ֵ');

%% ��ӡ�ݶ��½�����Ľ��theta
fprintf('\n�ݶ��½��㷨����õ���thetaֵΪ')
fprintf(' %f \n',theta);



%% ѧϰ��ϣ���⵽theta,��������Ԥ�⣨��ס��Ҫ��һ��**��
result = 0;

predict1 = [1650 3];     % @ ��ҪԤ�����Ϣ����֪��X����
norm_predict = (predict1-mu)./sigma;    %��һ��
final_predict=[1 norm_predict];         %�ڵ�һ��ǰ��1

result = final_predict*theta;           %������
fprintf('\n�ݶ��½��㷨Ԥ��ֵΪ��%f', result);

fprintf('\n������ͣ�������������ִ�У�\n');
pause;

%% ���淽�����theta�����������ǳ���ʱ��ֻ���ݶ��½��㷨��

%% �����ļ�����
fprintf('���������� ...\n');
data = load('data.txt');
cols = size(data,2);

X = data(:,1:cols-1);
y = data(:,cols);
m = length(y);  %��������������������
X = [ones(m,1) X];

%% ���theta
theta = normalEquations(X,y);

fprintf('\n���淽�̼���õ���thetaֵΪ\n')
fprintf(' %f \n',theta);

%% ѧϰ��ϣ���⵽theta,��������Ԥ�⣨����Ҫ��һ��**��
result = 0;

predict2 = [1 1650 3];     % @ ��ҪԤ������ݣ���֪��X����

result = predict2*theta;   %������
fprintf('\n���淽�����Ԥ��ֵΪ��%f\n', result);
