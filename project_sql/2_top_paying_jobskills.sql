-- top paying job skills

WITH top_jobs as (
select job_id,job_title, cd.name as company_name,
salary_year_avg
from job_postings_fact as jpf
LEFT JOIN company_dim as cd ON
cd.company_id=jpf.company_id
where job_title_short LIKE '%Data Analyst%' AND
job_work_from_home= TRUE and salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
limit 10 
)

select top_jobs.* ,skills
from top_jobs
inner join skills_job_dim as sjd ON
sjd.job_id=top_jobs.job_id
INNER JOIN skills_dim as sd ON
sd.skill_id=sjd.skill_id
ORDER BY top_jobs.salary_year_avg DESC


/* What This Query Does:
1️ CTE (top_jobs) → First, it filters and retrieves the top 10 highest-paying Data Analyst jobs, joining with company_dim to get company names.
2️ Main Query → It then joins these top jobs with skills to find out which skills are associated with these highest-paying roles.

