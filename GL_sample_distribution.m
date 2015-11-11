clc;clear all;close all;
name_str={ '������','͸����ָ��','CO','H2','CO2','��׼����','��������','�������','�ķ綯��','¯��ú����','¯��ú��ָ��','����ȼ���¶�','��ѹ','��ѹ2','��ѹ3','����ѹ��','���ѹ��','ȫѹ��','�ȷ�ѹ��','ʵ�ʷ���','�ȷ��¶�','���¶���','��������','��������','���¶���','����ϵ��','�ķ�ʪ��','�趨��ú��','��Сʱʵ����ú��','��Сʱʵ����ú��'};
%% ��ȡ��������
load data_����_2012-10-01.mat;
chos=[1:26];
data_train0=data0(1:4000,chos);
data_test0=data0(40001:440000,chos);
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

figure;
hold on;
scatter(T1(:,1),T1(:,2),'b.');
% scatter(T2(:,1),T2(:,2),'r.');
for i1=1:5
    range=i1*40000;%ÿ��5��Լ40000����
    data1=data0(range:range+1000,chos);
    data2=guiyihua(data1,M_train1,S_train1);
    data3=data2*P1;
    scatter(data3(:,1),data3(:,2),'.');
end
fh=@(x,y)x^2/te1(1)+y^2/te1(2)-4;
h=ezplot(fh,[min(T1(:,1))-20,max(T1(:,1))+20,min(T1(:,2))-20,max(T1(:,2))+20]);
set(h,'linewidth',2,'color','r','linestyle','-.');
hold off;
title('ѵ��������Լ���һ�ڶ����ɷ�ɢ��ͼ');
xlabel('t1');ylabel('t2');
legend('ѵ����','һ���','�����','�����','�����','�����','T^2��ֵ');

% figure;
% hold on;
% i1=1;
% scatter3(T22((i1-1)*4000+1:i1*4000,1),T22((i1-1)*4000+1:i1*4000,2),T22((i1-1)*4000+1:i1*4000,3),'.');
% i1=4;
% scatter3(T22((i1-1)*4000+1:i1*4000,1),T22((i1-1)*4000+1:i1*4000,2),T22((i1-1)*4000+1:i1*4000,3),'.');
% hold off;
%% sfa
% [s1,W,S2]=sfa(data_train1');%ѵ��ģ��
% s2=W*data_test11';%���Լ�
% S1=s1';
% S2=s2';
% figure;
% hold on;
% scatter(S1(:,1),S1(:,2),'b.');
% scatter(S2(:,1),S2(:,2),'g.');
% hold off;
% title('ѵ��������Լ���һ�ڶ����ɷ�ɢ��ͼ');
% xlabel('s1');ylabel('s2');
% legend('ѵ����','���Լ�');

