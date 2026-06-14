use student_management_system;

insert into courses (course_name, credits) values
	('Database Management Systems', 4),
    ('Machine Learning', 4),
    ('Operating Systems', 3),
    ('Computer Networks', 3),
    ('Cloud Computing', 4);
    
select * from courses;

insert into faculty (faculty_name, email) values
	('Dr. Sharma', 'sharma@college.edu'),
	('Dr. Patil', 'patil@college.edu'),
	('Dr. Kulkarni', 'kulkarni@college.edu'),
	('Dr. Joshi', 'joshi@college.edu'),
	('Dr. Deshmukh', 'deshmukh@college.edu');

select * from faculty;

insert into students (first_name, last_name, email, phone, department, admission_year) values
	('Rutuja','Sasane','rutuja1@gmail.com','9876500001','IT',2022),
	('Rahul','Patil','rahul1@gmail.com','9876500002','IT',2022),
	('Priya','Sharma','priya1@gmail.com','9876500003','IT',2022),
	('Amit','Joshi','amit1@gmail.com','9876500004','IT',2022),
	('Sneha','Kulkarni','sneha1@gmail.com','9876500005','IT',2022),
	('Rohan','Deshmukh','rohan1@gmail.com','9876500006','IT',2022),
	('Pooja','Jadhav','pooja1@gmail.com','9876500007','IT',2022),
	('Kunal','Pawar','kunal1@gmail.com','9876500008','IT',2022),
	('Neha','More','neha1@gmail.com','9876500009','IT',2022),
	('Aditya','Chavan','aditya1@gmail.com','9876500010','IT',2022),
	('Anjali','Patil','anjali1@gmail.com','9876500011','IT',2022),
	('Saurabh','Shinde','saurabh1@gmail.com','9876500012','IT',2022),
	('Komal','Gaikwad','komal1@gmail.com','9876500013','IT',2022),
	('Nikhil','Mane','nikhil1@gmail.com','9876500014','IT',2022),
	('Aarti','Bhosale','aarti1@gmail.com','9876500015','IT',2022),
	('Vikas','Salunkhe','vikas1@gmail.com','9876500016','IT',2022),
	('Megha','Kadam','megha1@gmail.com','9876500017','IT',2022),
	('Akash','Wagh','akash1@gmail.com','9876500018','IT',2022),
	('Shruti','Patil','shruti1@gmail.com','9876500019','IT',2022),
	('Yash','Ghorpade','yash1@gmail.com','9876500020','IT',2022);
    
select * from students;
select count(*) from students;
SELECT COUNT(*) FROM Courses;
SELECT COUNT(*) FROM Faculty;

insert into Enrollments
(student_id, course_id, faculty_id, enrollment_date)
VALUES
(1,1,1,'2025-01-10'),
(1,2,2,'2025-01-10'),
(1,5,5,'2025-01-10'),

(2,1,1,'2025-01-10'),
(2,3,3,'2025-01-10'),

(3,2,2,'2025-01-10'),
(3,4,4,'2025-01-10'),
(3,5,5,'2025-01-10'),

(4,1,1,'2025-01-10'),
(4,2,2,'2025-01-10'),

(5,3,3,'2025-01-10'),
(5,4,4,'2025-01-10'),
(5,5,5,'2025-01-10'),

(6,1,1,'2025-01-10'),
(6,2,2,'2025-01-10'),

(7,2,2,'2025-01-10'),
(7,3,3,'2025-01-10'),
(7,5,5,'2025-01-10'),

(8,1,1,'2025-01-10'),
(8,4,4,'2025-01-10'),

(9,1,1,'2025-01-10'),
(9,3,3,'2025-01-10'),
(9,5,5,'2025-01-10'),

(10,2,2,'2025-01-10'),
(10,4,4,'2025-01-10'),

(11,1,1,'2025-01-10'),
(11,2,2,'2025-01-10'),
(11,3,3,'2025-01-10'),

(12,3,3,'2025-01-10'),
(12,4,4,'2025-01-10'),

(13,2,2,'2025-01-10'),
(13,5,5,'2025-01-10'),

(14,1,1,'2025-01-10'),
(14,4,4,'2025-01-10'),
(14,5,5,'2025-01-10'),

(15,2,2,'2025-01-10'),
(15,3,3,'2025-01-10'),

(16,1,1,'2025-01-10'),
(16,5,5,'2025-01-10'),

(17,2,2,'2025-01-10'),
(17,3,3,'2025-01-10'),
(17,4,4,'2025-01-10'),

(18,1,1,'2025-01-10'),
(18,2,2,'2025-01-10'),

(19,3,3,'2025-01-10'),
(19,4,4,'2025-01-10'),
(19,5,5,'2025-01-10'),

(20,1,1,'2025-01-10'),
(20,2,2,'2025-01-10'),
(20,3,3,'2025-01-10');


SELECT COUNT(*) FROM Enrollments;
    
select * from enrollments limit 10;

select
	s.first_name,
	c.course_name,
    f.faculty_name
from enrollments e
join students s
on e.student_id = s.student_id
join courses c
on e.course_id = c.course_id
join faculty f
on e.faculty_id = f.faculty_id
limit 10;

create table numbers (
	num INT primary key
);

INSERT INTO Numbers VALUES
(1),(2),(3),(4),(5),
(6),(7),(8),(9),(10);

select * from numbers;

INSERT INTO Attendance
(enrollment_id, attendance_date, status)

SELECT
    e.enrollment_id,

    DATE_ADD('2025-02-01',
             INTERVAL n.num DAY),

    CASE
        WHEN MOD(e.enrollment_id + n.num, 5) = 0
        THEN 'Absent'
        ELSE 'Present'
    END

FROM Enrollments e
CROSS JOIN Numbers n;

SELECT COUNT(*) FROM Attendance;

SELECT *
FROM Attendance
LIMIT 20;

show tables;
drop table numbers;
show tables;

