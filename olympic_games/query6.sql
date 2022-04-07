#/1.- total no. of sumer olympic games
#2.- how many games where they played
#3.-compare 1 and 2

#step 1
select count(distinct games) as total_summer_games
from athlete_events
where season = 'Summer'

#step 2
select distinct sport, games
from athlete_events
where season = 'Summer'
order by games 
    
select sport, count(games) as no_games
    from (select distinct sport, games
	from athlete_events
	where season = 'Summer'
	order by games ) subq
group by sport


# mySQl does not support with as function
# make a query inside another query
select *
from (
select sport, count(games) as no_games
    from (select distinct sport, games
	from athlete_events
	where season = 'Summer'
	order by games ) subq
group by sport
) t3
join (
select count(distinct games) as total_summer_games
from athlete_events
where season = 'Summer') t1
on t1.total_summer_games = t3.no_games





