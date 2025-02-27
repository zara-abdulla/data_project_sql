
select skills, round(avg(salary_year_avg), 0) as avg_salary
from job_postings_fact as jpf
inner join skills_job_dim as sjd ON sjd.job_id=jpf.job_id
INNER JOIN skills_dim as sd ON sd.skill_id=sjd.skill_id
where jpf.job_title_short= 'Data Analyst'
AND salary_year_avg is NOT NULL
and job_work_from_home= TRUE
GROUP BY skills
ORDER BY avg_salary DESC
limit 25;

/*
This query retrieves the top 25 highest-paying skills for remote "Data Analyst" jobs,
based on the average salary.
Which skills are associated with the highest salaries in remote Data Analyst jobs.
How much (on average) a Data Analyst with a specific skill earns.

1.Look at the average salary associated with each skill for Data Analyst positions
2.Focuses on roles with specified salaries, regardless of location
3.Why? It reveals how different skills impact salary levels for Data Analysts and helps identify 
the most financially rewarding skills to acquire or improve