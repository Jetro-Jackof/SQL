#Explore data
select *
from coviddeaths
 
 #Look for total cases vs total deaths (percentage)
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from coviddeaths
#Also look for an especific location like Mexico or United States
where location like 'Mexico' or '%states'

# total cases vs population
select location, date, total_cases, population, (total_cases/population)*100 as cases_percentage
from coviddeaths
where location like '%states'

#countries with highest infection rate agains population
 
Select location, max(total_cases)  highs_infection, population, max((total_cases/population))*100  infection_percentage
from coviddeaths
group by location, population
order by infection_percentage desc

#Show Countries with highest Death count per population
select location, max(total_deaths) as deaths_per_country
from coviddeaths
#Problem Europe, North and South America are not countries whats the problem? our database has a continent name in location
#fix with where clause
where location not like '%America' AND location not like 'Europe'
group by location
order by deaths_per_country desc

#Show continent with highest Death count per population
select continent, max(total_deaths) as deaths_per_country
from coviddeaths
where continent is not null
group by continent
order by deaths_per_country desc

#**Global numbers**

#total of new cases, new deaths and percentage of them around the world
select date, sum(new_cases) as 'new cases', sum(new_deaths) as 'new deaths', sum(new_deaths)/sum(new_cases)*100 as Death_percentage
from coviddeaths
where continent is not Null
Group by date
order by date

# total of new deaths around the world
select sum(new_cases) as 'new cases', sum(new_deaths) as 'new deaths', sum(new_deaths)/sum(new_cases)*100 as Death_percentage
from coviddeaths
where continent is not Null
order by 1,2

###########################--- Covid vaccination data

select * from covidvaccination

#join both tables (location and date)

select dt.continent, dt.location, dt.date, dt.population, vac.new_vaccinations
from coviddeaths dt
join covidvaccination vac
on dt.location = vac.location
and dt.date = vac.date

# get the sum of new_vaccinations per location( this goin to sum the total of new vaccinations in that location separated by date)
select dt.continent, dt.location, dt.date, dt.population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dt.location order by dt.location,dt.date) as RollingVaccinated
from coviddeaths dt
join covidvaccination vac
on dt.location = vac.location and dt.date = vac.date

#          Temporal table
#------------------------------------------------------------------------------------------

#When I create the table i made a mistake, I set date column as text not a date type, so first change date column to the correct format 

#First let see the datatype from column date
show fields from coviddeaths
# show the format of the dates dd/mm/yyyy this is not a correct format
select date from coviddeaths

# create new columm, add the correct datatype, delete the old one, change the name of the new column
Alter TABLE coviddeaths 
ADD column new_date DATETIME

update coviddeaths set new_date = DATE_FORMAT( STR_TO_DATE( date ,"%d/%m/%Y" ) ,"%y/%m/%d" )

Alter table coviddeaths DROP column date
alter table coviddeaths change column new_date date datetime;
select date from coviddeaths


Drop Table if exists PercentPopulationVaccinated
create Table PercentPopulationVaccinated
(
Continent varchar(225),
Location varchar(225),
date datetime,
population numeric,
new_vaccination numeric,
RollingVaccinated numeric
);

Insert into PercentPopulationVaccinated
select dt.continent, dt.location, dt.date, dt.population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dt.location order by dt.location,
dt.date) as RollingVaccinated
from coviddeaths dt
join covidvaccination vac
on dt.location = vac.location and dt.date = vac.date

#Show the new table
select * from PercentPopulationVaccinated

#------------------- Create a View

Create view PopulationVaccinated as
select dt.continent, dt.location, dt.date, dt.population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dt.location order by dt.location,
dt.date) as RollingVaccinated
from coviddeaths dt
join covidvaccination vac
on dt.location = vac.location and dt.date = vac.date







