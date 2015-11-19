clc;clear;close all;
%% add label
% 1悬料；2滑料；3管道；4作料；5炉凉
GL{1}={
'2013/12/28 9:28:38','2013/12/28 9:40:49','1'
'2013/12/28 23:22:02','2013/12/28 23:37:04','1'
'2013/12/31 4:33:07','2013/12/31 4:51:49','3'
'2014/1/5 19:09:41','2014/1/5 19:38:57','1'
'2014/1/8 2:07:54','2014/1/8 2:55:08','1'
'2014/1/18 20:03:51','2014/1/18 22:22:24','4'
'2014/1/20 4:05:12','2014/1/20 4:28:54','1'
'2014/1/20 7:43:22','2014/1/20 7:55:43','1'
'2014/1/20 12:11','2014/1/20 23:52:47','4'
'2014/1/21 5:48:20','2014/1/21 6:03:02','1'
'2014/1/22 21:52:07','2014/1/22 22:39:11','1'
'2014/1/25 1:21:55','2014/1/25 1:26:56','1'
'2014/1/25 5:39:40','2014/1/25 9:52:41','1'
};
GL{2}={
'2012-03-23 12:08:22','2012-03-23 13:05:10','1'
'2012-03-25 12:46:13','2012-03-25 13:19:41','2'
'2012-03-30 19:56:08','2012-03-31 00:42:21','3'
'2012-11-16 09:39:00','2012-11-16 10:29:08','3'
'2013-01-15 23:43:11','2013-01-16 01:21:13','1'
'2013-01-16 17:19:10','2013-01-16 19:04:44','3'
'2013-01-25 06:18:26','2013-01-25 09:54:05','1'
'2013-02-13 14:49:30','2013-02-13 15:38:21','3'
'2013-02-25 16:45:14.0','2013-02-26 08:57:00','3'
'2013-03-06 07:19:32','2013-03-06 15:38:04','1'
};
GL{3}={
'2012-05-13 15:55:32','2012-05-14 08:17:54','1'
'2012-06-09 13:36:58','2012-06-09 14:27:36','3'
'2012-10-11 07:18:20','2012-10-11 19:48:03','3'
'2012-10-14 00:15:12','2012-10-14 11:28:38','1'
'2012-11-12 22:05:10','2012-11-13 00:28:18.0','1'
'2013-03-02 01:47:00','2013-03-03 10:36:40','3'
};
%% 生成带标签的数据集
No=[2,3,5];
for i1=1:3
    load(strcat('K:\GL_data\',num2str(No(i1)),'\data.mat'));
    M=mean(data0);
    S=max(std(data0),1e-3*ones(1,size(data0,2)));
    data1=(data0-ones(length(date0),1)*M)./(ones(length(date0),1)*S);
    range=[datenum(GL{i1}(:,1)),datenum(GL{i1}(:,2))];
    label=str2double(GL{i1}(:,3));
    input0=cell(0);
    label0=cell(0);
    for i2=1:size(range,1)
        a=(date0>=range(i2,1))&(date0<=range(i2,2));
        input0=[input0;data1(a,:)];
        l=zeros(sum(a),5);
        l(:,label(i2))=1;
        label0=[label0;l];
    end
    save(strcat('K:\GL_data\',num2str(No(i1)),'\data_labeled.mat'),'input0','label0');
end

