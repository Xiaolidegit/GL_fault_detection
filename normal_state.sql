
--��¯7
select dateStr,num from
(
	select dateStr,count(*) as num
	from 
	(
		SELECT CONVERT(varchar(100), [ʱ��], 23) as dateStr
		FROM [GL7].[dbo].[ZCS7]
		where (�ȷ�ѹ��<0.34
			or �������<20
			or ���¶���>350
			or ��������<5000
			)
			and ʱ��>'2014-01-25'
	) A
	group by dateStr
) B
where num>100
order by dateStr

--��¯6
select dateStr,num from
(
	select dateStr,count(*) as num
	from 
	(
		SELECT CONVERT(varchar(100), [ʱ��], 23) as dateStr
		FROM [GL6].[dbo].[ZCS6]
		where �ȷ�ѹ��<0.28
			or �������<15
			or ���¶���>400
			or ��������<5000
	) A
	group by dateStr
) B
where num>100
order by dateStr

--��¯3
select dateStr,num from
(
	select dateStr,count(*) as num
	from 
	(
		SELECT CONVERT(varchar(100), [ʱ��], 23) as dateStr
		FROM [GL3].[dbo].[ZCS3]
		where �ȷ�ѹ��<0.28
			or �������<15
			or ���¶���>400
			or ��������<4000
	) A
	group by dateStr
) B
where num>100
order by dateStr


select min(ʱ��) as mint,max(ʱ��) as maxt 
from [GL6].[dbo].[ZCS6]

