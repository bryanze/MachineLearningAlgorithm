function centroids = kMeansInitCentroids( X,K )
%	���ѡȡK������X�еĵ���Ϊ��������
%   

centroids = zeros(K,size(X,2));

rand_idx = randperm(size(X,1)); %��m�����ݴ���
centroids = X(rand_idx(1:K),:); %ѡȡǰK��

end

