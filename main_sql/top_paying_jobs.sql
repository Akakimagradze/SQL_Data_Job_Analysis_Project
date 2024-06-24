/*
    QUERY DESCRIPTION:
        1) Find the top 10 most high-paying jobs that are 'Data Analyst'.
        2) Find the jobs that are avaliable to work 'Remotely'.
        3) Find the companies that offers this services.
        4) Find the jobs whose average_salary is not null.
        5) Find the jobs whose schedule type is 'full-time'.
*/

SELECT 
    JPF.job_id AS id,
    companies.name AS company_name,
    JPF.job_title AS title,
    JPF.job_location AS location,
    JPF.job_schedule_type AS schedule_type,
    JPF.salary_year_avg,
    JPF.job_posted_date AS post_date
FROM
    job_postings_fact AS JPF
LEFT JOIN company_dim AS companies
    ON companies.company_id = JPF.company_id     
WHERE
    job_title_short IN('Data Analyst') AND
    (job_work_from_home = true AND job_location = 'Anywhere') AND
    job_schedule_type = 'Full-time' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10 

