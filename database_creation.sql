create database student_management_system;
use student_management_system;

show databases;

create table students (
	student_id INT auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) unique not null,
    phone varchar(15) unique not null,
    department varchar(50) not null,
    admission_year INT not null
);

create table courses (
	course_id INT auto_increment primary key,
    course_name varchar(100) not null,
	credits INT not null,
    check (credits > 0)
);

create table faculty (
	faculty_id int auto_increment primary key,
    faculty_name varchar(100) not null,
    email varchar(100) unique not null
);

create table enrollments (
	enrollment_id int auto_increment primary key,
    student_id int not null,
    course_id int not null,
    faculty_id int not null,
    enrollment_date date not null,
    foreign key (student_id) references students (student_id),
    foreign key (course_id) references courses (course_id),
    foreign key (faculty_id) references faculty (faculty_id)
);

create table attendance (
	attendance_id int auto_increment primary key,
    enrollment_id int not null,
    attendance_date date not null,
    status ENUM('Present', 'Absent') not null,
    
    foreign key (enrollment_id) references enrollments(enrollment_id)
);

show tables;
desc attendance;
desc courses;
desc enrollments;
desc faculty;
desc students;


    