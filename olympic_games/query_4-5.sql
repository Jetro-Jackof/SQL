select * from athlete_events
#Query4
# SQL query to return the Olympic Games which had the highest participating countries and the lowest participating countries.
select max(count(Name)), min(count(Name)) from athlete_events
