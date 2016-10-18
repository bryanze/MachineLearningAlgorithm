function checkNNGradients( lambda )
%	�ݶȼ��
%   �����ǹ���һ��С�͵������磬�ֱ�ʹ�ù���õ�bp���ݶȵĶ�������ݶ�
    %��������������ݶ�����С���������bpû������
%   lambda��û��ָ�����ʼΪ0���൱�ڼ���û�����򻯵��ݶ�

if ~exist('lambda','var') || isempty(lambda)
    lambda = 0;
end

%% ����С�͵�������
input_layer_size = 3;   %�����unitsΪ3��
hidden_layer_size = 5;  %���ز�unitsΪ5��
num_labels = 3;         %�����Ϊunits3��
m = 5;                  %��������Ϊ5��

%��ʼ��theta������debugInitializeWeights����
Theta1 = debugInitializeWeights(hidden_layer_size,input_layer_size);
Theta2 = debugInitializeWeights(num_labels,hidden_layer_size);

X = debugInitializeWeights(m,input_layer_size-1);   %��ʼ��X
y = 1+mod(1:m,num_labels)'; %��ʼ��y

nn_params = [Theta1(:);Theta2(:)];

%% �ݶ��½��㷨��grad

% �����������ΪcostFunc��pΪ���������
costFunc = @(p)nnCostFunction(p,input_layer_size,hidden_layer_size,...
                              num_labels,X,y,lambda);
[cost,grad] = costFunc(nn_params);  %����ʼ���õ�theta����ȥ

%% ʹ���ݶȵĶ�����grad
numgrad = computeNumericalGradient(costFunc,nn_params); %����ʹ���˺������costFunc��Ϊ����


%% ��ʾ������Ա�
disp([numgrad grad])

fprintf('���������ֵӦ�÷ǳ��ӽ�����ʾ�ݶ�û�����⡣\n');
fprintf('�����һ���Ǽ���ĵ��ݶȣ��ұ���bp��������㵽���ݶȣ�\n\n');

diff = norm(numgrad-grad)/norm(numgrad+grad);

fprintf(['���bp������ȷ����Բ��ǳ�С\n'...
        '����õ�����Բ�Ϊ��%g\n'],diff);
    
end

