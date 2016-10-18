%% ʹ��֮ǰ�߼��ع��е�����ʹ��SVMԤ��

data = load('data.txt');
X = data(:,(1:2));
y = data(:,3);

%% ��˹SVM
%��ͼ��X=��x1,x2��
fprintf('���ӻ�����...');
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