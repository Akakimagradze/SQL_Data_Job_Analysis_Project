/*
    QUERY DESCRIPTION:
        1) What are the most in-demand skill for data analyst.
        2) Identify the top 5 in-demand skills for data analyst.
        3) Focus on all job postings.
        4) Jobs that are avaliable to work 'Remotely'
        5) Jobs that are located in New York
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE  
    job_title_short = 'Data Analyst' AND
    job_location IN('New York, NY')
GROUP BY
    skills  
ORDER BY
    demand_count DESC 

