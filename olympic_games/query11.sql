# Fetch the top 5 athletes who have won the most gold medlas
select * from athlete_events

#look the for total number
select distinct name, team, count(medal) as total_gold
from athlete_events
where medal = "Gold"
group by 1, 2
order by total_gold desc

#count the number of gold medals
select name, count(1) as total_gold
from athlete_events
where medal = "Gold"
group by name
order by count(1) desc

# give a number depending on total gold medals
select name, total_gold,  dense_rank() over (order by total_gold desc) rnk
from (
	select name, count(1) as total_gold
	from athlete_events
	where medal = "Gold"
	group by name
	order by count(1) desc
) counter
order by 3

#select the top 5
select * 
from(
select name, total_gold,  dense_rank() over (order by total_gold desc) rnk
from (
	select name, count(1) as total_gold
	from athlete_events
	where medal = "Gold"
	group by name
	order by count(1) desc
) counter
) last
where rnk <= 5




