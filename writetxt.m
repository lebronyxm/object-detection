%writetxt.m
clc;
file = dir('Annotations');
len = length(file)-2;

num_trainval=sort(randperm(len, floor(9*len/10)));%trainval集占所有数据的9/10，可以根据需要设置
num_train=sort(num_trainval(randperm(length(num_trainval), floor(5*length(num_trainval)/6))));%train集占trainval集的5/6，可以根据需要设置
num_val=setdiff(num_trainval,num_train);%trainval集剩下的作为val集
num_test=setdiff(1:len,num_trainval);%所有数据中剩下的作为test集
path = 'ImageSets/Main/'; %'ImageSets\Main\'Mac路径用／

fid=fopen(strcat(path, 'trainval.txt'),'a+');
for i=2:length(num_trainval) %原来从1开始
    s = sprintf('%s',file(num_trainval(i)+2).name); %原来+2；多用数据再试试
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