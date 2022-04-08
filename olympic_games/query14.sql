#query 14
#list total gold, silver and bronze medals won by each country

select * from athlete_events

# Look for gold, silver and bronze in the column medal
select *
from athlete_events
where Medal <> 'NA'

# count the number of medals on each country
select nr.regions as country, medal, count(1) as total_medals
from athlete_events ae
join Noc_Regions nr
on nr.noc = ae.noc
where Medal <> 'NA'
group by nr.regions, medal

create extension tablefunc;
