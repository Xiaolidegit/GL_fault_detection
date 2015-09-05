clc;close all;clear all;
%% ��������
%ѵ����
[u,z]=loaddata('d00');
u_mean=mean(u,2);
u_std=std(u,0,2);
z_mean=mean(z,2);
z_std=std(z,0,2);
% ��׼��
u=(u-u_mean*ones(1,size(u,2)))./(u_std*ones(1,size(u,2)));
z=(z-z_mean*ones(1,size(z,2)))./(z_std*ones(1,size(z,2)));
%���Լ�
[u_te,z_te]=loaddata('d00_te');
%��׼��
u_te=(u_te-u_mean*ones(1,size(u_te,2)))./(u_std*ones(1,size(u_te,2)));
z_te=(z_te-z_mean*ones(1,size(z_te,2)))./(z_std*ones(1,size(z_te,2)));
%% ��������Ԥ�����ȷ�����г���N
for i1=1:4
    % ����ѵ����ѵ��Markovģ��
    N=i1;
    [g,lumda]=Markov(z,u,N);
    % ���ڲ��Լ���������Ԥ�����
    z_te1=MIMOpredict(u_te,g);
    V0(i1)=sum(sum((z_te-z_te1).^2));
end
plot(V0);
xlabel('���г���N');ylabel('ѵ����������Ԥ�����V');title('��������Ԥ�����ȷ�����г���N');
%% ���ӻ�d00_te.dat���Լ���Ԥ��Ч��
% ����ѵ����ѵ��Markovģ��
N=1;
[g,lumda]=Markov(z,u,N);
% ���ڲ��Լ���������Ԥ�����
z_te1=MIMOpredict(u_te,g);
V0(i1)=sum(sum((z_te-z_te1).^2))/size(z_te,2);
for j1=1:11
    figure;
    plot(N+1:size(z_te,2),z_te(j1,N+1:end),N+1:size(z_te,2),z_te1(j1,N+1:end));
    xlabel('k');ylabel('value');title(strcat('���z',num2str(j1),'��ʵֵ��Ԥ��ֵ'));
    legend('��ʵֵz','Ԥ��ֵz1');
end
%% ��������Ԥ�����Ĺ������
for i1=0:21
    %��������
    str1=strcat('d',num2str(i1,'%.2d'),'_te');
    [u,z]=loaddata(str1);
    %��׼��
    u_mean=mean(u,2);
    u_std=std(u,0,2);
    z_mean=mean(z,2);
    z_std=std(z,0,2);
    u=(u-u_mean*ones(1,size(u,2)))./(u_std*ones(1,size(u,2)));
    z=(z-z_mean*ones(1,size(z,2)))./(z_std*ones(1,size(z,2)));
    % ѵ��Markovģ��
    N=1;
    [g,lumda]=Markov(z,u,N);
    % �Բ��Լ����в���
    for i2=0:21
        str2=strcat('d',num2str(i2,'%.2d'),'_te');
        [u_te,z_te]=loaddata(str2);
        %��׼��
        u_te=(u_te-u_mean*ones(1,size(u_te,2)))./(u_std*ones(1,size(u_te,2)));
        z_te=(z_te-z_mean*ones(1,size(z_te,2)))./(z_std*ones(1,size(z_te,2)));
        z_te1=MIMOpredict(u_te,g);
        V(i2+1,i1+1)=sum(sum((z_te-z_te1).^2))/size(z_te,2);%����״̬ȫ����1����:1~22
    end
end
[~,result1]=min(V);
[~,result2]=sort(V);
%������Ͻ����Ӧ��ȫ����1������0~21
result1=result1-1;
result2=result2-1;