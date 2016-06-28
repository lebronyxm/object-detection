%数据修正，对原标注数据进行坐标变换
clc;
clear;
path_image='/Users/yangxuemeng/Desktop/anno_yang/mt5img/';
files_all=dir(path_image);
txtpath='/Users/yangxuemeng/Desktop/anno_yang/mt5txt/';

for i=4:length(files_all)
    clear img text;
    img=imread(strcat(path_image, files_all(i).name(1:end-4),'.jpg'));
    [H,W]=size(img(:,:,1));
    text=load(strcat(txtpath, files_all(i).name(1:end-4),'.jpg.txt'));
    
    path = ['/Users/yangxuemeng/Desktop/anno_yang/mt5anno/' files_all(i).name(1:end-4) '.txt'];
    fid=fopen(path,'w');
%%＝＝＝＝＝＝针对美团中心5个logo条数据  1 3
    % 平均取 2.08  
    ya=text(1,2);
    yb=text(1,4);
    Ax=1:W/5:W;
    Ax(2:end)=Ax(2:end)-3;
    Ay=ya;
    Bx=W/5:W/5:W;
    if Bx(end)>W
        Bx(end)=W;
    end
    By=yb;
    scale=1/(1+2.08);
    midx=Ax+(Bx-Ax)*scale;
    midy=yb;
for j=1:5 
    fprintf(fid,'%d',1); 
    fprintf(fid, '\n');
    str=sprintf('%.0f ', Ax(j),Ay,midx(j),midy);
    fprintf(fid,[str '\n']);
end
for k=1:5
    fprintf(fid,'%d',3); 
    fprintf(fid, '\n');  
    str2=sprintf('%.0f ', midx(k),Ay,Bx(k),By);
    fprintf(fid,[str2 '\n']);
end
fclose(fid);
% %=========大众点评 人＋文字  4 5
%     %scale=0.3497 ren/(ren+zi)
%     scale=0.31;
%     Ax=text(1);
%     Ay=text(2);
%     midx=text(3);
%     midy=text(4);
%     Bx=Ax+(midx-Ax)/scale;
%     if Bx>W
%         Bx=W;
%     end
%     By=midy;
%     fprintf(fid,'%d',4); 
%     fprintf(fid, '\n');  
%     str2=sprintf('%.0f ', Ax,Ay,midx,midy);
%     fprintf(fid,[str2 '\n']);
%     fprintf(fid,'%d',5);
%     fprintf(fid, '\n');
%     str3=sprintf('%.0f ',midx,Ay,Bx,By);
%     fprintf(fid,[str3 '\n']);
%     fclose(fid);
end
%% ==========美团大图标注小美团字样
% rh=3;  %比例大小，多次测量取平均
% rwl=3;
% rwr=3;
% xa=text(1);
% ya=text(2);
% xb=text(3);
% yb=text(4);
% xc=xa-rwl*(xb-xa);
% yc=ya;
% xk=xa;
% yk=ya+rh*(yb-ya);
% xf=yb+rwr*(yb-ya);
% yf=yk;
