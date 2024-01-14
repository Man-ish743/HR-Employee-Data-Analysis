create database projects;

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



	





