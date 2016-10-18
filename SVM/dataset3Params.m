function [ C,sigma ] = dataset3Params( X,y,Xval,yval )
%	ѡ��error��С��C��sigmaֵ
%   X,yΪѵ����
%   Xval,yvalΪ������֤��

Ctest = [0.01 0.03 0.1 0.3 1 3 10 30];  % @���ܵ�Cֵ
sigmatest = [0.01 0.03 0.1 0.3 1 3 10 30];% @���ܵ�sigmaֵ
errors = zeros(size(Ctest,2), size(sigmatest,2));   %��¼������֤���Ĵ�����

for i=1:size(Ctest,2)   %����ÿ��C
    for j=1:size(sigmatest,2)   %����ÿ��sigma
        model= svmTrain(X, y, Ctest(i), @(x1, x2) gaussianKernel(x1, x2, sigmatest(j))); 
        predictions = svmPredict(model, Xval);  %������֤��Ԥ��
        errors(i,j) = mean(double(predictions ~= yval));    %�󽻲���֤���Ĵ�����
        clear model;
        clear predictions;
    end
end

[dummy,ind] = min(errors(:));
[i,j] = ind2sub([size(errors,1) size(errors,2)],ind);   %���ش��������ȵ�����
C = Ctest(i);
sigma = sigmatest(j);

end

