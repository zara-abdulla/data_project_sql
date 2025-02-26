-- This SQL query retrieves the top 10 highest-paying "Data Analyst" job postings that:
-- Have a salary specified (salary_year_avg IS NOT NULL).
-- Are listed as remote jobs (job_location = 'Anywhere').

select job_id, job_title_short,job_title, cd.name as company_name,job_location,job_schedule_type, 
salary_year_avg,job_posted_date
from job_postings_fact as jpf
LEFT JOIN company_dim as cd ON
cd.company_id=jpf.company_id
where job_title_short LIKE '%Data Analyst%' AND
job_location= 'Anywhere' and salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
limit 10
