use student_management_system;

-- Category A: Basic Queries

-- display all students
select * from students;

-- display students from IT department
select * from students
where department = 'IT';

-- Display Students Admitted in 2022
select * from students
where admission_year = 2022;

-- Display Courses with More Than 3 Credits
select * from courses 
where credits > 3;

-- Sort Students by First Name
select * from students
order by first_name;


-- Category B: JOIN Queries

-- Student and Their Courses
select
	s.first_name,
	s.last_name,
    c.course_name
from enrollments e
join students s
on e.student_id = s.student_id
join courses c
on e.course_id = c.course_id;

-- Student, Course and Faculty
select
	s.first_name,
	s.last_name,
    c.course_name,
    f.faculty_name
from enrollments e
join students s
on e.student_id = s.student_id
join courses c
on e.course_id = c.course_id
join faculty f
on e.faculty_id = f.faculty_id;

-- Attendance Records with Student Names
select
	s.first_name,
    s.last_name,
    a.attendance_date,
    a.status
from attendance a
join enrollments e
on a.enrollment_id = e.enrollment_id
join students s
on e.student_id = s.student_id;

-- Courses Taken by Rutuja
select 
	c.course_name
from enrollments e
join students s
on e.student_id = s.student_id
join courses c
on e.course_id = c.course_id
where s.first_name = 'Rutuja';

-- Faculty Teaching Each Course
select distinct 
	f.faculty_name,
    c.course_name
from enrollments e
join faculty f
on e.faculty_id = f.faculty_id
join courses c
on e.course_id = c.course_id;

-- advanced queries
-- Number of Students per Course
SELECT
    c.course_name,
    COUNT(*) AS student_count
FROM Enrollments e
JOIN Courses c
ON e.course_id = c.course_id
GROUP BY c.course_name;

-- Courses with More Than 10 Students
select
	c.course_name,
    count(*) as student_count
from enrollments e
join courses c
on e.course_id = c.course_id
group by c.course_name
having student_count > 10;

-- Faculty-wise Student Count
select 
	f.faculty_name,
    count(*) as student_count
from enrollments e
join faculty f
on e.faculty_id = f.faculty_id
group by faculty_name;

-- Total Present Days per Student
select 
	s.first_name,
    count(*) as present_days
from attendance a
join enrollments e
on a.enrollment_id = e.enrollment_id
join students s
on e.student_id = s.student_id
where a.status = 'Present'
group by s.student_id, s.first_name;

-- Total Absent Days per Student
select 
	s.first_name,
    count(*) as absent_days
from attendance a
join enrollments e
on a.enrollment_id = e.enrollment_id
join students s
on e.student_id = s.student_id
where a.status = 'Absent'
group by s.student_id, s.first_name;

-- Attendance Percentage of Each Student
select
	s.student_id,
    s.first_name,
    ROUND(
        SUM(CASE
                WHEN a.status = 'Present' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
        2
    ) AS attendance_percentage
from attendance a
join enrollments e
on a.enrollment_id = e.enrollment_id
join students s
on e.student_id = s.student_id
group by s.student_id, s.first_name;

-- Students with Attendance Below 75%
select
	s.student_id,
    s.first_name,
    round(
		sum(case 
				when a.status = 'Present' THEN 1
                else 0
			end) * 100.0 / count(*),
		2
	) as attendance_percentage
from attendance a
join enrollments e
on a.enrollment_id = e.enrollment_id
join students s
on e.student_id = s.student_id
group by s.student_id, s.first_name
having attendance_percentage < 75;

-- Student with Highest Attendance
select
	s.student_id,
    s.first_name,
    count(*) as present_days
from attendance a
join enrollments e
on a.enrollment_id = e.enrollment_id
join students s
on e.student_id = s.student_id
where a.status = 'Present'
group by s.student_id, s.first_name
order by present_days DESC
LIMIT 1;

-- Most Popular Course
select
    c.course_name,
    count(*) as student_count
from enrollments e
join courses c
on e.course_id = c.course_id
group by c.course_name
order by student_count DESC
limit 1;

-- Least Popular Course
select
	c.course_name,
    count(*) as student_count
from enrollments e
join courses c
on e.course_id = c.course_id
group by c.course_name
order by student_count 
limit 1;
    
    
            