/*Final Project: Library Management System*/

--note that all book loans in Book_Loans are current loans, not past loans for all time.

CREATE database db_library_management_system
GO

USE db_library_management_system
GO

CREATE TABLE Publisher(
	Name VARCHAR(50) PRIMARY KEY NOT NULL, Address VARCHAR(50), Phone VARCHAR(50)
);

CREATE TABLE Book(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1000, 1), Title VARCHAR(50), PublisherName VARCHAR(50) FOREIGN KEY REFERENCES Publisher(Name) 
);

CREATE TABLE Book_Authors(
	BookID INT FOREIGN KEY REFERENCES Book(BookID), AuthorName VARCHAR(50)
);

CREATE TABLE Borrower(
	CardNo INT PRIMARY KEY NOT NULL, Name VARCHAR(50), Address VARCHAR(50), Phone VARCHAR(50)
);

CREATE TABLE Library_Branch(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1), BranchName VARCHAR(50), Address VARCHAR(50)
);

CREATE TABLE Book_Loans(
	BookID INT FOREIGN KEY REFERENCES Book(BookID), BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID), CardNo INT FOREIGN KEY REFERENCES Borrower(CardNo), DateOut DATETIME, DueDate DATE
);

CREATE TABLE Book_Copies(
	BookID INT FOREIGN KEY REFERENCES Book(BookID), BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID), No_Of_Copies INT
);

INSERT INTO Publisher
	(Name)
	VALUES
	('New American Library'),
	('Viking Press'),
	('Pantheon Books'),
	('Scribner'),
	('Gnome Press'),
	('Harvill Secker'),
	('Picador USA'),
	('McClelland & Stewart'),
	('Chilton Books'),
	('Double Day'),
	('Macmillan Publishers'),
	('Harper & Row'),
	('HarperCollins')
;

INSERT INTO Book
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Picador USA'), 
	('The Green Mile', 'New American Library'), 
	('Cujo', 'Viking Press'), 
	('Pet Sematary', 'Double Day'), 
	('The Mist', 'Viking Press'), 
	('The Way of Zen', 'Macmillan Publishers'), 
	('Nature, Man and Woman', 'Pantheon Books'), 
	('The Joyous Cosmology', 'Pantheon Books'), 
	('The Sun Also Rises', 'Scribner'), 
	('To Have and Have Not', 'HarperCollins'), 
	('For Whom the Bell Tolls', 'Scribner'), 
	('Sense and Sensibility', 'HarperCollins'), 
	('Pride and Prejudice', 'HarperCollins'), 
	('Animal Farm', 'Harvill Secker'), 
	('1984', 'Harvill Secker'), 
	('The Handmaid''s Tale', 'McClelland & Stewart'),
	('The Year of the Flood', 'McClelland & Stewart'),
	('The Doors of Perception', 'Harper & Row'),
	('Brave New World', 'HarperCollins'),
	('Island', 'HarperCollins'),
	('Dune', 'Chilton Books'),
	('Foundation', 'Gnome Press')
;

INSERT INTO Book_Authors
	(BookID, AuthorName)
	VALUES
	(1001, 'Stephen King'),
	(1002, 'Stephen King'),
	(1003, 'Stephen King'),
	(1004, 'Stephen King'),
	(1005, 'Alan Watts'),
	(1006, 'Alan Watts'),
	(1007, 'Alan Watts'),
	(1008, 'Ernest Hemingway'),
	(1009, 'Ernest Hemingway'),
	(1010, 'Ernest Hemingway'),
	(1017, 'Aldous Huxley'),
	(1018, 'Aldous Huxley'),
	(1019, 'Aldous Huxley'),
	(1011, 'Jane Austen'),
	(1012, 'Jane Austen'),
	(1013, 'George Orwell'),
	(1014, 'George Orwell'),
	(1015, 'Margaret Atwood'),
	(1016, 'Margaret Atwood'),
	(1000, 'Mark Lee'),
	(1020, 'Frank Herbert'),
	(1021, 'Isaac Asimov')
;

INSERT INTO Library_Branch
	(BranchName, Address)
	VALUES
	('Central', '801 SW 10th Ave'),
	('Belmont', '1038 SE Cesar Estrada Chavez Blvd'),
	('Hollywood', '4040 NE Tillamook St'),
	('Sharpstown', '753 Razor Ave'), 
	('NewBranchWithNoBooks', '555 Empty Ave')
;

INSERT INTO Borrower 
	(CardNo, Name, Address, Phone)
	VALUES
	(48634, 'Zola Zed', '123 Fake Street', '503-555-8523'),
	(39085, 'Rich Rich', '296 Fake Drive', '503-824-8457'),
	(44739, 'Bobby Bo', '87532 Fake Crescent', '503-128-5370'),
	(49274, 'Mark Hill', '999 Fake Lane', '503-116-0093'),
	(50414, 'Emil Elsen', '2345 Fake Ridge', '503-363-5071'),
	(52310, 'Mary May', '777 Lucky Lane' , '503-408-4412'),
	(42890, 'Dan White', '12321 Mirror Street', '503-787-2531'),
	(55827, 'Taylor Tay', '5555 Fake Avenue', '503-798-5062'),
	(60001, 'Joss Jones','333 Hillside Avenue', '503-688-6462')
;

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DueDate)
	VALUES
	(1013, 1, 39085, '2018-03-29 17:44:44', '2018-04-12'),
	(1008, 2, 55827, '2018-03-30 10:08:20', '2018-04-13'), 
	(1000, 2, 55827, '2018-03-30 10:08:27', '2018-04-13'),
	(1010, 4, 42890, '2018-03-31 18:03:09', '2018-04-14'),
	(1015, 4, 42890, '2018-03-31 18:03:16', '2018-04-14'),
	(1006, 4, 42890, '2018-03-31 18:03:22', '2018-04-14'),
	(1001, 4, 42890, '2018-03-31 18:03:28', '2018-04-14'),
	(1000, 1, 49274, '2018-04-05 18:30:29', '2018-04-19'),
	(1003, 1, 49274, '2018-04-05 18:30:33', '2018-04-19'),
	(1017, 1, 49274, '2018-04-05 18:30:38', '2018-04-19'),
	(1019, 1, 49274, '2018-04-05 18:30:44', '2018-04-19'),
	(1011, 3, 50414, '2018-04-06 11:20:31', '2018-04-20'),
	(1009, 3, 50414, '2018-04-06 12:31:55', '2018-04-20'),
	(1000, 2, 55827, '2018-04-06 10:08:27', '2018-04-20'),
	(1001, 1, 39085, '2018-04-06 14:17:49', '2018-04-20'),
	(1003, 1, 39085, '2018-04-06 14:18:00', '2018-04-20'),
	(1017, 1, 39085, '2018-04-06 14:18:02', '2018-04-20'),
	(1019, 1, 39085, '2018-04-06 14:18:06', '2018-04-20'),
	(1011, 3, 50414, '2018-04-06 11:20:31', '2018-04-20'),
	(1019, 3, 50414, '2018-04-06 12:31:55', '2018-04-20'),
	(1000, 2, 55827, '2018-04-07 10:08:27', '2018-04-21'),
	(1001, 1, 44739, '2018-04-07 15:33:49', '2018-04-21'),
	(1003, 1, 44739, '2018-04-07 15:33:55', '2018-04-21'),
	(1013, 1, 44739, '2018-04-07 15:34:02', '2018-04-21'),
	(1012, 1, 44739, '2018-04-07 15:34:06', '2018-04-21'),
	(1011, 3, 50414, '2018-04-07 11:20:31', '2018-04-21'),
	(1002, 3, 50414, '2018-04-08 12:31:55', '2018-04-22'),
	(1000, 2, 55827, '2018-04-08 10:08:27', '2018-04-22'),
	(1001, 1, 44739, '2018-04-08 15:33:49', '2018-04-22'),
	(1003, 1, 44739, '2018-04-08 15:33:55', '2018-04-22'),
	(1017, 1, 44739, '2018-04-08 15:34:02', '2018-04-22'),
	(1019, 1, 44739, '2018-04-09 15:34:06', '2018-04-23'),
	(1004, 3, 50414, '2018-04-09 11:20:31', '2018-04-23'),
	(1009, 3, 50414, '2018-04-09 12:31:55', '2018-04-23'),
	(1000, 2, 55827, '2018-04-09 10:08:27', '2018-04-23'),
	(1006, 1, 44739, '2018-04-09 09:33:49', '2018-04-23'),
	(1003, 1, 44739, '2018-04-10 09:33:55', '2018-04-24'),
	(1017, 1, 52310, '2018-04-10 09:34:02', '2018-04-24'),
	(1016, 1, 52310, '2018-04-10 09:34:06', '2018-04-24'),
	(1011, 3, 50414, '2018-04-10 11:20:31', '2018-04-24'),
	(1008, 3, 50414, '2018-04-10 12:31:55', '2018-04-24'),
	(1000, 2, 55827, '2018-04-10 10:08:27', '2018-04-24'),
	(1001, 1, 52310, '2018-04-10 15:33:49', '2018-04-24'),
	(1003, 1, 52310, '2018-04-10 15:33:55', '2018-04-24'),
	(1017, 4, 48634, '2018-04-11 13:51:40', '2018-04-25'),
	(1001, 4, 48634, '2018-04-11 13:51:47', '2018-04-25'),
	(1005, 4, 48634, '2018-04-11 13:51:53', '2018-04-25'),
	(1009, 4, 48634, '2018-04-11 13:51:59', '2018-04-25'),
	(1015, 4, 48634, '2018-04-11 13:52:04', '2018-04-25'),
	(1011, 4, 48634, '2018-04-11 13:52:08', '2018-04-25')
;

INSERT INTO Book_Copies
	(BookID, BranchID, No_Of_Copies)
	VALUES
	(1000, 4, 2), --random numbers of copies
	(1001, 4, 8),  
	(1009, 4, 5),
	(1013, 4, 5),
	(1007, 4, 2),
	(1018, 4, 4),
	(1019, 4, 3),
	(1001, 4, 6),
	(1003, 4, 9),
	(1015, 4, 2),
	(1004, 3, 4), 
	(1005, 3, 2),
	(1006, 3, 3),
	(1010, 3, 8),
	(1019, 3, 3),
	(1017, 3, 3),
	(1016, 3, 2),
	(1012, 3, 10),
	(1011, 3, 5),
	(1001, 3, 4),
	(1002, 2, 2), 
	(1003, 2, 2),
	(1009, 2, 5),
	(1017, 2, 2),
	(1004, 2, 3),
	(1006, 2, 2),
	(1008, 2, 7),
	(1010, 2, 5),
	(1014, 2, 2),
	(1015, 2, 3),
	(1004, 1, 2), 
	(1002, 1, 2), 
	(1018, 1, 2),
	(1011, 1, 2),
	(1000, 1, 2),
	(1001, 1, 2),
	(1017, 1, 2),
	(1005, 1, 2),
	(1008, 1, 2),
	(1012, 1, 2)
;
GO
 /*******************************************************/

 -- Stored Procedure 1: How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

CREATE PROC [dbo].[GetNumCopiesForTitleForBranch] @branchName VARCHAR(50) = 'Sharpstown', @bookTitle VARCHAR(50) = 'The Lost Tribe'
	AS 
	SELECT No_Of_Copies AS 'Number of Copies' FROM Book_Copies
	INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
	INNER JOIN Book ON Book_Copies.BookID = Book.BookID
	WHERE Library_Branch.BranchName = ISNULL(@branchName, BranchName) AND Book.Title  = @bookTitle
GO



-- Stored Procedure 2: How many copies of the book titled "The Lost Tribe" are owned by each library branch?

-- Note that the second table is created because the first table does not include cases where some library branches might not contain any copies of a certain book, and I want to include those branches with zero copies of the given book.
CREATE PROC [dbo].[GetNumCopiesForTitle] @bookTitle VARCHAR(50) = 'The Lost Tribe'
	AS

	DECLARE @LibrariesWithBookCopies AS TABLE(BookID INT, Title VARCHAR(50), No_Of_Copies INT, BranchID INT, BranchName VARCHAR(50))
	INSERT INTO @LibrariesWithBookCopies
	SELECT Book_Copies.BookID, @bookTitle AS 'Book Title', ISNULL(Book_Copies.No_Of_Copies,0) AS 'Number of Copies', Library_Branch.BranchID, BranchName AS 'Branch Name' FROM Book_Copies 
	RIGHT JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
	INNER JOIN Book ON Book_Copies.BookID = Book.BookID  OR Book_Copies.No_Of_Copies IS NULL
	WHERE Book.Title = @bookTitle

	DECLARE @LibrariesWithoutBook AS TABLE(BookID INT, Title VARCHAR(50), No_Of_Copies INT, BranchID INT, BranchName VARCHAR(50)) --this table will contain all the library branches that do NOT contain copies of the book in question.
	INSERT INTO @LibrariesWithoutBook
	SELECT Book.BookID, @bookTitle AS 'Book Title', 0 AS 'Number of Copies', Library_Branch.BranchID, Library_Branch.BranchName FROM @LibrariesWithBookCopies AS T1
	INNER JOIN Book ON T1.BookID=Book.BookID   
	RIGHT JOIN Library_Branch ON T1.BranchID = Library_Branch.BranchID WHERE T1.BranchID IS NULL

	SELECT Title, No_Of_Copies AS 'Number of Copies', BranchName AS 'Branch Name' FROM @LibrariesWithBookCopies 
	UNION																											-- this union of tables will contain the number of copies of the book in question at ALL libraries, not just libraries that contain one or more copies of it already
	SELECT Title, No_Of_Copies AS 'Number of Copies', BranchName AS 'Branch Name' FROM @LibrariesWithoutBook   
GO


-- Stored Procedure 3: Retrieve the names of all borrowers who do not have any books checked out.

CREATE PROC [dbo].[GetBorrowersWithoutBooksCheckedOut]
	AS 
	SELECT Name AS 'Borrowers with No Books Checked Out' FROM Borrower
	LEFT JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo
	WHERE Book_Loans.CardNo IS NULL              
GO


-- Stored Procedure 4: For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

CREATE PROC [dbo].[GetBorrowersBooksDueTodayForBranch] @branchName VARCHAR(50) = 'Sharpstown'
	AS 
	SELECT Book.Title AS 'Book Title', Borrower.Name AS 'Borrower''s Name', Borrower.Address AS 'Borrower''s Address' FROM Book_Loans
	INNER JOIN Library_Branch ON Book_Loans.BranchID = Library_Branch.BranchID
	INNER JOIN Book ON Book_Loans.BookID = Book.BookID 
	INNER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo
	WHERE DueDate = GETDATE()
GO


-- Stored Procedure 5: For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

CREATE PROC [dbo].[GetTotalLoanedBooksByBranch]
	AS 
	SELECT Library_Branch.BranchName AS 'Branch Name', ISNULL(SUM(Book_Copies.No_Of_Copies),0) AS 'Total Number of Books Loaned Out' FROM Book_Copies
	RIGHT JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
	GROUP BY Library_Branch.BranchName
GO


-- Stored Procedure 6: Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.

CREATE PROC [dbo].[GetBorrowersBooksForMinNumBooksLoaned] @numBooksLoaned INT = 5
	AS 
	SELECT Borrower.Name AS 'Borrower''s Name', Borrower.Address AS 'Borrower''s Address', COUNT(Book_Loans.CardNo) AS 'Number of Books Loaned Out' FROM Book_Loans
	INNER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo
	GROUP BY Book_Loans.CardNo, Borrower.Name, Borrower.Address
	HAVING COUNT(Book_Loans.CardNo) > @numBooksLoaned                     
GO


 -- Stored Procedure 7: For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

CREATE PROC [dbo].[GetBooksOwnedForBranchForAuthor] @author VARCHAR(50) = 'Stephen King', @branch VARCHAR(50) = 'Central'
	AS
	SELECT Book.Title AS 'Book Title', Book_Copies.No_Of_Copies AS 'Number of Copies' FROM Book_Copies
	INNER JOIN Book ON Book_Copies.BookID = Book.BookID
	INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
	INNER JOIN Book_Authors ON Book_Authors.BookID = Book.BookID
	WHERE Book_Authors.AuthorName = @author AND Library_Branch.BranchName = @branch
GO



