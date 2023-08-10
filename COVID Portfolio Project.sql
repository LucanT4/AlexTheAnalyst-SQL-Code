/*
NOTE:
- https://www.youtube.com/playlist?list=PLUaB-1hjhk8FE_XZ87vPPSfHqb6OcM0cF
- CTRL + SHIFT + R) to refresh the local cache so IntelliSense shows newly added tables

*/

/*
create table EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)
*/

/*
Create table EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int
)
*/

/*
insert into EmployeeDemographics values
--(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 310, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Insert into EmployeeSalary values
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)
*/

/*
--Switch to master database and reference the EmployeeSalary table in the SQLTutorial database
select * from SQLTutorial.dbo.EmployeeSalary

select * from EmployeeDemographics where LastName like 'S%'

select * from EmployeeDemographics where LastName like '%S%'
*/

/*
--LastName starts with S and contains o
select * from EmployeeDemographics where LastName like 'S%o%'

select gender, COUNT(gender) from EmployeeDemographics
group by Gender

--Count(Gender) is a derived column
select gender, age, COUNT(gender) from EmployeeDemographics
group by Gender, age

using the column number instead of the column name
select * from EmployeeDemographics order by 4 desc, 5 desc
*/

/*
update EmployeeDemographics
set Age = 31 where FirstName='Angela'
*/


--select * from EmployeeDemographics
--select * from EmployeeSalary order by EmployeeID

/*
insert into EmployeeDemographics values
(1011, 'Ryan', 'Howard', 26, 'Male'),
(null, 'Holly', 'Flax', null, null),
(1013, 'Darryl', 'Philbin', null, 'Male')

Insert into EmployeeSalary values
(1010, null, 47000),
(null, 'Salesman', 43000)
*/

/*
--inner join shows everything that is common/overlapping/the same
select * from EmployeeDemographics
inner join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
*/

/*
--show everything from both databases.  When there is no match the contents are still shown
select * from EmployeeDemographics
full outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
*/

/*
--left table is the first one.  Everything from the left table
select * from EmployeeDemographics
left outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

right table is the first one.  Everything from the right table
select * from EmployeeDemographics
right outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
*/

/*
--when field names are common in each table, the table name has to be specified
select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary from EmployeeDemographics
inner join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

when field names are common in each table, the table name has to b especified
select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary from EmployeeDemographics
right outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
*/

/*
select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary from EmployeeDemographics
left outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary from EmployeeDemographics
inner join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
where FirstName<>'Michael'
order by salary desc
*/

/*
select JobTitle, Salary 
from EmployeeDemographics
inner join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
where JobTitle = 'Salesman'

select JobTitle, avg(Salary)
from EmployeeDemographics
inner join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
where JobTitle = 'Salesman'
group by JobTitle
*/

/*
--UNION
--Full Outer Join
select *
from EmployeeDemographics
full outer join EmployeeSalary
on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
*/

/*
create table WarehouseEmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

Insert into WarehouseEmployeeDemographics values
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female'),
(1013, 'Darryl', 'Philbin', null, 'Male')
*/

/*
select *
from EmployeeDemographics
full outer join WarehouseEmployeeDemographics
on EmployeeDemographics.EmployeeID = WarehouseEmployeeDemographics.EmployeeID
*/

/*
select * from EmployeeDemographics
--UNION --removes duplicates
UNION ALL --returns all rows
select * from WarehouseEmployeeDemographics
order by EmployeeID
*/

/*
--this will work because the data types are the same for each field in the 1st, 2nd and 3rd position and have the same amount of columns
select EmployeeID, FirstName, Age from EmployeeDemographics
union
select EmployeeID, JobTitle, Salary from EmployeeSalary
order by EmployeeID
*/
/*
--CASE statement - allows you to specify conditions and what to return when the conditions are met
select firstname, lastname, age
from EmployeeDemographics
where Age is not null
order by Age

select firstname, lastname, age,
CASE
	WHEN Age>30 THEN 'Old'
	ELSE 'Young'
END
from EmployeeDemographics
where Age is not null
order by Age
*/

/*
select firstname, lastname, age,
CASE
	WHEN Age>30 THEN 'Old'
	WHEN Age BETWEEN 27 and 30 then 'Young'
	ELSE 'Baby'
END
from EmployeeDemographics
where Age is not null
order by Age

the 1st condition that is met will be returned, even if multiple conditions meet the criteria
select firstname, lastname, age,
CASE
	WHEN Age>30 THEN 'Old'
	WHEN Age =38 then 'Stanley'
	ELSE 'Baby'
END
from EmployeeDemographics
where Age is not null
order by Age

if we position the criteria correctly, they woill work
select firstname, lastname, age,
CASE
	WHEN Age =38 then 'Stanley'
	WHEN Age>30 THEN 'Old'
	ELSE 'Baby'
END
from EmployeeDemographics
where Age is not null
order by Age

select FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
from EmployeeDemographics
join SQLTutorial.dbo.EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
*/

/*
--the HAVING clause
select JobTitle, COUNT(jobtitle)
from EmployeeDemographics
join EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle

--let's look at jobs that have a specific count --THIS WON'T WORK
select JobTitle, COUNT(jobtitle)
from EmployeeDemographics
join EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
	WHERE COUNT(JobTITLE)>1
group by JobTitle

the HAVING clause HAS TO come AFTER the GROuP BY clause because it's reference the outcome of the GROUP BY clause
select JobTitle, COUNT(jobtitle)
from EmployeeDemographics
join EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
HAVING COUNT(JobTITLE) > 1

select JobTitle, AVG(Salary)
from EmployeeDemographics
join EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)
*/

/*
--Updating/Deleting records
select * from EmployeeDemographics

UPDATE EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' and LastName = 'Flax'

update multiple columns at one time
UPDATE EmployeeDemographics
SET Age = 31, Gender = 'Female'
--WHERE FirstName = 'Holly' and LastName = 'Flax'
WHERE EmployeeID = 1012
*/

/*
--THERE'S NO WAY TO REVERSE THIS...
--MAKE IT A SELECT STATEMENT FIRST THE CHANGE THE SELECT TO DELETE
DELETE from EmployeeDemographics
WHERE EmployeeID = 1005
*/

/*
--Aliasing - temporarily change the column or table name in a script
--NOTE: you can use the AS or not
select FirstName AS FName, LastName LName 
from EmployeeDemographics

select FirstName + ' ' + LastName AS FullName
from EmployeeDemographics

select AVG(Age) as AvgAge
from EmployeeDemographics
*/

/*
--aliasing table names
select Demo.EmployeeID
from EmployeeDemographics as Demo

select Demo.EmployeeID, Sal.Salary
from EmployeeDemographics as Demo
JOIN EmployeeSalary as Sal
	ON Demo.EmployeeID = Sal.EmployeeID

using a, b, c is not the best way to do this
select a.Age, a.FirstName, a.LastName, b.JobTitle, C.age
from EmployeeDemographics as a
left JOIN EmployeeSalary as b	
	ON a.EmployeeID = b.EmployeeID
left join warehouseEmployeeDemographics c
	ON a.EmployeeID = c.EmployeeID

use descriptive names for the tables
select Demo.EmployeeID, Demo.FirstName, Demo.LastName, Sal.JobTitle, Ware.Age
from EmployeeDemographics as Demo
left JOIN EmployeeSalary as Sal	
	ON Demo.EmployeeID = Sal.EmployeeID
left join WarehouseEmployeeDemographics Ware
	ON Demo.EmployeeID = Ware.EmployeeID
*/

/*
--PARTITION BY  --like the Group by but it divides the result set by partitions and changes how the window function is calculated - doesn't reduce the number of rows returned
select *
from SQLTutorial..EmployeeDemographics

select *
from SQLTutorial..EmployeeSalary

the TotalGender column shows the number of that gender in the table
select FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
from SQLTutorial..EmployeeDemographics dem
join SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID

the GROUP BY statement doesn't give us what we want
select FirstName, LastName, Gender, Salary, COUNT(Gender)
from SQLTutorial..EmployeeDemographics dem
join SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary

we would have to do it this way
select Gender, COUNT(Gender)
from SQLTutorial..EmployeeDemographics dem
join SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender
*/

/*
--CTEs - Common Table Expression - named temporary result set used to manipulate the complex subquery's data
--The CTE is not stored anywhere.  It is recalculated everytime the statement is run.
--also, the Select must come after DIRECTLY (NO BLANK LINES BETWEEN) the WITH/CTE
WITH CTE_Employee as 
(select FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
, AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
from SQLTutorial..EmployeeDemographics emp
join SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
where Salary > 45000
)
Select *
from CTE_Employee
*/

 --Temp tables - can be hit off multiple times as opposed to a subquery
 /*
create table #temp_employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

Select *
from #temp_employee

Insert into #temp_employee values (
'1001', 'HR', 45000
)

Insert into #temp_employee 
select * from EmployeeSalary
*/

/*
drop table if exists #temp_Employee2

create table #temp_Employee2 (
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

insert into #temp_Employee2
select JobTitle, COUNT(jobtitle), AVG(age), AVG(salary)
from EmployeeDemographics emp
join EmployeeSalary sal
	on emp.EmployeeID = sal.EmployeeID
group by JobTitle

select * from #temp_Employee2
*/


--string functions
-- TRIM, LTRIM, Replace, Substring, upper, Lower

--Drop table EmployeeErrors;
/*
create table EmployeeErrors (
EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50)
)

insert into EmployeeErrors values
('1001  ', 'Jimbo', 'Halbert'),
('  1002', 'Pamela', 'Beasley'),
('1005', 'TOby', 'Flenderson - Fired')

select * from EmployeeErrors

--using Trim, LTRIM, RTRIM
select EmployeeID, TRIM(EmployeeID) as IDTRIM
from EmployeeErrors

select EmployeeID, LTRIM(EmployeeID) as IDTRIM
from EmployeeErrors

select EmployeeID, RTRIM(EmployeeID) as IDTRIM
from EmployeeErrors
*/

/*
--using Replace
select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
from EmployeeErrors

--using Substring
select SUBSTRING(FirstName,1,3)  --starting from the first character, get 3 characters
from EmployeeErrors

select err.FirstName, dem.FirstName
from EmployeeErrors err
join EmployeeDemographics dem
	on err.FirstName = dem.FirstName


Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)


-- Using UPPER and lower

Select firstname, LOWER(firstname)
from EmployeeErrors

Select Firstname, UPPER(FirstName)
from EmployeeErrors
*/

--Stored Procedures
/*
Create Procedure Test
As
select * from EmployeeDemographics

EXEC Test
*/

/*
Create Procedure Temp_Employee
as
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
select JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
from EmployeeDemographics emp
join EmployeeSalary sal
	on emp.EmployeeID = sal.EmployeeID
group by JobTitle

select * from #temp_employee

Exec Temp_Employee @JobTitle = 'Salesman'
*/

/**********************************************************************************************************************************************
Portfolio Project
- go to ourworldindata.org/covid-deaths
- go to the 1st graph "Daily new confoirmed COVID-19 deaths per million people"
- set the start date to the earliest (video's latest is Apr 21, 2021)
- click DOWNLOAD
- open in Excel and reformat
- set the filter
- cut Population (column AS or BK) and Insert after Date (D) and in place of Total_Cases (E)
- go to AA and <Ctrl><Shift><Right> to select everything else and delete it
- Save as "CovidDeaths, your 1st table
- to create the 2nd table <Ctrl><Z> to bring back the data
- go to Z and <Ctrl><Shift><Right> to select to E and delete it
- Save as "CovidVaccinations, your 2nd table
- Now to take these tables to SQL
- In SQL, create a new Database called "PortfolioProject"
- right-click on PortfolioProject -> Tasks -> Import Data (32 bit)
- OR 
- in Windows, Start -> Microsoft SQL 2022 -> Import and Export Data (64 bit)
- place them to the Destination "SQL Server Native Client 11.0" or Microsoft OLE DB Provider for SQL Server
- select the correct Server name; select the Database
- use windows authentication



select * from PortfolioProject.dbo.CovidVaccinations
order by 3,4

select * from PortfolioProject..CovidDeaths
where continent is not null
order by 3,4

--select * from PortfolioProject..CovidVaccinations
--order by 3,4


--select the data that we are going to be using


/*
select location, date, total_cases, new_cases, total_deaths, population 
from PortfolioProject..CovidDeaths
order by 1, 2
*/
--Looking at total cases vs total deaths
--Shows the liklihood of dying if you contract covid in your country
--select location, date, total_cases, total_deaths, (total_deaths) / total_cases))*100 as Death
--select location, date, total_cases, total_deaths, (isnull(total_deaths,1) / isnull(total_cases,1))*100 as Death
select location, date, total_cases, total_deaths, ((CAST([total_deaths] AS FLOAT)) / total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%states%' and continent is not null
order by 1, 2

/*
select COUNT(*)
from PortfolioProject..CovidVaccinations
--where total_cases>0 and continent is not null
--order by 1,2
*/

--Looking at the total cases vs population
select location, date, population, total_cases, (total_cases / population)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
order by 1, 2
-- .
-- Looking at total cases vs population
-- Show what percentage of population got covid
select location, date, population, total_cases, (total_cases / population)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%states%' and continent is not null
order by 1,2
-- .
-- Showing countries with highest death count per population
select location, max(cast(total_deaths AS float)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null
group by location
order by TotalDeathCount desc

-- Countries with the highest infection rate compared to population
select location, population, max(total_cases) as HighestInfectionCount, max((total_cases / population))*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
where continent is not null
group by location, population
order by 1,2



-- Countries with the highest death count per population
select location, max(total_deaths) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null
group by location
order by TotalDeathCount desc


-- Breakdown by continent
select continent, max(cast(total_deaths AS float)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc

--These are the actual counts
select continent, max(cast(total_deaths AS float)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is  null
group by continent
order by TotalDeathCount desc

--but we're going to use NOT null
select continent, max(cast(total_deaths AS float)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc


-- showing the continents with the highest death count per population
select continent, max(cast(total_deaths AS float)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc 

--global numbers
select date, sum(new_cases), sum(cast(new_deaths AS int)), (sum(cast(new_deaths AS int))/sum(new_cases))*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where continent is not null
group by date
order by 1,2

**********************************************************************************************************************************************--*/
/*
--looking at total population vs vaccinations
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations 
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.Location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3
*/

/*
--using this, found out CovidDeaths table is duplicated
select COUNT(*) 
from PortfolioProject..CovidDeaths
where location='Canada' and continent is not null
select COUNT(distinct(DATE))
from PortfolioProject..CovidDeaths
where location='Canada' and continent is not null

select COUNT(*) 
from PortfolioProject..CovidVaccinations
where location='Canada' and continent is not null
select COUNT(distinct(DATE))
from PortfolioProject..CovidVaccinations
where location='Canada' and continent is not null
*/

/*
--look at the data
select COUNT(*)
from PortfolioProject..CovidDeaths
where location='Canada'
order by 1,2,3,4

--find the duplicates
WITH cte AS (
  SELECT*, 
     row_number() OVER(PARTITION BY iso_code, continent, location ORDER BY iso_code, continent, location, date) AS [rn]
  FROM PortfolioProject..CovidDeaths
)
Select * from cte WHERE [rn] <> 1

--The duplicates are for Continent = null, so we keep them

*/

/*
--looking at total population vs vaccinations
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
  --sum of new_vaccinations by location
  SUM(convert(float, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.Location, dea.date) as RollingPeopoleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.Location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3


--Use CTE
with PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopoleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
  --sum of new_vaccinations by location
  SUM(convert(float, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.Location, dea.date) as RollingPeopoleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.Location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
select *, (RollingPeopoleVaccinated/Population)*100 as RollingPeopoleVaccinatedPercentage
from PopvsVac


--with a atemp table
Drop table if exists #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
  --sum of new_vaccinations by location
  SUM(convert(float, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.Location, dea.date) as RollingPeopoleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.Location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

select *, (RollingPeopleVaccinated/Population)*100 as RollingPeopleVaccinatedPercentage
from #PercentPopulationVaccinated

*/

use PortfolioProject
--creating view to store for later visualizations
create view PercentPopulationVaccinated
as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
  --sum of new_vaccinations by location
  SUM(convert(float, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.Location, dea.date) as RollingPeopoleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.Location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3

select * from PercentPopulationVaccinated

