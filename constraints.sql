CREATE DATABASE db1

USE db1;

-- PARENT TABLE
CREATE TABLE dept(
    d_id INT CONSTRAINT d_pk1 PRIMARY KEY,
    d_name VARCHAR(50) NOT NULL,
)

-- CHILD TABLE
CREATE TABLE employee
(
  e_name VARCHAR(50) NOT NULL,
  e_salary MONEY CONSTRAINT ck1 CHECK(e_salary > 5000),
  e_doj DATE CONSTRAINT cdf1 DEFAULT GETDATE(),
  email VARCHAR(50) CONSTRAINT ck3 CHECK(email LIKE '_%@_%.com') NOT NULL,
  dept_id INT CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES dept(d_id) ON DELETE CASCADE,
  CONSTRAINT pk1 PRIMARY KEY (e_name , email)
);


INSERT INTO dept VALUES 
                 (1, 'MCA') ,
                 (2 , 'BCA') ,
                 (3 , 'M.sc AI') ,
                 (4 , 'M.sc Data Science') ,
                 (5 , 'M.sc Data Science'),
                 (6 , 'M.sc CS')

UPDATE DEPT SET d_name = 'B.sc IT' WHERE d_id = 5;


ALTER TABLE employee ADD CONSTRAINT email_c UNIQUE (email)

INSERT INTO employee VALUES 
                     ('gazi wani' , 70000 , '10-01-2024' , 'gazi@wani.com' , 3) ,
                     ('Anees Long' , 60000 , '11-04-2025' , 'aness@gmail.com' , 6) ,
                     ('Sarfaraz Mir' , 60000 , '11-02-2025' , 'sarfaraz@gmail.com' , 2),
                     ('Asif Hamid' , 509000 , '12-06-2025' , 'asif@abc.com' ,3),
                     ('Sarfaraz Dar' , 60000 , '11-02-2025' , 'saf@dar.com' , 4)

SELECT * FROM dept

SELECT * FROM employee

-- INNER JOIN RETUEN ALL THE MATCHING TUPLES
SELECT e.e_name , e.e_salary  , d.d_name 
       FROM employee e JOIN dept d ON e.dept_id = d.d_id;

-- LEFT JOIN
SELECT e.e_name , e.e_salary  , d.d_name 
       FROM employee e LEFT JOIN dept d ON e.dept_id = d.d_id;

-- RIGHT JOIN
SELECT e.e_name , e.e_salary  , d.d_name 
       FROM employee e RIGHT JOIN dept d ON e.dept_id = d.d_id;

-- FULL JOIN 
SELECT * FROM employee e FULL JOIN dept d on e.dept_id = d.d_id;

-- CROSS JOIN
SELECT * FROM employee , dept

-- CREATE VIEW SINGLE TABLE
CREATE VIEW e1 as 
   SELECT * FROM employee  WHERE e_salary > 100000
  
SELECT * FROM e1

-- CREATE VIEW FROM MULT TABLE 
CREATE VIEW e2 as
   SELECT e.e_name , e.e_salary  , d.d_name 
       FROM employee e JOIN dept d ON e.dept_id = d.d_id;
  
SELECT * FROM e2 WHERE e_name LIKE ('A_%')