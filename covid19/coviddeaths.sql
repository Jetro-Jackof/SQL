select location, date, total_cases, new_cases, total_deaths, population
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

