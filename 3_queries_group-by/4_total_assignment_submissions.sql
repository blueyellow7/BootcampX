-- get the total number of assignment submissions for each cohort.
-- order from most to least number of submissions

SELECT cohorts.name as cohort, count(assignment_submissions.*) as total_submissions 
FROM cohorts 
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON students.id = student_id
GROUP BY cohort
HAVING count(students.*) >= 18
ORDER BY total_submissions DESC;

