function W = randInitializeWeights( L_in,L_out )
%	�����ʼ��weights
%   L_in=S(l),L_out=S(l+1)
%   ����epsilon=(6/(L_in+L_out))^0.5

W = zeros(L_out,1+L_in); % Ȩ��weightsΪ[S(l+1)+1]*S(L)

epsilon_init = (6/(L_in+L_out))^0.5;

W = rand(L_out,1+L_in)*2*epsilon_init-epsilon_init;

end

