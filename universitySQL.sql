use university

-- PARENT TABLE
CREATE TABLE course (
  course_id INT CONSTRAINT course_pk PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
)

-- CHILD TABLE
create TABLE student (
  stud_id INT CONSTRAINT stud_pk PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  roll_no INT CONSTRAINT uq_roll_no UNIQUE NOT NULL,
  class VARCHAR(50),
  course_id INT CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE
)

INSERT INTO course VALUES  
    (101, 'Introduction to Computer Science' , 'Dr Aqib')

-- ALTER TABLE
ALTER TABLE course ADD faculty_name VARCHAR(50);

SELECT * FROM course

SELECT * FROM student

-- UPDATE 
UPDATE course SET faculty_name = 'Dr. Smith' WHERE course_id = 101;
UPDATE course SET faculty_name = 'Prof. Johnson' WHERE course_id = 102;
UPDATE course SET faculty_name = 'Ms. Davis' WHERE course_id = 103;
UPDATE course SET faculty_name = 'Dr. Brown' WHERE course_id = 104;

INSERT INTO student VALUES
    (1, 'Aariz Ahmed Bhat', 1001, '10TH', 101),
    (2, 'Zoya Ali Rather', 1002, '11TH', 101)

-- DROP ATRRIBUTE QUERY
ALTER TABLE student drop COLUMN class

-- DROP TABLE QUERY
-- DROP TABLE student

-- SUB QUERY (SINGLE ATTRIBUTE CHECK)
SELECT name as student_name , stud_id FROM  student  WHERE course_id = 
(SELECT course_id from course WHERE title = 'Introduction to Computer Science' );

SELECT * FROM student;
SELECT * FROM course;

SELECT  name as student_name , stud_id  FROM
student JOIN course ON student.course_id = course.course_id WHERE course.title = 'Introduction to Computer Science';

SELECT * FROM student;
SELECT * FROM course;

SELECT stud_id , name , roll_no , title AS course_name FROM
student LEFT JOIN course ON student.course_id = course.course_id


SELECT * FROM student;
SELECT * FROM course;


SELECT stud_id , name , roll_no , title AS course_name FROM
student RIGHT JOIN course ON student.course_id = course.course_id;

SELECT stud_id , name , roll_no , title = 'course_name' FROM
student s FULL JOIN course c ON s.course_id = c.course_id;

SELECT * FROM student,course;

SELECT * FROM course CROSS JOIN student where title = 'Introduction to Computer Science';
-- CHECK CASCADE ERROR
DELETE FROM course WHERE course_id = 101; 
SELECT * FROM student;