function  plotData( X,y )
%	��������ͼ����
%   X�������У�x1,x2����y��Ϊ0��1

figure;     %����һ����ͼ
hold on; 

%% 
pos = find(y==1);   %�ҵ�y��Ϊ1��
neg = find(y==0);   %�ҵ�y��Ϊ0��

plot(X(pos,1),X(pos,2),'k+','LineWidth',2,'MarkerSize',7);      %��x1,x2��ɢ��ͼ���൱��x1,x2,y��άͼ��xoy���ͶӰ
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','y','MarkerSize',7);

hold off;

end

