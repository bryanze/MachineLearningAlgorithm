function file_contents= readFile( fileName )
%	��ȡ�ļ�����
%   �����ļ�������

fid = fopen(fileName);  %���ļ��������ļ�������
if fid   %����ļ���������Ϊ0
    file_contents = fscanf(fid,'%c',inf);   %ɨ���ļ�����
    fclose(fid);    %�ر��ļ�
else
    file_contents = '';
    fprintf('��%s�ļ�����\n',fileName);
end

