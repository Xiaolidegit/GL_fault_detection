clc;clear all;close all;
name_str={ '������','͸����ָ��','CO','H2','CO2','��׼����','��������','�������','�ķ綯��','¯��ú����','¯��ú��ָ��','����ȼ���¶�','��ѹ','��ѹ2','��ѹ3','����ѹ��','���ѹ��','ȫѹ��','�ȷ�ѹ��','ʵ�ʷ���','�ȷ��¶�','���¶���','��������','��������','���¶���','����ϵ��','�ķ�ʪ��','�趨��ú��','��Сʱʵ����ú��','��Сʱʵ����ú��'};
%% ��ȡ��������
% % chos=[2:5,11:15,22:26];
% chos=[1:26];
% name_str=name_str(chos);
% for i1=1:8
%     i1
%     load(strcat('K:\GL_data\3\','data_',num2str(i1),'.mat'));
%     for i2=1:floor((length(date0)-500)/10)+1
% %         if i2==3179
% %             fprintf('%d:%d\n',i1,i2);
% %         end
% %         fprintf('%d:%d\n',i1,i2);
%         data1=data0(1+10*(i2-1):500+10*(i2-1),chos);
%         M(i2,:)=mean(data1);
%         S(i2,:)=std(data1);
%         ind=S(i2,:)<1e-3;
%         if sum(ind)>0
%             S(i2,ind)=S(i2-1,ind);
%         end
%         data2=guiyihua(data1,M(i2,:),S(i2,:));
%         [p,te]=pca(data2');
%         for i3=1:size(p,2)
%             P(:,i2,i3)=p(:,i3);
%         end
%         Te(:,i2)=te;
%     end
%     save(strcat('K:\GL_data\3\','pca_model_',num2str(i1),'.mat'),'M','S','P','Te');
%     clear M S P Te;
% end
%% ����ģ��
i1=1;
load(strcat('K:\GL_data\3\','pca_model_',num2str(i1),'.mat'));
load(strcat('K:\GL_data\3\','data_',num2str(i1),'.mat'));
datestr(date0(end),'yyyy-mm-dd HH:MM:SS')


%% ����������һ��
% M_train=mean(data_train0);
% S_train=std(data_train0);
% data_train1=guiyihua(data_train0,M_train,S_train);%ѵ����
% data_test1=guiyihua(data_test0,M_train,S_train);%���Լ�
%% 
% figure,plot(1:size(date,1),datenum(date)); %����ʱ��ֲ������ȣ�����һ��Сʱ
%% sfa
% m=5;
% x=data_train1';%ѵ����
% [s,W,S2]=sfa(x);%ѵ��ģ��
% y=data_test1';%���Լ�
% [T1,Te,S1,Se]=sfa_indicater(y,W,S2,m);
% figure;
% subplot(2,2,1);
% plot(T1);title('T1');
% subplot(2,2,2);
% plot(Te);title('Te');
% subplot(2,2,3);
% plot(S1);title('S1');
% subplot(2,2,4);
% plot(Se);title('Se');
%% pca
% x=data_train1';%ѵ����
% [P,te]=pca(x);%ѵ��ģ��
% m=find(tril(ones(size(x,1)),0)*diag(te)/sum(sum(te))<0.95,1,'last');
% y=data_test1';%���Լ�
% [T2,SPE]=pca_indicater(y,P,te,m);
% figure;
% subplot(2,1,1);
% plot(T2);title('T2');
% subplot(2,1,2);
% plot(SPE);title('SPE');