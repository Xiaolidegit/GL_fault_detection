clc;clear;close all;
% No=2;
% GL=7;
% sql_cmd='select dateStr,num from ( select dateStr,count(*) as num from ( SELECT CONVERT(varchar(100), [ʱ��], 23) as dateStr FROM [GL7].[dbo].[ZCS7] where (�ȷ�ѹ��<0.34 or �������<20 or ���¶���>350 or ��������<5000 ) and ʱ��>''2014-01-25'' ) A group by dateStr ) B where num>100 order by dateStr'; 

No=6;
GL=6;
sql_cmd='select dateStr,num from ( select dateStr,count(*) as num from  ( SELECT CONVERT(varchar(100), [ʱ��], 23) as dateStr FROM [GL6].[dbo].[ZCS6] where �ȷ�ѹ��<0.28 or �������<15 or ���¶���>400 or ��������<5000 ) A group by dateStr ) B where num>100 order by dateStr';

% conn=database('gl','PRM14-LENOVO-PC\PRM','');
% curs=exec(conn,sql_cmd);
% curs=fetch(curs);
% Data=curs.Data;
% close(curs);
% close(conn);
% save(strcat('doubtfulDaysOfGL',num2str(No),'.mat'),'Data');

load(strcat('doubtfulDaysOfGL',num2str(No),'.mat'));
days=Data(:,1);
i1=1;
i3=1;
while i1<length(days)%��ǰ�������index
    disp(length(days)-i1);
    i2=i1;%���һ���������ڵ�index
    while((i2+1<length(days))&&(datenum(days{i2+1})-datenum(days{i2})<1.5))
        i2=i2+1;
    end
    date_str_begin=datestr(datenum(days{i1})-1,'yyyy-mm-dd');
    date_str_end=datestr(datenum(days{i2})+1,'yyyy-mm-dd');
    [date0,data0]=get_data_from_sql_server(strcat('[GL',num2str(GL),'].[dbo].[ZCS',num2str(GL),']'),date_str_begin,date_str_end);
    index = [7 8 13 18 21 ];
%     h=figure;
%     plot(date0,data0(:,index));
%     title(strcat('from  ',date_str_begin,' to ',date_str_end));
    save(strcat('fault_location\',num2str(No),'\data_',num2str(i3),'.mat'),'date0','data0','date_str_begin','date_str_end');
    i1=i2+1; 
    i3=i3+1;
end
disp(strcat('There are ',num2str(i3-1),' doubtful fault detected.'));
