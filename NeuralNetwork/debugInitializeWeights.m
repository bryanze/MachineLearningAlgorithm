function W = debugInitializeWeights( fan_out,fan_in )
%	�����õĳ�ʼ��weights�ĺ���
%   ʹ��sin��ʼ��Ȩֵweights

W = zeros(fan_out,1+fan_in);

% ʹ��sin��ʼ��W
W = reshape(sin(1:numel(W)),size(W))/10;    %numel����W��Ԫ�ظ���


end

