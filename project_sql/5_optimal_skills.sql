
WITH demand_skills AS (
    select skills_dim.skill_id, 
    skills_dim.skills, 
    count(skills_job_dim.job_id) as demand_count 
    from job_postings_fact as jpf
    inner join skills_job_dim ON skills_job_dim.job_id=jpf.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
    where jpf.job_title_short= 'Data Analyst'
    and job_work_from_home= TRUE  
    AND salary_year_avg is NOT NULL
    GROUP BY skills_dim.skill_id
)

, average_salary as (
    select skills_job_dim.skill_id,
    round(avg(jpf.salary_year_avg), 0) as avg_sal
    from job_postings_fact as jpf
    inner join skills_job_dim ON skills_job_dim.job_id=jpf.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
    where jpf.job_title_short= 'Data Analyst'
    AND salary_year_avg is NOT NULL
    and job_work_from_home= TRUE
    GROUP BY skills_job_dim.skill_id
)

SELECT demand_skills.skill_id,
    demand_skills.skills as skill_name,
    demand_count, avg_sal
    from demand_skills
    inner join average_salary on 
    average_salary.skill_id=demand_skills.skill_id
    ORDER BY demand_count DESC, avg_sal DESC
    LIMIT 25;




/* 
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
v - Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
 offering strategic insights for career development in data analysis
*/


SELECT 
    skills_dim.skill_id, 
    skills_dim.skills AS skill_name, 
    COUNT(skills_job_dim.job_id) AS demand_count, 
    ROUND(AVG(jpf.salary_year_avg), 0) AS avg_sal
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim ON skills_job_dim.job_id = jpf.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
    AND jpf.job_work_from_home = TRUE  
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
ORDER BY demand_count DESC, avg_sal DESC
LIMIT 25;