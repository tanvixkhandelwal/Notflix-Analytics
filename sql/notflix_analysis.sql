CREATE DATABASE NOTFLIX;
select * from catalogue_data
select * from consumption_data;
select  * from rating_data;
SELECT  [content_id]
      --,[accesslevel]
      --,[contentformat]
      --,[contenttype]
      ,[date_added]
      --,[imagedetails_heroimage]
      --,[imagedetails_thumbnailimage]
      --,[imagedetails_todayimage]
      ,[status]
      --,[type]
      ,[title]
      --,[director]
      --,[cast]
      ,[country]
      ,[release_year]
      ,[rating]
      ,[duration]
      ,[listed_in]
      --,[description]
  FROM [NOTFLIX].[dbo].[catalogue_data]

  --finding out what content to relagate based on 

WITH 
--completion rate
completion_rate as 
(
select cat.content_id,
(sum(con.user_duration)/ sum(con.content_duration))*100 as completion_rate
from catalogue_data cat
left join consumption_data con
on cat.content_id=con.content_id
where cat.status='LIVE'
group by cat.content_id
),

avg_ratings as
(
select cat.content_id,
AVG (
CASE
WHEN rat.rating='AWESOME' THEN 5
WHEN RAT.RATING='GOOD' THEN 4
WHEN RAT.RATING='DISMISSED' THEN 3
WHEN RAT.RATING ='BAD' THEN 2
WHEN RAT.RATING='TERRIBLE' THEN 1
ELSE NULL
END) AS AVERAGERATING,
count (
CASE
WHEN rat.rating='AWESOME' THEN 5
WHEN RAT.RATING='GOOD' THEN 4
WHEN RAT.RATING='DISMISSED' THEN 3
WHEN RAT.RATING ='BAD' THEN 2
WHEN RAT.RATING='TERRIBLE' THEN 1
ELSE NULL
END) AS totalratingcount,
count( distinct rat.userid) as number_of_user_rated
from catalogue_data cat
LEFT JOIN CONSUMPTION_DATA con
on cat.content_id= con.content_id
left join rating_data rat
on con.usersessionid= rat.usersessionid
where cat.status='LIVE'
GROUP BY CAT.CONTENT_ID
),

total_views as
(
select cat.content_id, count(con.content_id) as viewcount
from catalogue_data cat
left join consumption_data con
on cat.content_id=con.content_id
where cat.status='LIVE'
group by cat.content_id
),

datefilter as
(
select content_id, date_added,
datediff(month,date_added,'2022-01-01') as Time_Interval
from catalogue_data
where datediff(month,date_added,'2022-01-01')  >5
)

select com.content_id, com.completion_rate, rat.averagerating,rat.totalratingcount, rat.number_of_user_rated, tv.viewcount, dat.time_interval,
  CASE
    WHEN ISNULL(tv.viewcount,0) < 1000         
         AND( rat.averagerating <= 3        
         OR com.completion_rate <= 50  ) 
      THEN 'Relegate'
    WHEN ISNULL(tv.viewcount,0) < 400         
         AND rat.averagerating >= 4       
         AND com.completion_rate >= 50      
      THEN 'Promote'
    ELSE 'Monitor'
  END AS action_recommended
from completion_rate com
join avg_ratings rat
on com.content_id=rat.content_id
join total_views tv
on com.content_id=tv.content_id
join datefilter dat
on com.content_id=dat.content_id
where rat.number_of_user_rated>50






