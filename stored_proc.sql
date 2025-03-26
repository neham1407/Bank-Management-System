/*Stored Procedures*/

/*Get Account Balance by Account ID*/
DELIMITER //
CREATE PROCEDURE GetAccountBalance(IN account_id INT)
BEGIN
    SELECT Balance
    FROM Accounts
    WHERE AccountID = account_id;
END //
DELIMITER ;

CALL GetAccountBalance(1);

/*Get Loan Details by Customer ID*/
DELIMITER //
CREATE PROCEDURE GetLoanDetails(IN customer_id INT)
BEGIN
    SELECT l.*, lt.LoanTypeName, lt.InterestRate
    FROM Loans l
    JOIN LoanTypes lt ON l.LoanTypeID = lt.LoanTypeID
    WHERE l.CustomerID = customer_id;
END //
DELIMITER ;

CALL GetLoanDetails(1);

/*Get Transactions by Customer Email*/
DELIMITER //
CREATE PROCEDURE GetTransactionsByEmail(IN customer_email VARCHAR(100))
BEGIN
    SELECT t.*
    FROM Transactions t
    JOIN Accounts a ON t.AccountID = a.AccountID
    JOIN Customers c ON a.CustomerID = c.CustomerID
    WHERE c.Email = customer_email;
END //
DELIMITER ;

CALL GetTransactionsByEmail('jackson.avery@gmail.com');
