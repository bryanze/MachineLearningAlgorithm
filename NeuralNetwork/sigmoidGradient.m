function [ g ] = sigmoidGradient( z )
%	��sigmoid�ĵ���

g = sigmoid(z).*(1-sigmoid(z));

end

