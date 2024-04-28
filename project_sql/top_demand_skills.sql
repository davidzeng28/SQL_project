/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/


select 
    skills,
    count(skills_job_dim.skill_id) as demand_counts

from job_postings_fact 
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

where job_title_short ='Data Analyst'
group by skills

order by demand_counts desc limit 5;
/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

[
  {
    "skills": "sql",
    "demand_counts": "92628"
  },
  {
    "skills": "excel",
    "demand_counts": "67031"
  },
  {
    "skills": "python",
    "demand_counts": "57326"
  },
  {
    "skills": "tableau",
    "demand_counts": "46554"
  },
  {
    "skills": "power bi",
    "demand_counts": "39468"
  }
]
*/
