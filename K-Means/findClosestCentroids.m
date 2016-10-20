function idx = findClosestCentroids( X,initial_centroids )
%	��ÿ��X�е����ݣ����������ĸ����K
%   

m = size(X,1);                  %��������
K = size(initial_centroids,1);  %�������
idx = zeros(m,1);               %Ҫ���ص�ÿ�����������ĸ���

for i = 1:m        %����ÿ������
    for j = 1:K    %����ÿ��������
        idx(i,j) = (X(i,:)-initial_centroids(j,:))*(X(i,:)-initial_centroids(j,:))';    %����ÿ���㵽���ĵķ�����ƽ��
    end
end

[dummy idx] = min(idx,[],2);    %����ÿ����С���кţ��кžͶ�Ӧ���

end

