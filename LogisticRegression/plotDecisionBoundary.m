function plotDecisionBoundary( theta,X,y )
%	�����߽߱�ĺ���
%   @���Ŵ���Ҫ����ʵ������޸ĵĵط�

%% �Ȼ���X1��X2��ɢ��ͼ
plotData(X(:,2:3),y);
hold on;

%% �����߽߱�
if size(X,2) <= 3   %���Xֻ�������У�˵���߽�Ϊһ��ֱ�ߣ�����theta(1),theta(2),theta(3)��ֱ�ӻ���
    plot_x = [min(X(:,2))-2,max(X(:,2))+2];         %ֱ�ӿ��Ը��������㻭�����ҳ������㼴�ɣ�-2�����ظ�������ȥ����
    plot_y = -(theta(2).*plot_x+theta(1))./theta(3);%�ֽ��ߵı��ʽ
    plot(plot_x,plot_y);
    
    legend('y = 1', 'y = 0', '���߽߱�');
    axis([30,100,30,100]);      % @Ҫ��ʾ�����귶Χ�����޸�
else    %���Ƕ���ʽ����Ҫ�������߽߱磬�߶�Ϊ0����
    u = linspace(-1,1.5,50);   
    v = linspace(-1,1.5,50);
    %u = linspace(30,100,100);   %  ���ݵķ�Χ����ʾ30��100����Ϊ100��  @����ʵ�ʵ������޸�
    %v = linspace(30,100,100);   %   @����ʵ�ʵ������޸�
    
    z = zeros(length(u),length(v)); 
    for i = 1:length(u) %����ÿ�����ֵĵ㣬�����Ӧ�ĸ�
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i),v(j))*theta;   %ӳ��Ķ���ʽֵ*�õ���theta
        end
    end
    z = z'; %��Ҫת��һ��

    contour(u,v,z,[0,0],'LineWidth',2); %����zֵΪ0�ĵȸ���
end
hold off;

end

