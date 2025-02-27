
WITH demand_skills AS (
        select skill_id,skills, count(sjd.job_id) as demand_count 
    from job_postings_fact as jpf
    inner join skills_job_dim as sjd ON sjd.job_id=jpf.job_id
    INNER JOIN skills_dim as sd ON sd.skill_id=sjd.skill_id
    where jpf.job_title_short= 'Data Analyst'
    and job_work_from_home= TRUE
    GROUP BY skill_id
)

WITH average_salary as (
        select skill_id,skills, round(avg(salary_year_avg), 0) as avg_salary
    from job_postings_fact as jpf
    inner join skills_job_dim as sjd ON sjd.job_id=jpf.job_id
    INNER JOIN skills_dim as sd ON sd.skill_id=sjd.skill_id
    where jpf.job_title_short= 'Data Analyst'
    AND salary_year_avg is NOT NULL
    and job_work_from_home= TRUE
    GROUP BY skill_id
)



/* 
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
v - Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
 offering strategic insights for career development in data analysis
*/