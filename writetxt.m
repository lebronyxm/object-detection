%writetxt.m
clc;
file = dir('Annotations');
len = length(file)-2;

num_trainval=sort(randperm(len, floor(9*len/10)));%trainval��ռ�������ݵ�9/10�����Ը�����Ҫ����
num_train=sort(num_trainval(randperm(length(num_trainval), floor(5*length(num_trainval)/6))));%train��ռtrainval����5/6�����Ը�����Ҫ����
num_val=setdiff(num_trainval,num_train);%trainval��ʣ�µ���Ϊval��
num_test=setdiff(1:len,num_trainval);%����������ʣ�µ���Ϊtest��
path = 'ImageSets/Main/'; %'ImageSets\Main\'Mac·���ã�

fid=fopen(strcat(path, 'trainval.txt'),'a+');
for i=2:length(num_trainval) %ԭ����1��ʼ
    s = sprintf('%s',file(num_trainval(i)+2).name); %ԭ��+2����������������
    fprintf(fid,[s(1:length(s)-4) '\n']);
end
fclose(fid);

fid=fopen(strcat(path, 'train.txt'),'a+');
for i=2:length(num_train)
    s = sprintf('%s',file(num_train(i)+2).name);
    fprintf(fid,[s(1:length(s)-4) '\n']);
end
fclose(fid);

fid=fopen(strcat(path, 'val.txt'),'a+');
for i=2:length(num_val)
    s = sprintf('%s',file(num_val(i)+2).name);
    fprintf(fid,[s(1:length(s)-4) '\n']);
end
fclose(fid);

fid=fopen(strcat(path, 'test.txt'),'a+');
for i=2:length(num_test)
    s = sprintf('%s',file(num_test(i)+2).name);
    fprintf(fid,[s(1:length(s)-4) '\n']);
end
fclose(fid);