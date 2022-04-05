#/1.- total no. of sumer olympic games
#2.- how many games where they played
#3.-compare 1 and 2

#First now how many olympic games where in summer
select count(distinct games) as total_summer_games
from athlete_events
where season = 'Summer'),

select distinct games, sport
	from athlete_events
    where season = 'Summer'
    order by sport 
    
select sport, count(games) 
    from (select distinct games, sport
		  from athlete_events
		  where season = 'Summer'
		  order by sport) subq
group by sport

