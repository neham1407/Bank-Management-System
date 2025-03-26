/* Views */

/*Show employees associated with each branch*/
CREATE VIEW BranchEmployees AS
SELECT 
    B.BranchID,
    B.BranchName,
    B.Location,
    E.EmployeeID,
    CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,
    E.DateOfBirth,
    E.PhoneNumber,
    E.Email
FROM 
    Branches B
INNER JOIN 
    Employees E ON B.BranchID = E.BranchID;

Select * From BranchEmployees;


/*View the Loan Status for Customers*/
CREATE VIEW LoanStatus AS
SELECT 
    L.LoanID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    LT.LoanTypeName,
    L.Amount AS LoanAmount,
    L.DateApplied,
    L.Status
FROM 
    Loans L
INNER JOIN 
    Customers C ON L.CustomerID = C.CustomerID
INNER JOIN 
    LoanTypes LT ON L.LoanTypeID = LT.LoanTypeID;
    
    SELECT * FROM LoanStatus;


