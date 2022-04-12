#query 1
#total no of Olympic Games held as per the dataset.
select * from athlete_events

select count(distinct Games) as Total_Olympic_Games from athlete_events

#Query 2
#list down all the Olympic Games held so far(year,season, city)
select distinct Year, Season, City 
from athlete_events
order by year 

#Query 3
#fetch total no of countries participated in each olympic games
select distinct Games, count(distinct NOC)
from athlete_events
group by Games
order by Games

