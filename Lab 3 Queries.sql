USE Employees;

-- Remove data from tables
DELETE FROM Timesheet;
DELETE FROM Employee;
DELETE FROM Job;

-- Drop tables
DROP TABLE Timesheet;
DROP TABLE Employee;
DROP TABLE Job;

-- Didn't see fit to include code from previous assignment to set-up tables

-- Question 2: Order tables were dropped: Timesheet, Employee, then Job
-- The order in which these 3 tables were dropped were important due to 
-- referential integrity. 

CREATE TABLE Earnings(
	EmpID numeric(5) NOT NULL,
	PayWeekEndDate date NOT NULL,
	RegEarnings numeric(6,2),
	OTimeEarnings numeric(6,2),
	PRIMARY KEY (EmpID, PayWeekEndDate),
	-- Foreign Key is the composite key
	FOREIGN KEY (PayWeekEndDate, EmpID) REFERENCES Timesheet(PayWeekEndDate, EmpID)
);

CREATE TABLE Deductions(
	EmpID numeric(5) NOT NULL,
	PayWeekEndDate date NOT NULL,
	EI numeric(5,2),
	CPP numeric(5,2),
	UnionDues numeric(5,2),
	PensionPlan numeric(5,2),
	IncomeTax numeric(6,2),
	PRIMARY KEY (EmpID, PayWeekEndDate),
	-- Foreign Key is the composite key
	FOREIGN KEY (PayWeekEndDate, EmpID) REFERENCES Timesheet(PayWeekEndDate, EmpID)
);

-- Insert records into Earnings table
INSERT INTO earnings VALUES (33982,'23-May-03',770.4,0);
INSERT INTO earnings VALUES (33982,'30-May-03',736.7,0);
INSERT INTO earnings VALUES (51537,'23-May-03',314.01,0);
INSERT INTO earnings VALUES (41822,'23-May-03',465.2,0);
INSERT INTO earnings VALUES (41822,'30-May-03',441.94,29.08);
INSERT INTO earnings VALUES (3571,'23-May-03',1296,0);
INSERT INTO earnings VALUES (3571,'30-May-03',1296,0);
INSERT INTO earnings VALUES (85833,'23-May-03',1056.38,28.17);
INSERT INTO earnings VALUES (85833,'30-May-03',619.74,0);
INSERT INTO earnings VALUES (81216,'23-May-03',503.2,0);
INSERT INTO earnings VALUES (32177,'23-May-03',756.4,141.83);
INSERT INTO earnings VALUES (32177,'30-May-03',756.4,85.1);
INSERT INTO earnings VALUES (52421,'23-May-03',148.5,0);
INSERT INTO earnings VALUES (52421,'30-May-03',270,60.75);
INSERT INTO earnings VALUES (72690,'23-May-03',243,0);
INSERT INTO earnings VALUES (72201,'30-May-03',160.02,0);

-- Insert records into Deductions table
INSERT INTO Deductions VALUES (33982,'23-May-03',11.56,19.26,38.52,7.7,130.97);
INSERT INTO Deductions VALUES (33982,'30-May-03',11.05,18.42,36.84,7.37,125.24);
INSERT INTO Deductions VALUES (51537,'23-May-03',4.71,7.85,15.7,3.14,53.38);
INSERT INTO Deductions VALUES (41822,'23-May-03',6.98,11.63,23.26,4.65,79.08);
INSERT INTO Deductions VALUES (41822,'30-May-03',7.07,11.78,23.55,4.71,80.07);
INSERT INTO Deductions VALUES (3571,'23-May-03',19.44,32.4,64.8,12.96,220.32);
INSERT INTO Deductions VALUES (3571,'30-May-03',19.44,32.4,64.8,12.96,220.32);
INSERT INTO Deductions VALUES (85833,'23-May-03',16.27,27.11,54.23,10.85,184.37);
INSERT INTO Deductions VALUES (85833,'30-May-03',9.3,15.49,30.99,6.2,105.36);
INSERT INTO Deductions VALUES (81216,'23-May-03',7.55,12.58,25.16,5.03,85.54);
INSERT INTO Deductions VALUES (32177,'23-May-03',13.47,22.46,44.91,8.98,152.7);
INSERT INTO Deductions VALUES (32177,'30-May-03',12.62,21.04,42.08,8.42,143.06);
INSERT INTO Deductions VALUES (52421,'23-May-03',2.23,3.71,7.43,1.49,25.25);
INSERT INTO Deductions VALUES (52421,'30-May-03',4.96,8.27,16.54,3.31,56.23);
INSERT INTO Deductions VALUES (72690,'23-May-03',3.65,6.08,12.15,2.43,null);
INSERT INTO Deductions VALUES (72201,'30-May-03',2.4,4,8,1.6,null);

-- Question 5: I created the Earnings table first, then the Deductions table. The order is not 
-- important in this case as they both contain the same reference and don't reference one another.

-- Question 6: I would not have been able to create these tables before the Job, Employee, and 
-- Timesheet tables because they depend on the Timesheet table which depends on the Employee
-- table which depends on the Job table. In two words: Referential 'tegrity

-- Question 7
SELECT * FROM Earnings;

-- Question 8
-- https://stackoverflow.com/questions/18298433/how-can-i-show-the-table-structure-in-sql-server-query/25416058
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Deductions'

-- Question 9
SELECT GETDATE();

-- Question 10
UPDATE Employee SET Province = 'NF' WHERE EmpID = 52421;
UPDATE Employee SET Province = 'NF' WHERE EmpID = 85833;
UPDATE Employee SET Province = 'NF' WHERE EmpID = 32177;

-- Question 11
DELETE FROM Employee WHERE IncomeTax = 'N';