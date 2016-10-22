%% Эͬ�����㷨�����г���
%   ��Ӱ�Ƽ�

%% Ԥ����
clear;close all;clc

%% ��ʾ����
fprintf('\n���ص�Ӱ��������...\n');
load('movies.mat');
fprintf('\n�Ե�Ӱ1��Toy Story����ƽ������Ϊ��%f\n',mean(Y(1,R(1,:))));  %R�����Y����ͬ��С����¼�˶�Ӧ���û��Ƿ�����

imagesc(Y); % ��ʾ����
ylabel('��Ӱ');
xlabel('�û�');

fprintf('\n������ͣ���������������\n');
pause;

%% Эͬ���˵Ĵ��ۺ���(����)
load('movieParams.mat');

% ���������������ڲ��Դ��ۺ��ݶȼ����Ƿ���ȷ
num_users = 4; num_movies = 5; num_features = 3;
X = X(1:num_movies, 1:num_features);
Theta = Theta(1:num_users, 1:num_features);
Y = Y(1:num_movies, 1:num_users);
R = R(1:num_movies, 1:num_users);

lambda = 1.5;   %���򻯲���   @
J = cofiCostFunction([X(:);Theta(:)],Y, R, num_users, num_movies, ...
               num_features, lambda);
fprintf(['����õ��Ĵ���JΪ (lambda = 1.5): %f '...
         '\n(ֵ������ȷ�Ļ�Ӧ���� 31.34)\n'], J);

fprintf('\n������ͣ���������������\n');
pause;

%% ����ݶȼ����Ƿ���ȷ
fprintf('\n������򻯵��ݶȼ����Ƿ���ȷ��\n');

checkCostFunction(1.5); %����ݶȼ����Ƿ���ȷ

fprintf('\n������ͣ���������������\n');
pause;

%% �趨�������Լ��޸ģ�

movieList = loadMovieList();    %����movie_ids.txt�ļ��еĵ�Ӱ��

my_ratings = zeros(1682, 1);

% ��������
my_ratings(1) = 4;
my_ratings(98) = 2;
my_ratings(7) = 3;
my_ratings(12)= 5;
my_ratings(54) = 4;
my_ratings(64)= 5;
my_ratings(66)= 3;
my_ratings(69) = 5;
my_ratings(183) = 4;
my_ratings(226) = 5;
my_ratings(355)= 5;

% ��ʾ�ҵĴ�����
fprintf('\n\n�ҵĴ��Ϊ:\n');
for i = 1:length(my_ratings)
    if my_ratings(i) > 0 
        fprintf('�Ե�Ӱ %s ������Ϊ��%d\n', movieList{i},my_ratings(i));
    end
end

fprintf('\n������ͣ���������������\n');
pause;


%% ѵ��Эͬ�����㷨
load('movies.mat');
Y = [my_ratings Y];         %�����µ�һ��
R = [(my_ratings ~= 0) R];
[Ynorm, Ymean] = normalizeRatings(Y, R);    % ��һ������

num_users = size(Y, 2); 
num_movies = size(Y, 1);
num_features = 10;

X = randn(num_movies, num_features);    %�����ʼ��X
Theta = randn(num_users, num_features); %�����ʼ��Theta

initial_parameters = [X(:); Theta(:)];

% Set options for fmincg
options = optimset('GradObj', 'on', 'MaxIter', 100);

% Set Regularization
lambda = 10;
theta = fmincg (@(t)(cofiCostFunction(t, Y, R, num_users, num_movies, ...
                                num_features, lambda)), ...
                initial_parameters, options);
%��������
X = reshape(theta(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(theta(num_movies*num_features+1:end), ...
                num_users, num_features);

fprintf('�Ƽ�ϵͳѧϰ����.\n');

fprintf('\n������ͣ���������������\n');
pause;

%% �Ƽ���Ӱ
p = X * Theta';
my_predictions = p(:,1) + Ymean;    

movieList = loadMovieList();

[r, ix] = sort(my_predictions, 'descend');
fprintf('\nΪ���Ƽ���ǰ������ӰΪ:\n');
for i=1:10
    j = ix(i);
    fprintf('�Ե�Ӱ %s ��Ԥ������Ϊ��%.1f\n',movieList{j},my_predictions(j));
end

fprintf('\n\n��������ֵĵ�Ӱ:\n');
for i = 1:length(my_ratings)
    if my_ratings(i) > 0 
        fprintf('���֣� %d ����Ӱ�� %s\n', my_ratings(i), ...
                 movieList{i});
    end
end