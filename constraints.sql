CREATE DATABASE db1

CREATE TABLE employee
(
  e_id INT CONSTRAINT pk1 PRIMARY KEY,
  e_name VARCHAR(50) NOT NULL,
  e_salary MONEY CONSTRAINT ck1 CHECK(e_salary > 5000),
  e_doj DATE CONSTRAINT cdf1 DEFAULT GETDATE(),
  email VARCHAR(50) CONSTRAINT ck3 CHECK(email LIKE '_%@_%.com')
);

INSERT INTO employee VALUES (1 , 'Gazi' , 8000 , default , 'gaziwani@gamil.com')

SELECT * FROM employee

ALTER TABLE employee ADD CONSTRAINT check2 CHECK (e_name LIKE ['']);

-- WITHOUT CONDITION IT WILL UPDATE ALL THE VALUES OF THAT ATTIRBUTE
UPDATE employee SET e_name = 'wani' WHERE e_id = 1;

-- [NOTE] 'IS' IS USED WITH NULL 
UPDATE employee SET e_name = 'wani' WHERE email IS NULL;




