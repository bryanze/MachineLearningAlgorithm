function Z = projectData( X,U,K )
%	ͶӰ�������Ϻ���
%   

Z = zeros(size(X, 1), K);

U_reduce = U(:,1:K);    %ѡȡǰK������
Z = X*U_reduce;         %����ͶӰ���Z����

end

