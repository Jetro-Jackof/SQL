select * from athlete_events

#Query4
# SQL query to return the Olympic Games which had the highest participating countries and the lowest participating countries.
select distinct Games, count(distinct NOC) as total
from athlete_events
group by Games
order by total desc

select
concat(first_value(Games) over(order by total), ' - ', first_value(total) over(order by total)) as lowest_countries,
concat(first_value(Games) over(order by total desc), ' - ', first_value(total) over(order by total desc)) as highest_countries
from(
select distinct Games, count(distinct NOC) as total
from athlete_events
group by Games
) sub
order by 1
limit 1

#Query 5
#return the list of countries who have been part of every Olympics games
select * from athlete_events

# How many olympic games is in the data (result = 51)
select count(distinct Games) from athlete_events

# count how many times a country where in the olympic games
select Team, NOC 
from athlete_events 
order by Team
 

select team as country, count(1) as participation
from(
	select distinct Games, Year 
	from athlete_events 
	order by year 
) sub
group by country
order by participation desc