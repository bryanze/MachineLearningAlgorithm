function J = computerCost( X,y,theta )
%	������ۺ��������ֵ

%% ��ʼ������
m = length(y);
J = 0;

%% �������
J = (X*theta-y)'*(X*theta-y)/(2*m);

end

