SELECT
    assignments.id as assignment_id,
    assignments.day,
    assignments.chapter,
    assignments.name as assignment_name,
    count(assistance_requests.id) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assistance_requests.assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;