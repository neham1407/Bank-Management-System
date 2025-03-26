/*Create Banking Database*/
CREATE schema banking_database_management;

USE banking_database_management;

/*Create Tables*/
CREATE TABLE Branches (
    BranchID INT AUTO_INCREMENT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL,
    BranchID INT NOT NULL,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE AccountTypes (
    AccountTypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(50) NOT NULL,
    InterestRate DECIMAL(5,2) NOT NULL
);

CREATE TABLE AccountStatus (
    StatusID INT PRIMARY KEY AUTO_INCREMENT,
    StatusName VARCHAR(50) NOT NULL
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    AccountTypeID INT NOT NULL,
    AccountStatusID INT NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL DEFAULT 0,
    DateOpened DATETIME NOT NULL,
    DateClosed DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (AccountTypeID) REFERENCES AccountTypes(AccountTypeID),
    FOREIGN KEY (AccountStatusID) REFERENCES AccountStatus(StatusID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT NOT NULL,
    TransactionType ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Transfer (
    TransferID INT PRIMARY KEY AUTO_INCREMENT,
    FromAccountID INT NOT NULL,
    ToAccountID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    TransferDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (FromAccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (ToAccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE TransactionFees (
    TransactionFeeID INT PRIMARY KEY,
    TransactionID INT NOT NULL,
    TransactionType ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    Fee DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);

CREATE TABLE LoanTypes (
    LoanTypeID INT PRIMARY KEY AUTO_INCREMENT,
    LoanTypeName VARCHAR(100) NOT NULL,
    InterestRate DECIMAL(5,2) NOT NULL
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    LoanTypeID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    DateApplied DATETIME NOT NULL,
    Status ENUM('Pending', 'Approved', 'Rejected') NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (LoanTypeID) REFERENCES LoanTypes(LoanTypeID)
);




CREATE TABLE LoanPayments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    LoanID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATETIME NOT NULL,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

CREATE TABLE UserSessions (
    SessionID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    SessionToken VARCHAR(255) NOT NULL,
    Expiry DATETIME NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE TransactionLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    TransactionType ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

/*Insert data into tables*/
INSERT INTO Branches (BranchName, Location) VALUES
('Main Branch', 'Boston'),
('Downtown Branch', 'New Jersey'),
('Seaport branch', 'Maryland');


INSERT INTO Employees (FirstName, LastName, DateOfBirth, PhoneNumber, Email, BranchID) VALUES
('Meredith', 'Grey', '1980-05-15', '123456789', 'mer.grey@.gmailcom', 1),
('Alex', 'Karev', '1985-08-22', '987654321', 'alex.karev@gmailcom', 2),
('Izzie', 'Stevens', '1976-12-10', '555555555', 'izzie.stevens@gmail.com', 3);


INSERT INTO Customers (FirstName, LastName, DateOfBirth, PhoneNumber, Email, Address, City, State, ZipCode, Password) VALUES
('Richard', 'Webber', '1990-03-25', '111222333', 'richard.webber@gmail.com', '123 Main St', 'New York', 'NY', '10001', 'password123'),
('Jackson', 'Avery', '1988-07-12', '444555666', 'jackson.avery@gmail.com', '456 Walnut St', 'Los Angeles', 'CA', '90001', 'password456'),
('April', 'Kepner', '1975-11-30', '777888999', 'april.kepner@gmail.com', '789 Oakland St', 'Chicago', 'IL', '60601', 'password789');


INSERT INTO AccountTypes (TypeName, InterestRate) VALUES
('Savings Account', 0.5),
('Checking Account', 0.1),
('Fixed Deposit Account', 2.0);


INSERT INTO AccountStatus (StatusName) VALUES
('Active'),
('Closed');


INSERT INTO Accounts (CustomerID, AccountTypeID, AccountStatusID, Balance, DateOpened) VALUES
(1, 1, 1, 1000.00, NOW()),
(2, 2, 1, 500.00, NOW()),
(3, 1, 1, 1500.00, NOW());


INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate) VALUES
(1, 'Deposit', 500.00, NOW()),
(2, 'Withdrawal', 200.00, NOW()),
(3, 'Deposit', 1000.00, NOW());


INSERT INTO Transfer (FromAccountID, ToAccountID, Amount, TransferDate) VALUES
(1, 2, 300.00, NOW()),
(3, 1, 200.00, NOW());


INSERT INTO TransactionFees (TransactionFeeID, TransactionID, TransactionType, Fee) VALUES
(1, 1, 'Deposit', 0.50),
(2, 2, 'Withdrawal', 1.00),
(3, 3, 'Transfer', 2.00);



INSERT INTO LoanTypes (LoanTypeName, InterestRate) VALUES
('Personal Loan', 8.5),
('Home Loan', 6.0),
('Student Loan', 7.0);


INSERT INTO Loans (CustomerID, LoanTypeID, Amount, DateApplied, Status) VALUES
(1, 1, 10000.00, NOW(), 'Pending'),
(2, 2, 200000.00, NOW(), 'Approved'),
(3, 3, 5000.00, NOW(), 'Rejected');


INSERT INTO LoanPayments (LoanID, Amount, PaymentDate) VALUES
(1, 500.00, NOW()),
(2, 1000.00, NOW()),
(3, 200.00, NOW());


INSERT INTO UserSessions (CustomerID, SessionToken, Expiry) VALUES
(1, 'session_token_1', NOW() + INTERVAL 1 HOUR),
(2, 'session_token_2', NOW() + INTERVAL 1 HOUR),
(3, 'session_token_3', NOW() + INTERVAL 1 HOUR);


INSERT INTO TransactionLogs (CustomerID, TransactionType, Amount, TransactionDate) VALUES
(1, 'Deposit', 100.00, NOW()),
(2, 'Withdrawal', 50.00, NOW()),
(3, 'Transfer', 200.00, NOW());

INSERT INTO LoanPayments (LoanID, Amount, PaymentDate) VALUES
(1, 500.00, NOW()),
(2, 1000.00, NOW()),
(2, 2000.00, NOW()),
(3, 200.00, NOW());





