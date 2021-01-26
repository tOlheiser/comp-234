USE Saskpoly

-- Tables - The create statement

CREATE TABLE Student(
ID int NOT NULL,
LastName nvarchar(35) NOT NULL,
FirstName nvarchar(40),
[Address] nvarchar(255),
PRIMARY KEY (ID)
);

-- To delete a table we use the DROP Command

-- DROP Table Student;

CREATE TABLE Course(
CourseCode CHAR(7) NOT NULL,
Title nvarchar(50) NOT NULL,
Fee money, 
Instructor int,
PRIMARY KEY (CourseCode)
);

CREATE TABLE Student_Course(
CourseCode CHAR(7) NOT NULL,
StudentID int NOT NULL,
-- Composite Key
PRIMARY KEY (CourseCode, StudentID),
FOREIGN KEY (StudentID) REFERENCES Student(ID),
FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

--Create some data! Lets use the Insert command

INSERT INTO Student(ID, LastName, FirstName, [Address])
	VALUES (1, 'Kaur', 'Valarie', '123 15th Avenue');

-- Technically change the order (not standard practice)
INSERT INTO Student("Address", LastName, FirstName, ID)
VALUES('662 Rivermill', 'Grint', 'Rupert', 2);

-- Shortform
INSERT INTO Student VALUES (3, 'Grape', 'Gilbert', '2 Huxley Road');

-- Register students into course
INSERT INTO Student_Course VALUES ('COMP123', 1)
INSERT INTO Student_Course VALUES ('COMP123', 2)
INSERT INTO Student_Course VALUES ('COMP123', 3)
INSERT INTO Student_Course VALUES ('COMP122', 1)
INSERT INTO Student_Course VALUES ('COMP122', 2)
INSERT INTO Student_Course VALUES ('COMP122', 3)

-- We need to insert into the course table first!
-- // referential integrity

INSERT INTO Course VALUES ('COMP123', 'Intro to Business Computing', '850.00', 1);
INSERT INTO Course VALUES ('COMP122', 'Intro to Java', '850.00', 2);
INSERT INTO Course VALUES ('COMP255', 'OOP with Java', '850.00', 2);

-- Referential Integrity

-- To remove records AKA rows, use DELETE Command

DELETE FROM Course WHERE CourseCode = 'COMP255';