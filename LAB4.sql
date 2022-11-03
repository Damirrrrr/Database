---№1
select *
from course
where credits > 3;

select *
from classroom
where (building = 'Watson') or (building = 'Packard');

select *
from course
where dept_name = 'Comp. Sci.';

select *
from course join section
on course.course_id = section.course_id
where semester = 'Fall';

select *
from student
where tot_cred > 45 and tot_cred < 90;

select distinct name
from student
where name like '%a'
or name like '%e'
or name like '%i'
or name like '%o'
or name like '%u'
order by name;

select *
from course join prereq as p
on course.course_id = p.course_id
where prereq_id = 'CS-101';

---№2
SELECT dept_name, avg(salary) as average_salary
from instructor
GROUP BY dept_name
ORDER BY average_salary;

SELECT building, count(building) as cnt
FROM section
GROUP BY building
ORDER BY cnt DESC
LIMIT 1;

SELECT dept_name, count(course.dept_name) as cnt
FROM course
GROUP BY dept_name
ORDER BY cnt ASC
LIMIT 1;

SELECT id, name
FROM student
WHERE id IN
      (SELECT id FROM takes WHERE course_id IN
      (SELECT course_id FROM course WHERE course.dept_name = 'Comp. Sci.')
            GROUP BY id
            HAVING COUNT(*) > 3);

SELECT name, id
FROM instructor
WHERE dept_name = 'Biology' OR dept_name = 'Philosophy' OR dept_name = 'Music'
ORDER BY id;

SELECT name, id
FROM instructor
WHERE id IN (SELECT id FROM teaches WHERE year = 2018
                                    EXCEPT(SELECT id FROM teaches WHERE year = 2017))
ORDER BY id;

---№3

SELECT *
FROM student
WHERE id IN(SELECT id FROM takes WHERE dept_name = 'Comp. Sci.'
                                   AND (grade = 'A' or grade = 'A-'))
ORDER BY name;

SELECT DISTINCT i_id
FROM advisor WHERE s_id IN(SELECT id FROM takes WHERE grade != 'B+' or grade != 'A-' or grade != 'A');

SELECT DISTINCT dept_name
FROM course
WHERE course_id not IN(SELECT course_id FROM takes
                                    GROUP BY course_id, grade
                                    HAVING grade = 'F'
                                      or grade = 'C-'
                                      or grade = 'C'
                                      or grade = 'C+');

SELECT *
FROM instructor

