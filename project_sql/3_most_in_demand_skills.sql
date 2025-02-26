
select skills, count(sjd.job_id) as demand_count 
from job_postings_fact as jpf
inner join skills_job_dim as sjd ON sjd.job_id=jpf.job_id
INNER JOIN skills_dim as sd ON sd.skill_id=sjd.skill_id
where jpf.job_title_short= 'Data Analyst'
and jpf.job_location='Anywhere'
GROUP BY skills
ORDER BY demand_count DESC
limit 10;

/* 

What This Query Shows:
➡ The top 10 most required skills for Data Analyst remote/flexible jobs.
➡ How many job postings require each skill (demand_count).

