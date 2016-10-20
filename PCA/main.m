%% ���ɷַ���PCA��ά����������

%  �С�@�����ŵ�λ�ø�����Ҫ�޸�


%% Ԥ����
clear;close all;clc

%% ��ά��һά

% ��ʾ����
fprintf('���ӻ���ά����\n');
load('data1.mat');
plot(X(:, 1), X(:, 2), 'bo');
axis([0.5 6.5 2 8]); 
axis square;
fprintf('\n������ͣ�������������\n');
pause;
% PCA
fprintf('\n����PCA...\n');

[X_norm,mu,sigma] = featureNormalize(X);    %��һ������

[U S] = pca(X_norm);    %����pca�㷨

hold on;
drawLine(mu, mu + 1.5 * S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
drawLine(mu, mu + 1.5 * S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
hold off;
fprintf('\n������ͣ�������������\n');
pause;
% ��ά
fprintf('\n��ά��ʼ...\n');

plot(X_norm(:, 1), X_norm(:, 2), 'bo');
axis([-4 3 -4 3]); axis square

K = 1;
Z = projectData(X_norm, U, K);
fprintf('��һ�����ݵ�ӳ��ֵΪ: %f\n', Z(1));
fprintf('\n(��ʵֵӦ��Ϊ -1.481274)\n\n');

% �ָ���ԭά������
X_rec  = recoverData(Z, U, K);
fprintf('\n�ָ���Ľ���ֵΪ: %f %f\n', X_rec(1, 1), X_rec(1, 2));
fprintf('\n(����Ľ��Ӧ��Ϊ��  -1.047419 -1.047419)\n\n');

% ��ͼ��ԭ���ݺ�ͶӰ������ݣ�
hold on;
plot(X_rec(:, 1), X_rec(:, 2), 'ro');
for i = 1:size(X_norm, 1)
    drawLine(X_norm(i,:), X_rec(i,:), '--k', 'LineWidth', 1);
end
hold off

fprintf('\n������ͣ�������������\n');
pause;

%% faceͼ�����ݽ�ά

fprintf('\nLoading face dataset.\n\n');

load ('data_faces.mat')

%  ��ʾ100������
displayData(X(1:100, :));

fprintf('\n������ͣ�������������\n');
pause;

%% =========== Part 5: PCA on Face Data: Eigenfaces  ===================
%  Run PCA and visualize the eigenvectors which are in this case eigenfaces
%  We display the first 36 eigenfaces.
%
fprintf(['\n���� PCA \n' ...
         '(��ȴ� ...)\n\n']);
[X_norm, mu, sigma] = featureNormalize(X);  %��һ������

%  PCA
[U, S] = pca(X_norm);
displayData(U(:, 1:36)');   %��ʾ36������
fprintf('\n������ͣ�������������\n');
pause;


%% ============= Part 6: Dimension Reduction for Faces =================
%  Project images to the eigen space using the top k eigenvectors 
%  If you are applying a machine learning algorithm 
fprintf('\n��face���ݽ�ά.\n\n');

K = 100;
Z = projectData(X_norm, U, K);

fprintf('ͶӰ���Z������СΪ: ')
fprintf('%d ', size(Z));

fprintf('\n������ͣ�������������\n');
pause;

%% ��ʾ��ά���face

fprintf('\n��ʾ��ά���face.\n\n');

K = 100;
X_rec  = recoverData(Z, U, K);  %�ָ�����

% ��ʾԭ�ȵ�faces
subplot(1, 2, 1);
displayData(X_norm(1:100,:));
title('ԭ�ȵ�faces');
axis square;

% ��ʾ��ά���ٻָ���faces
subplot(1, 2, 2);
displayData(X_rec(1:100,:));
title('�ָ����faces');
axis square;

