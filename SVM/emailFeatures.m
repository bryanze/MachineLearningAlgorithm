function features = emailFeatures( word_indices )
%	����word_indices������������
%   �˴���ʾ��ϸ˵��

n = 1899;   %�ֵ�����������@

features = zeros(n,1);

for i=1:size(word_indices,1)
    features(word_indices(i)) = 1;
end


end

