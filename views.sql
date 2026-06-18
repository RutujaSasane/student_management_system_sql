use student_management_system;

-- Student Enrollment View
create view student_enrollment_view as
select
	s.student_id,
    concat(s.first_name, ' ', s.last_name) as student_name,
    c.course_name,
    f.faculty_name,
    e.enrollment_date
from enrollments e
join students s
on e.student_id = s.student_id
join courses c
on e.course_id = c.course_id
join faculty f
on e.faculty_id = f.faculty_id;

select * from student_enrollment_view;

-- Attendance summary view
create view attendance_summary_percentage as
select 
	s.student_id,
    concat(s.first_name, ' ', s.last_name) as student_name,
    round(
		sum(case
				when a.status = 'Present' then 1
                else 0
			end
			)*100.0 / count(*),
            2) as attendance_percentage
from attendance a
join enrollments e
on a.enrollment_id = e.enrollment_id
join students s
on e.student_id = s.student_id
group by
	s.student_id,
	s.first_name,
    s.last_name;
    
select * from attendance_summary_percentage;
    
    
-- Course Enrollment Summary View
create view course_enrollment_summary_view as
select
	c.course_id,
    c.course_name,
    count(*) as total_students
from enrollments e
join courses c
on e.course_id = c.course_id
group by 
	c.course_id,
    c.course_name;
    
select * from course_enrollment_summary_view;

show full tables;
