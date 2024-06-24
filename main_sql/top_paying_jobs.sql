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

