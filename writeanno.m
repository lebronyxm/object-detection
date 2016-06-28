%writeanno.m
%所有随意写的名字，都按照VOC2007来写，保持完全一样。
clc;
path_image='JPEGImages/';
path_label='labels/';%txt文件存放路径
files_all=dir(path_image);

for i = 4:length(files_all) %原来3开始的
    msg = textread(strcat(path_label, files_all(i).name(1:end-4),'.jpg.txt'),'%s');
    clear rec;
    path = ['./Annotations/' files_all(i).name(1:end-4) '.xml'];
    fid=fopen(path,'w');
    rec.annotation.folder = 'lml';%数据集名

    rec.annotation.filename = files_all(i).name(1:end-4);%图片名

    rec.annotation.source.database = 'The lmls Database';%随便写
    rec.annotation.source.annotation = 'The lmls Database';%随便写
    rec.annotation.source.image = 'lml';%随便写
    rec.annotation.source.flickrid = '0';%随便写

    rec.annotation.owner.flickrid = 'I do not know';%随便写
    rec.annotation.owner.name = 'I do not know';%随便写

    img = imread(['./JPEGImages/' files_all(i).name]);
    rec.annotation.size.width = int2str(size(img,2));
    rec.annotation.size.height = int2str(size(img,1));
    rec.annotation.size.depth = int2str(size(img,3));

    rec.annotation.segmented = '0';%不用于分割
    rec.annotation.object.name = msg{1};%类别名
    rec.annotation.object.pose = 'Unspecified';%不指定姿态
    rec.annotation.object.truncated = '0';%没有被删节
    rec.annotation.object.difficult = '0';%不是难以识别的目标
    rec.annotation.object.bndbox.xmin = msg{2};%坐标x1
    rec.annotation.object.bndbox.ymin = msg{3};%坐标y1
    rec.annotation.object.bndbox.xmax = msg{4};%坐标x2
    rec.annotation.object.bndbox.ymax = msg{5};%坐标y2
    writexml(fid,rec,0);
    fclose(fid);
end