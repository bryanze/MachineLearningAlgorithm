function [ h,display_array ] = displayData_OneVsAll( X,example_width )
%   ��X�ж�Ӧ����д���ֻ�����
%   �˴���ʾ��ϸ˵��

%% ����Ҫ��ʾ��д���ֵĿ�ȣ�������20px�������û�д�������Ļ�
if ~exist('example_width','var') || isempty('example_width')
    example_width = round(sqrt(size(X,2)));  % round��������ȡ��
end

%% ��ͼ 
colormap(gray)  %������ɫϵ������ͼ
[m n] = size(X);
example_height = n/example_width;   %��д���ֵĸ߶ȣ�������20px��
%ÿ��ͼ���кź��кţ������С��ж���10��
display_rows = floor(sqrt(m));
display_cols = ceil(m/display_rows);

pad = 1;    %����ͼ���padding
% Ҫ��ʾ������
display_array = - ones(pad+display_rows*(example_height+pad),...
                       pad+display_cols*(example_width+pad));

 cur = 1;   %������ǰ�к�
 for i = 1:display_rows
     for j = 1:display_cols
         if cur > m  %�������������˳���ǰѭ��
             break;
         end
         
         max_val = max(abs(X(cur,:)));  %��ȡÿ�е����ֵ,��Ҫ�������ÿ�����ص�Ĵ�С
         display_array(pad+(i-1)*(example_height+pad)+(1:example_height),...    %ÿ��ͼ���Ӧ�Ļ滭����ĸ�(1:example_height)
                       pad+(j-1)*(example_width +pad)+(1:example_width))=...    %ÿ��ͼ���Ӧ�Ļ滭����Ŀ�(1:example_height)
                       reshape(X(cur,:),example_height,example_width)/max_val;  %��X�е�ǰ�е���Ϊͼ��ľ�����Ϊͼ���Ƕ�Ӧ��X�е�һ�����ݣ�
         cur = cur+1;
     end
     if cur > m  %�������������˳���ǰѭ��(��Ϊdisplay_array�ĸ����ǽ����е������Ƶģ�����һ��һ�����ص㸴�Ƶģ���������ֱ���˳���ǰѭ��)
         break;
     end
 end
 h = imagesc(display_array,[-1 1]);%��display_array�е�ֵת��Ϊ��ɫ��ʾ��[-1 1]��Ϊÿ�����ص㶼������max_val,���Կ϶���[-1,1]������
 
 axis image off;    %����ʾx,y��
 drawnow;
 
end

