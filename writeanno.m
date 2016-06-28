%writeanno.m
%��������д�����֣�������VOC2007��д��������ȫһ����
clc;
path_image='JPEGImages/';
path_label='labels/';%txt�ļ����·��
files_all=dir(path_image);

for i = 4:length(files_all) %ԭ��3��ʼ��
    msg = textread(strcat(path_label, files_all(i).name(1:end-4),'.jpg.txt'),'%s');
    clear rec;
    path = ['./Annotations/' files_all(i).name(1:end-4) '.xml'];
    fid=fopen(path,'w');
    rec.annotation.folder = 'lml';%���ݼ���

    rec.annotation.filename = files_all(i).name(1:end-4);%ͼƬ��

    rec.annotation.source.database = 'The lmls Database';%���д
    rec.annotation.source.annotation = 'The lmls Database';%���д
    rec.annotation.source.image = 'lml';%���д
    rec.annotation.source.flickrid = '0';%���д

    rec.annotation.owner.flickrid = 'I do not know';%���д
    rec.annotation.owner.name = 'I do not know';%���д

    img = imread(['./JPEGImages/' files_all(i).name]);
    rec.annotation.size.width = int2str(size(img,2));
    rec.annotation.size.height = int2str(size(img,1));
    rec.annotation.size.depth = int2str(size(img,3));

    rec.annotation.segmented = '0';%�����ڷָ�
    rec.annotation.object.name = msg{1};%�����
    rec.annotation.object.pose = 'Unspecified';%��ָ����̬
    rec.annotation.object.truncated = '0';%û�б�ɾ��
    rec.annotation.object.difficult = '0';%��������ʶ���Ŀ��
    rec.annotation.object.bndbox.xmin = msg{2};%����x1
    rec.annotation.object.bndbox.ymin = msg{3};%����y1
    rec.annotation.object.bndbox.xmax = msg{4};%����x2
    rec.annotation.object.bndbox.ymax = msg{5};%����y2
    writexml(fid,rec,0);
    fclose(fid);
end