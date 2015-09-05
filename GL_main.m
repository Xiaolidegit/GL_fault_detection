clc;clear all;close all;
% date_str_begin=datestr([2013,02,15,00,00,00],'yyyy-mm-dd');
% date_str_end=datestr( [2013,02,28,00,00,00],'yyyy-mm-dd');
% [date,data]=get_data_from_sql_server('[GL1].[dbo].[ZCS1]',date_str_begin,date_str_end);
% save data.mat date data;

% datestr(date(45506),'yyyy-mm-dd HH:MM:SS')

load data.mat;
figure,plot(data);

data_train0=data(1:40000,:);
data_test0=data(40001:end,:);

M_train=mean(data_train0);
S_train=std(data_train0);

data_train1=guiyihua(data_train0,M_train,S_train);
data_test1=guiyihua(data_test0,M_train,S_train);%���Լ�

% figure,plot(1:size(date,1),datenum(date)); %����ʱ��ֲ������ȣ�����һ��Сʱ

m=2;
x=data_train1';%ѵ����
[s,W,S2]=sfa(x);%ѵ��ģ��
y=data_test1';%���Լ�
[T1,Te,S1,Se]=sfa_indicater(y,W,S2,m);

figure;
subplot(2,2,1);
plot(T1);title('T1');
subplot(2,2,2);
plot(Te);title('Te');
subplot(2,2,3);
plot(S1);title('S1');
subplot(2,2,4);
plot(Se);title('Se');
