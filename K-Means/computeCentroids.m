function centroids = computeCentroids( X,idx,K )
%	��������
%   

n = size(X,2);          %ÿ�����ݵ�ά��
centroids = zeros(K,n); %����λ��

for i = 1:K   %����������
    centroids(i,:) = mean(X(idx==i,:),1); %����ÿ����������λ��,mean(A,1)���ص���A��ÿһ�е���λ��
end

end

