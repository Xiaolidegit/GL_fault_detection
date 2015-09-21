clc;clear all;close all;
name_str={ '������','͸����ָ��','CO','H2','CO2','��׼����','��������','�������','�ķ綯��','¯��ú����','¯��ú��ָ��','����ȼ���¶�','��ѹ','��ѹ2','��ѹ3','����ѹ��','���ѹ��','ȫѹ��','�ȷ�ѹ��','ʵ�ʷ���','�ȷ��¶�','���¶���','��������','��������','���¶���','����ϵ��','�ķ�ʪ��','�趨��ú��','��Сʱʵ����ú��','��Сʱʵ����ú��'};
%% ��ȡ��������
load data_����_2012-10-01.mat;
chos=[1:26];
data_train0=data0(1:50,chos);
data_test0=data0(20001:end,chos);
%% ����������һ��
M_train1=mean(data_train0);
S_train1=std(data_train0);
data_train1=guiyihua(data_train0,M_train1,S_train1);%ѵ����
M_test1=mean(data_test0);
S_test1=std(data_test0);
data_test12=guiyihua(data_test0,M_test1,S_test1);
data_test11=guiyihua(data_test0,M_train1,S_train1);%���Լ�
%% pca
[P1,te1]=pca(data_train1');%ѵ��ģ��
[P2,te2]=pca(data_test12');
P3=P2'*P1;
T1=data_train1*P1;
T2=data_test12*P2;
T22=data_test11*P1;
% imshow(abs(P3));
% figure;
% hold on;
% scatter(T1(:,1),T1(:,2),'b.');
% scatter(T2(:,1),T2(:,2),'r.');
% scatter(T22(:,1),T22(:,2),'g.');
% hold off;

figure;
hold on;
i1=5;
scatter3(T22((i1-1)*4000+1:i1*4000,1),T22((i1-1)*4000+1:i1*4000,2),T22((i1-1)*4000+1:i1*4000,3),'b.');
i1=80;
scatter3(T22((i1-1)*4000+1:i1*4000,1),T22((i1-1)*4000+1:i1*4000,2),T22((i1-1)*4000+1:i1*4000,3),'r.');
hold off;