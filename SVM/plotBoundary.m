function plotBoundary( X,y,model,flag )
%	�����߽߱�
%   flag=0-->���Ա߽�
%   flag=1-->�����Ա߽�
plotData(X,y);
hold on;

if flag == 0
    w = model.w;
    b = model.b;
    xp = linspace(min(X(:,1)),max(X(:,1)),100);
    yp = -(w(1)*xp+b)/w(2);
    plot(xp,yp,'-b');
    hold off;
end
if flag == 1
    x1plot = linspace(min(X(:,1)), max(X(:,1)), 100)';
    x2plot = linspace(min(X(:,2)), max(X(:,2)), 100)';
    [X1, X2] = meshgrid(x1plot, x2plot);
    vals = zeros(size(X1));
    for i = 1:size(X1, 2)
       this_X = [X1(:, i), X2(:, i)];
       vals(:, i) = svmPredict(model, this_X);%Ԥ���Ӧ���ֵ�x1,x2  @
    end
    contour(X1, X2, vals, [0 1], 'Color', 'b'); %���ȸ��ߣ�vals�ķ�Χ��[0 1]֮��  @
    hold off;


end

