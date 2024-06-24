/*
    QUERY DESCRIPTION:
        1) Find the most high-paying jobs that are 'Data Engineer'.
        2) Find specific skills that are required for these jobs.
        3) Find the jobs that are avaliable to work 'Remotely'.
        4) Find the companies that offers this services.
        5) Find the jobs whose average_salary is not null.
        6) Find the jobs whose schedule type is 'full-time'.
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        companies.name AS company_name,
        job_title AS title,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim AS companies
        ON companies.company_id = job_postings_fact.company_id     
    WHERE
        job_title_short IN('Data Engineer') AND
        job_work_from_home = true AND
        job_schedule_type = 'Full-time' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10     
)

SELECT 
    top_paying_jobs.*,
    skills 
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id

