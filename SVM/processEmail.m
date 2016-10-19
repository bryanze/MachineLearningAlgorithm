function word_indices = processEmail( email_contents )
%	�����ʼ����ݺ���
%   �˴���ʾ��ϸ˵��

vocabList = getVocabList();
word_indices = [];

email_contents = lower(email_contents); %תΪСд�ַ�

email_contents = regexprep(email_contents, '<[^<>]+>', ' ');

email_contents = regexprep(email_contents, '[0-9]+', 'number');

email_contents = regexprep(email_contents, ...
                           '(http|https)://[^\s]*', 'httpaddr');
email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');

email_contents = regexprep(email_contents, '[$]+', 'dollar');

% ========================== Tokenize Email ===========================

% Output the email to screen as well
fprintf('\n==== ����Email���� ====\n\n');

% Process file
l = 0;

while ~isempty(email_contents)

    % Tokenize and also get rid of any punctuation
    [str, email_contents] = ...
       strtok(email_contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
   
    % Remove any non alphanumeric characters
    str = regexprep(str, '[^a-zA-Z0-9]', '');

    % Stem the word 
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try str = porterStemmer(strtrim(str)); 
    catch str = ''; continue;
    end;

    % Skip the word if it is too short
    if length(str) < 1
       continue;
    end


    for idx=1:size(vocabList)
        if strcmp(str,vocabList{idx})==1    %�����
            word_indices = [word_indices; idx]; %��id�ż���word_indices��
        end
    end
    
    % =============================================================


    % Print to screen, ensuring that the output lines are not too long
    if (l + length(str) + 1) > 78
        fprintf('\n');
        l = 0;
    end
    fprintf('%s ', str);
    l = l + length(str) + 1;

end

% Print footer
fprintf('\n\n=========================\n');

end


