function [ bestEpsilon,bestF1 ] = selectThreshold( yval,pval )
%	ѡ�����ŵ�epsilon������ʹF1Score���
%   

%% ��ʼ������
bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
step =  (max(pval) - min(pval)) / 1000;

%% ����

for epsilon = min(pval):step:max(pval)
    cvPrecision = pval<epsilon;
    tp = sum((cvPrecision == 1) & (yval == 1)); %true positive
    fp = sum((cvPrecision == 1) & (yval == 0)); %false positive
    fn = sum((cvPrecision == 0) & (yval == 1)); %false negative
    precision = tp/(tp+fp);
    recision = tp/(tp+fn);
    F1 = (2*precision*recision)/(precision+recision);   %����F1Score
    
    if F1 > bestF1
        bestF1 = F1;
        bestEpsilon = epsilon;
    end
end



end

