function sim = gaussianKernel( x1,x2,sigma )
%	��˹kernel
%   

sim = 0;

term = (x1-x2)'*(x1-x2);

sim = exp(-term/(2*sigma^2));   %��˹kernel����

end

