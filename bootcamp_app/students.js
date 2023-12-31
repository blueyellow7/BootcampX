// CONFIG 

const { Pool } = require('pg');
const pool = new Pool({
  user: 'neehabaral',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// PROCESS.ARGV 
const args = process.argv.slice(2)

//Values that come from elsewhere (indicated by $ in pool.query code)
const cohortName = args[0];
const limit = args[1] || 5;
const values = [`%${cohortName}%`, limit]

pool.query(`
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1 
LIMIT $2;
`, values) //$1 = values[0], $2 = values[1]
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
}).catch(err => console.error('query error', err.stack));