# HR-Dashboard
![Screenshot_20240106_040355](https://github.com/Man-ish743/HR-Employee-Data-Analysis/assets/154724911/2a8ae268-2bb1-4aa5-af2b-c9d2d7bd06a3)


## Objective

This data analysis project aims to provide insights of a company over the distribution of employees on the basis of their age, gender, work location, job titles and work tenure.

## Tools

<p align="left"> <a href="https://www.mysql.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="40" height="40"/>
<a href="https://powerbi.microsoft.com/en-au/" target="_blank" rel="noreferrer"> <img src="https://img.icons8.com/color/1x/power-bi.png" alt="powerbi" width="40" height="40"/>
  

## Data Used

Data - HR Data with over 22000 rows from the year 2000 to 2020.

## Questions

1. What is the gender breakdown of employees in the company?

2. What is the race/ethnicity breakdown of employees in the company?

3. What is the age distribution of employees in the company?

4. How many employees work at headquarters versus remote locations?

5. What is the average length of employment for employees who have been terminated?

6. How does the gender distribution vary across departments and job titles?

7. What is the distribution of job titles across the company?

8. Which department has the highest turnover rate?

9. What is the distribution of employees across locations by state?

10. How has the company's employee count changed over time based on hire and term dates?

11. What is the tenure distribution for each department?

## Summary of Findings

- There are more male employees.
- White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
- The youngest employee is 20 years old and the oldest is 57 years old
- 5 age groups were created (18-24, 25-34, 35-44, 45-54, 55-64). A large number of employees were between 25-34 followed by 35-44 while the smallest group was 55-64.
- A large number of employees work at the headquarters versus remotely.
- The average length of employment for terminated employees is around 7 years.
- The gender distribution across departments is fairly balanced but there are generally more male than female employees.
- The Marketing department has the highest turnover rate followed by Training. The least turn over rate are in the Research and development, Support and Legal departments.
- A large number of employees come from the state of Ohio.
- The net change in employees has increased over the years.
- The average tenure for each department is about 8 years with Legal and Auditing having the highest and Services, Sales and Marketing having the lowest.

## Limitations

- Some records had negative ages and these were excluded during querying(967 records). Ages used were 18 years and above.
- Some termdates were far into the future and were not included in the analysis(1599 records). The only term dates used were those less than or equal to the current date.
