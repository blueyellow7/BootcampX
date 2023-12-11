-- get the total number of assistance_requests for 1 teacher

SELECT 
  count(assistance_requests.id) as total_assistances,
  teachers.name as teacher 
FROM assistance_requests 
JOIN teachers ON teachers.id = assistance_requests.teacher_id 
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;


