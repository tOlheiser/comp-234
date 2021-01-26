USE Employees

-- Step 1: Create tables

CREATE TABLE Job(
	JobCode numeric(4) NOT NULL,
	Description varchar(25), 
	PayRate numeric(5,2),
	PRIMARY KEY (JobCode)
);

CREATE TABLE Employee(
	EmpID numeric(5) NOT NULL,
	[SIN] numeric(9) NOT NULL,
	LastName varchar(25) NOT NULL,
	FirstName varchar(25),
	Street varchar(30),
	City varchar(25),
	Province char(2),
	PostalCode varchar(7),
	JobCode numeric(4) NOT NULL,
	IncomeTax char(1),
	BirthDate date,
	HireDate date,
	JobCodeDate date,
	PRIMARY KEY (EmpID),
	FOREIGN KEY (JobCode) REFERENCES Job(JobCode)
);

CREATE TABLE Timesheet(
	EmpID numeric(5) NOT NULL,
	PayWeekEndDate date,
	RegHours numeric(5,2),
	OTimeHours numeric(5,2),
	-- Composite Key
	PRIMARY KEY (PayWeekEndDate, EmpID),
	FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

-- Step 2: Populate tables with data

-- Populate Job table ~ my approach is to populate tables in the same order I created them
INSERT INTO Job VALUES (1000, 'Manager', 32.4);
INSERT INTO Job VALUES (2000, 'Cashier', 11.63);
INSERT INTO Job VALUES (3000, 'Stockperson', 8.89);
INSERT INTO Job VALUES (4000, 'Baker', 18.91);
INSERT INTO Job VALUES (5000, 'Butcher', 19.26);
INSERT INTO Job VALUES (6000, 'Cleaner', 6.75);
INSERT INTO Job VALUES (7000, 'Pharmacist', 28.17);
INSERT INTO Job VALUES (8000, 'Assistant Baker', 12.58);

-- Populate Employee Table
INSERT INTO Employee VALUES(97319, 516303417, 'Novak', 'Gerry', '6803 Park Ave.', 'Moose Jaw', 'SK', 'S6H 1X7', 
						3000, 'N', '24-Aug-86', '07-Jul-03', '07-Jul-03');

INSERT INTO Employee VALUES(33982, 867481381, 'Boychuk', 'Robin', '117 East Broadway', 'Moose Jaw', 'SK', 'S6H 3P5', 
						5000, 'Y', '04-Mar-71', '11-Oct-98', '11-Oct-98');

INSERT INTO Employee VALUES(51537, 112893584, 'Smith', 'Kim', '9745 University Drive', 'Regina', 'SK', 'S4P 7A3', 
						2000, 'Y', '29-Nov-82', '02-Dec-01', '02-Dec-01');

INSERT INTO Employee VALUES(41822, 717505366, 'Miller', 'Chris', '72 Railway Ave.', 'Pense', 'SK', 'S0T 1K4', 
						2000, 'Y', '15-Nov-68', '19-Feb-85', '19-Feb-85');

INSERT INTO Employee VALUES(3571, 374853129, 'Hashimoto', 'Jo', '386 High Street', 'Tuxford', 'SK', 'S0L 8V6', 
						1000, 'Y', '23-Jun-56', '20-Mar-80', '30-Aug-99');

INSERT INTO Employee VALUES(85833, 466128562, 'Singh', 'Lindsey', '1216 Willow Cres.', 'Pasqua', 'SK', 'S0H 5T8', 
						7000, 'Y', '15-Mar-75', '27-Jul-02', '27-Jul-02');

INSERT INTO Employee VALUES(81216, 615917448, 'Hansen', 'Jaimie', '95 Lakeshore Blvd.', 'Caronport', 'SK', 'S0T 3S7', 
						8000, 'Y', '04-Mar-83', '21-May-02', '21-May-02');

INSERT INTO Employee VALUES(32177, 306114858, 'DaSilva', 'Robbie', '4319 Main St.', 'Moose Jaw', 'SK', 'S6H 2M2', 
						4000, 'Y', '18-Feb-51', '07-Jul-83', '15-Sep-92');

INSERT INTO Employee VALUES(52421, 936654021, 'O''Day', 'Ashley', '27 High St.', 'Tuxford', 'SK', 'S0L 8V6', 
						6000, 'Y', '31-Jul-63', '08-Nov-97', '08-Nov-97');

INSERT INTO Employee VALUES(72690, 655971502, 'Wong', 'Jodie', '59 Oslo Square', 'Moose Jaw', 'SK', 'S6H 2H9', 
						6000, 'N', '01-Jan-87', '26-Aug-03', '26-Aug-03');

INSERT INTO Employee VALUES(72201, 635111876, 'Ramirez', 'Kelly', '1015 Brunswick Lane', 'Moose Jaw', 'SK', 'S6H 4T5', 
						3000, 'N', '29-Sep-86', '26-Aug-03', '26-Aug-03');

-- Populate Timesheet table
INSERT INTO Timesheet VALUES(72690, '23-May-03', 36.00, 0.00);
INSERT INTO Timesheet VALUES(52421, '23-May-03', 22.00, 0.00);
INSERT INTO Timesheet VALUES(85833, '23-May-03', 37.50, 0.50);
INSERT INTO Timesheet VALUES(81216, '23-May-03', 40.00, 0.00);
INSERT INTO Timesheet VALUES(33982, '23-May-03', 40.00, 0.00);
INSERT INTO Timesheet VALUES(32177, '23-May-03', 40.00, 3.75);
INSERT INTO Timesheet VALUES(51537, '23-May-03', 27.00, 0.00);
INSERT INTO Timesheet VALUES(41822, '23-May-03', 40.00, 0.00);
INSERT INTO Timesheet VALUES(3571, '23-May-03', 40.00, 0.00);
INSERT INTO Timesheet VALUES(72201, '30-May-03', 18.00, 0.00);
INSERT INTO Timesheet VALUES(52421, '30-May-03', 40.00, 4.50);
INSERT INTO Timesheet VALUES(85833, '30-May-03', 22.00, 0.00);
INSERT INTO Timesheet VALUES(33982, '30-May-03', 38.25, 0.00);
INSERT INTO Timesheet VALUES(32177, '30-May-03', 40.00, 2.25);
INSERT INTO Timesheet VALUES(41822, '30-May-03', 38.00, 1.25);
INSERT INTO Timesheet VALUES(3571, '30-May-03', 40.00, 0.00);

-- Question 3: 
--	I created the Job table first because it has no foreign key; it doesn't reference another table.
--	Employee table came 2nd because it contains a reference to the Job table which is already created.
--  The Timesheet table came last because it references the Employee table that references the Job table.

-- Question 5: The order in which tables are populated are indeed important because of referential integrity. 

-- Question 6: 
	-- Step 1: Insert the new 88 job code record into the Job table.
	-- Step 2: Update the records of the three employees in the Employee table to assign them the 88 job code.
	-- Step 3: Delete the old '20' job code in the Job table now that it is no longer being referenced elsewhere.

-- Question 7: When trying to run the delete statement, the statement was terminated 
			-- because the record was being referenced inside of the Timesheet table.
			-- The law of referential integrity protected our data. 

-- Question 8: When running this statement "DELETE FROM Employee WHERE EmpID = 1350;",
			-- The statement executed without any errors/wasn't rejected, but made no 
			-- changes to the database. 







