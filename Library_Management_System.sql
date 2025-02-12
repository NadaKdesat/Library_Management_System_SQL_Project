Create database Library_Management_System;

Use Library_Management_System;

Create Table Books(
	ID INT PRIMARY KEY IDENTITY,
	BookTitle NVARCHAR(255)  NOT NULL,
	BookAuthor NVARCHAR(255) NOT NULL,
	BookGenre  NVARCHAR(255) NOT NULL,
	PublicationYear INT CHECK (PublicationYear BETWEEN 1000 AND 9999),
	Status NVARCHAR(15) CHECK (Status IN('Available', 'NOT Available','Pending'))
);

Create Table Members(
	ID INT PRIMARY KEY IDENTITY,
	MembersName NVARCHAR(255)  NOT NULL,
	MembersPhone VARCHAR(15)  NOT NULL UNIQUE,
	MembershipType VARCHAR(10)  NOT NULL CHECK (MembershipType IN('Student', 'Teacher','Visitor')),
	RegistrationDate Date
);

Create Table Borrowing(
	ID INT PRIMARY KEY IDENTITY,
	MemberID INT,
	BookID INT,
	BorrowingDate DATE,
	DueDate DATE,
	ReturnDate DATE,
	FOREIGN KEY (MemberID) REFERENCES Members(ID),
	FOREIGN KEY (BookID) REFERENCES Books(ID)
);

Create Table Financial_fines(
	ID INT PRIMARY KEY IDENTITY,
	BorrowingID INT,
	Amount decimal(8,2),
	PaymentStatus VARCHAR(6) NOT NULL CHECK (PaymentStatus IN('Paid', 'Unpaid')),
	FOREIGN KEY (BorrowingID) REFERENCES Borrowing(ID),
);

Create Table Reservations(
	ID INT PRIMARY KEY IDENTITY,
	MemberID INT,
	BookID INT,
	ReservationDate DATE,
	Status VARCHAR(10) NOT NULL CHECK (Status IN('Pending', 'Cancelled','Completed')),
	FOREIGN KEY (MemberID) REFERENCES Members(ID),
	FOREIGN KEY (BookID) REFERENCES Books(ID)
);

Create Table Categories(
	ID INT PRIMARY KEY IDENTITY,
	CategoriesName NVARCHAR(255)  NOT NULL,
	CategoriesDescription NVARCHAR(255)  NOT NULL
);

Create Table Book_Categories(
	ID INT PRIMARY KEY IDENTITY,
	BookID INT,
	CategoriesID INT,
	FOREIGN KEY (BookID) REFERENCES Books(ID),
	FOREIGN KEY (CategoriesID) REFERENCES Categories(ID)
);

Create Table Library_Staff(
	ID INT PRIMARY KEY IDENTITY,
	StaffName NVARCHAR(255)  NOT NULL,
	StaffEmail VARCHAR(255)  NOT NULL UNIQUE,
	StaffPhone VARCHAR(15)  NOT NULL UNIQUE,
	AssignedSection VARCHAR(50)  NOT NULL,
	EmploymentDate DATE
);



-- Insert data into Books table
INSERT INTO Books (BookTitle, BookAuthor, BookGenre, PublicationYear, Status) VALUES
('Database Fundamentals', 'John Smith', 'Technology', 2015, 'Available'),
('SQL for Beginners', 'Jane Doe', 'Technology', 2018, 'Available'),
('C# Programming', 'Mark Lee', 'Programming', 2020, 'Available'),
('Python Basics', 'Alice Brown', 'Programming', 2019, 'NOT Available'),
('Data Science Essentials', 'Bob White', 'Science Fiction', 2021, 'Available'),
('Machine Learning Guide', 'Tom Harris', 'AI', 2022, 'Pending'),
('Java in Depth', 'Sarah Connor', 'Programming', 2017, 'Available'),
('Cloud Computing', 'Mike Jordan', 'Technology', 2020, 'Available'),
('Cybersecurity Principles', 'Laura Adams', 'Security', 2021, 'Available'),
('Artificial Intelligence', 'Henry Ford', 'AI', 2018, 'Available');

-- Insert data into Members table
INSERT INTO Members (MembersName, MembersPhone, MembershipType, RegistrationDate) VALUES
('Alaa Johnson', '1239045678', 'Student', '2024-12-21'),
('Sarah Johnson', '1234567890', 'Teacher', '2025-01-01'),
('James Wilson', '2345678901', 'Visitor', '2023-05-15'),
('Emily Davis', '3456789012', 'Student', '2022-09-10'),
('Michael Brown', '4567890123', 'Teacher', '2021-12-20'),
('Jessica Lee', '5678901234', 'Visitor', '2023-07-14'),
('David White', '6789012345', 'Student', '2024-02-22'),
('Sophia Adams', '7890123456', 'Teacher', '2022-03-30'),
('John Miller', '8901234567', 'Visitor', '2021-06-18'),
('Anna Martin', '9012345678', 'Student', '2024-08-05');

-- Insert data into Borrowing table
INSERT INTO Borrowing (MemberID, BookID, BorrowingDate, DueDate, ReturnDate) VALUES
(1, 2, '2024-01-02', '2024-01-10', '2024-01-09'),
(2, 3, '2024-01-05', '2024-01-12', NULL),
(5, 6, '2024-04-15', '2024-04-25', NULL),
(8, 3, '2024-01-05', '2024-01-12','2024-01-02' ),
(6, 7, '2023-11-20', '2023-11-30', '2023-12-01'),
(10, 1, '2025-01-01', '2025-01-10', NULL),
(5, 3, '2024-01-05', '2024-01-12','2024-01-02' ),
(10, 3, '2024-01-05', '2024-01-12','2024-01-02' ),
(9, 5, '2024-01-03', '2024-01-04','2024-01-04' );
-- Insert data into Financial_fines table
INSERT INTO Financial_fines (BorrowingID, Amount, PaymentStatus) VALUES
(3, 5.00, 'Unpaid'),
(5, 2.50, 'Paid'),
(1, 3.75, 'Unpaid');


-- Insert data into Reservations table
INSERT INTO Reservations (MemberID, BookID, ReservationDate, Status) VALUES
(1, 3, '2024-01-01', 'Completed'),
(2, 4, '2024-05-15', 'Pending'),
(4, 6, '2023-12-05', 'Completed'),
(5, 7, '2024-03-22', 'Pending'),
(9, 1, '2025-02-10', 'Pending'),
(10, 2, '2025-01-05', 'Completed');

-- Insert data into Categories table
INSERT INTO Categories (CategoriesName, CategoriesDescription) VALUES
('Technology', 'Books related to technology and computing'),
('Programming', 'Books about programming languages and techniques'),
('AI', 'Books on artificial intelligence and machine learning'),
('Science Fiction', 'General science books'),
('Security', 'Cybersecurity and digital safety books');

-- Insert data into Book_Categories table
INSERT INTO Book_Categories (BookID, CategoriesID) VALUES
(1, 1), (2, 2), (3, 2), (4, 2), (5, 4), (6, 3), (7, 2), (8, 1), (9, 5), (10, 3);

-- Insert data into Library_Staff table
INSERT INTO Library_Staff (StaffName, StaffEmail, StaffPhone, AssignedSection, EmploymentDate) VALUES
('Alice Johnson', 'alice.staff@gmail.com', '1112223333', 'Technology', '2019-08-12'),
('Bob Smith', 'bob.staff@gmail.com', '2223334444', 'Programming', '2020-06-20'),
('Charlie Brown', 'charlie.staff@gmail.com', '3334445555', 'AI', '2021-10-05'),
('Diana Green', 'diana.staff@gmail.com', '4445556666', 'Science', '2018-04-15'),
('Ethan White', 'ethan.staff@gmail.com', '5556667777', 'Security', '2017-12-01');


--1. Select members who registered on a specific date
--👉 Question:
--Write an SQL query to find all members who registered on 1-1-2025.
Select * From Members;
Select * From Members Where RegistrationDate='2025-01-01';


--2. Select details of a book by its title
--👉 Question:
--Write an SQL query to retrieve all details of a book titled "Database Fundamentals".
Select * From Books;
Select * From Books Where BookTitle='Database Fundamentals';

--3. Add a new column ‘Email’ to the Members table
--👉 Question:
--The Members table is missing an Email column. Write an SQL query to add an Email column with a data type suitable for storing email addresses.
Alter Table Members Add Email VARCHAR(255);
Select * From Members;

--4. Insert a new member record
--👉 Question:
--Write an SQL query to insert a new member with the following details:

--Name: Omar
--Contact: 9876543210
--Membership Type: Student
--Registration Date: 5-6-2024
--Email: Omar@gmail.com
INSERT INTO Members VALUES ('Omar', '9876543210', 'Student', '2024-06-05', 'Omar@gmail.com');
Select * From Members;

--5. Select members who have reservations in the system
--👉 Question:
--Write an SQL query to find all members who have made a book reservation.
Select * From Members;
Select * From Reservations;
Select * 
From Members 
Join Reservations ON Members.ID = Reservations.MemberID;

--6. Select members who have borrowed a specific book
--👉 Question:
--Write an SQL query to find members who have borrowed the book titled "SQL for Beginners".
Select * 
From Members 
Join Borrowing ON Borrowing.MemberID = Members.ID
Join Books ON Books.ID = Borrowing.BookID
Where BookTitle='SQL for Beginners';

--7. Select members who have borrowed and returned a specific book
--👉 Question:
--Write an SQL query to find all members who have borrowed and returned the book titled "C# Programming".
Select * 
From Members 
Join Borrowing ON Borrowing.MemberID = Members.ID
Join Books ON Books.ID = Borrowing.BookID
where ReturnDate is not null and BookTitle='C# Programming';

--8. Find members who made a late return
--👉 Question:
--Write an SQL query to find members who have returned books after the due date.
Select * 
From Members 
Join Borrowing ON Borrowing.MemberID = Members.ID
Join Books ON Books.ID = Borrowing.BookID
where DueDate < ReturnDate;

--9. Select books borrowed more than 3 times
--👉 Question:
--Write an SQL query to find books that have been borrowed more than 3 times.
Select BookTitle,count(BookID) AS BorrowingCount
From  Books 
Join Borrowing ON Borrowing.BookID = Books.ID
Group by BookTitle HAVING count(BookID)>3;

--10. Find members who have borrowed books between two dates
--👉 Question:
--Write an SQL query to find members who have borrowed a book between January 1, 2024, and January 10, 2024.
Select * 
From Members 
Join Borrowing ON Borrowing.MemberID = Members.ID
Join Books ON Books.ID = Borrowing.BookID
where BorrowingDate between '2024-01-01' AND '2024-01-10';

--11. Count the total number of books in the library
--👉 Question:
--Write an SQL query to count the total number of books available in the library.
Select Count(ID) as Number_Of_Books From Books where Status='Available';

--12. (Optional)Find members who have borrowed books but not returned them
--👉 Question:
--Write an SQL query to find members who have borrowed books but not returned them yet.
Select * 
From Members 
Join Borrowing ON Borrowing.MemberID = Members.ID
where ReturnDate is null;

--13. (Optional)Find members who have borrowed books in a specific category
--👉 Question:
--Write an SQL query to find members who have borrowed a book from the "Science Fiction" category.
Select * 
From Members 
Join Borrowing ON Borrowing.MemberID = Members.ID
Join Books ON Books.ID = Borrowing.BookID
where BookGenre='Science Fiction';
