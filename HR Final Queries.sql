```create database projects;

use projects;

select * from hr;

alter table hr
change column ï»¿id emp_id varchar(20) null;

select * from hr;

select birthdate from hr;

desc hr;

update hr
set birthdate = case
                    when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
                    when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'), '%Y-%m-%d')
                    else null
                    end;
                    
select birthdate from hr;

alter table hr
modify birthdate date;

select hire_date from hr;

update hr
set hire_date = case
                    when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'), '%Y-%m-%d')
                    when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'), '%Y-%m-%d')
                    else null
                    end;

select hire_date from hr;

alter table hr
modify hire_date date;

-- now termination date

select termdate from hr; 

update hr
set termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))	
where termdate is not null and termdate!='';	

alter table hr
modify column termdate date; 
 
 SET SQL_MODE = '' ;

select termdate from hr; 

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

select * from hr;

desc hr;

alter table hr
modify column termdate date;

-- now to calculate the age add new column

ALTER TABLE hr
ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR,birthdate,CURDATE());

SELECT birthdate,age FROM hr;

SELECT 
   min(age) AS youngest,
   max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr
WHERE age<18; -- TO EXCLUDE LATER FROM THE DATA

-- QUESTIONS

-- 1 What is the gender breakdown  of employees in the company?

SELECT gender, COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate ='0000-00-00'
GROUP BY gender;

-- 2 What is the race/ethinicity breakdown of employees in the company?

SELECT race, COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate ='0000-00-00'
GROUP BY race
ORDER BY COUNT(*) DESC;

-- 3 What is the age distribution of employees in the company?

SELECT
    min(age) AS youngest,
    max(age) AS oldest
FROM hr
WHERE age >=18 AND termdate ='0000-00-00'

SELECT
	CASE 
          WHEN age>=18 AND age<=24 THEN '18-24'
          WHEN age>=25 AND age<=34 THEN '25-34'
		  WHEN age>=35 AND age<=44 THEN '35-44'
		  WHEN age>=45 AND age<=54 THEN '44-54'
		  WHEN age>=55 AND age<=64 THEN '55-64'
		  ELSE '65+'
	  END AS age_group,
      COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate ='0000-00-00'
GROUP BY age_group
ORDER BY age_group;


SELECT
	CASE 
          WHEN age>=18 AND age<=24 THEN '18-24'
          WHEN age>=25 AND age<=34 THEN '25-34'
		  WHEN age>=35 AND age<=44 THEN '35-44'
		  WHEN age>=45 AND age<=54 THEN '44-54'
		  WHEN age>=55 AND age<=64 THEN '55-64'
		  ELSE '65+'
	  END AS age_group, gender,
      COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate ='0000-00-00'
GROUP BY age_group,gender
ORDER BY age_group,gender;

-- 4 How many employees work at headquarters versus remote location?

SELECT location, COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate ='0000-00-00'
GROUP BY location;

-- 5 What is the average length of employment for employees who have been terminated?

SELECT
  round(AVG(DATEDIFF(termdate,hire_date))/365,0) as avg_length_employment
FROM hr
WHERE termdate<=curdate() and termdate!='0000-00-00' and age>=18;

-- 6 How does the gender distribution vary across departments and job title?
select * from hr;

SELECT department, gender,COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate ='0000-00-00' 
GROUP BY department,gender
ORDER BY department;

-- 7 What is the  distribution  of job titles across the company?

SELECT jobtitle,COUNT(*) AS count
FROM hr
WHERE age >=18 AND termdate ='0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle DESC;

-- 8 Which department has the highest turnover rate?

SELECT department,
total_count,
termination_count,
termination_count/total_count as termination_rate
FROM
(SELECT department,COUNT(*) AS total_count,
SUM(CASE WHEN termdate<>'0000-00-00' AND termdate<=CURDATE() THEN 1
        ELSE 0
        END) AS termination_count
FROM hr
WHERE age>=18
GROUP BY department) AS subquery
ORDER BY termination_rate DESC;

-- 9 What is distribution  of employees across  location by city and state?

select * from hr;

SELECT location_state,COUNT(*) AS count
FROM hr 
WHERE age >=18 AND termdate ='0000-00-00'
GROUP BY location_state
ORDER BY count DESC;

-- 10 How has the company's employee count changed over time based on hire and term dates?

SELECT year,
hires,termination,
(hires-termination) AS net_change,
round((hires-termination)/hires*100,2) AS net_change_percent
FROM
(SELECT 
YEAR(hire_date) AS year,
COUNT(*) hires,
SUM(CASE WHEN termdate <>'0000-00-00' AND termdate<=CURDATE() THEN 1 ELSE 0 END ) AS termination
FROM hr
WHERE age>=18
GROUP BY year
) AS subquery
ORDER BY year ASC;

-- 11 What is the tenure distribution across each department?

SELECT department,ROUND(AVG(DATEDIFF(termdate,hire_date)/365),0) AS avg_tenure
FROM hr
WHERE age>=18 AND termdate<>'0000-00-00' AND termdate<=CURDATE()
GROUP BY department;```
