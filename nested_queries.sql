/*Nested queries*/

/*Get the total number of transactions for each customer.*/
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    (SELECT COUNT(*) 
     FROM Transactions t 
     JOIN Accounts a ON t.AccountID = a.AccountID 
     WHERE a.CustomerID = c.CustomerID
    ) AS TotalTransactions
FROM 
    Customers c;
    
/*Get the total amount of fees paid by each customer.*/    
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    (SELECT SUM(tf.Fee) 
     FROM TransactionFees tf 
     JOIN Transactions t ON tf.TransactionType = t.TransactionType 
     JOIN Accounts a ON t.AccountID = a.AccountID
     WHERE a.CustomerID = c.CustomerID
    ) AS TotalFeesPaid
FROM 
    Customers c;
