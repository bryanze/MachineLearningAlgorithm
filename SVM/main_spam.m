%% �����ʼ�Ԥ�����ļ�
%   ʹ��SVM֧��������Ԥ��

%% Ԥ����
clear; close all;clc


%% �����ʼ�
fprintf('\n���������ʼ�(emailSample1.txt)...\n');

file_contents = readFile('emailSample1.txt');   %��ȡ�ʼ�����
word_indices  = processEmail(file_contents);    %�����ʼ����ݣ����ص��Ǵʳ��ֵ�λ�õ�������
%ӳ��������������С�ʻ���е��ʸ�������word_indices�е�λ��ֵΪ1������Ϊ0��
features      = emailFeatures(word_indices);    
fprintf('������ͣ���������������\n');
pause;

%% ѵ������SVM������
load('spamTrain.mat');
fprintf('\nѵ������SVM������...\n');

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);   %��������SVM
%ѵ����׼ȷ��
p = svmPredict(model, X);   %Ԥ��ѵ�����ϵ�����
fprintf('ѵ����Ԥ�⾫׼��Ϊ: %f\n', mean(double(p == y)) * 100);

%���Լ�׼ȷ��
load('spamTest.mat');

fprintf('\n���Լ�Ԥ�⾫׼��Ϊ...\n')

p = svmPredict(model, Xtest);

fprintf('������ͣ���������������\n');
pause;

%% ��ʾ��Щ������ܱ�ʾspam
[weight, idx] = sort(model.w, 'descend');   %����Ȩ�ؽ�������
vocabList = getVocabList();

fprintf('\nǰ15��Ԥ��Ϊspam�Ĵ�Ϊ: \n');
for i = 1:15
    fprintf(' %-15s (%f) \n', vocabList{idx(i)}, weight(i));
end

fprintf('\n\n');
fprintf('������ͣ���������������\n');
pause;

%% ����һ���ʼ���Ԥ���Ƿ�Ϊspam
filename = 'spamSample1.txt';   %�ļ��� @

file_contents = readFile(filename);
word_indices  = processEmail(file_contents);
x             = emailFeatures(word_indices);
p = svmPredict(model, x);   % Ԥ��

fprintf('\n����� %s\nԤ����Ϊ: %d\n', filename, p);
fprintf('(1 ��ʾ��spam, 0 ����spam)\n\n');
