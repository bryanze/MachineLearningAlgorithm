function J = computerCost( X,y,theta )
%	������ۺ��������ֵ
%   ע������ֻ�ǹ���x��һ�η��������h=theta(0)+theta(1)x1+theta(2)x2+...����������޸�

%% ��ʼ������
m = length(y);
J = 0;

%% �������
J = (X*theta-y)'*(X*theta-y)/(2*m);

end

