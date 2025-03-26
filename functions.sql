/*Functions*/

/*Function to Check if a Customer Exists*/
DELIMITER //
CREATE FUNCTION CustomerExists(customer_id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE result BOOLEAN;
    DECLARE count_customer INT;

    SELECT COUNT(*) INTO count_customer FROM Customers WHERE CustomerID = customer_id;

    IF count_customer > 0 THEN
        SET result = TRUE;
    ELSE
        SET result = FALSE;
    END IF;

    RETURN result;
END//

DELIMITER ;

select CustomerExists(4);

/*Calculate total loan payments by customers*/
DELIMITER //
CREATE FUNCTION CalculateLoanPayments(loan_id INT) RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE total_payments DECIMAL(10, 2);
    
    SELECT SUM(Amount) INTO total_payments 
    FROM LoanPayments 
    WHERE LoanID = loan_id;
    
    RETURN total_payments;
END//
DELIMITER ;

SELECT CalculateLoanPayments(2);





