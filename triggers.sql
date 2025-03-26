/*Triggers*/

/*check the balance before withdrawal and transfer*/
DELIMITER //
CREATE TRIGGER Before_Transaction
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
    DECLARE current_balance DECIMAL(10,2);
    
/*Get the current balance of the account*/
    SELECT Balance INTO current_balance
    FROM Accounts
    WHERE AccountID = NEW.AccountID;
    
    /*Check if the transaction type is Withdrawal or Transfer*/
    IF NEW.TransactionType = 'Withdrawal' OR NEW.TransactionType = 'Transfer' THEN
        /*Check if the current balance is sufficient for the transaction*/
        IF current_balance - NEW.Amount < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient balance for the transaction';
        END IF;
    END IF;
END;
//
DELIMITER ;

INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate) VALUES
(1, 'Deposit', 500.00, NOW());


/*Trigger to log transactions after the transaction takes place*/
DELIMITER //
CREATE TRIGGER TransactionLogTrigger
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO TransactionLogs (CustomerID, TransactionType, Amount, TransactionDate)
    VALUES (
        (SELECT CustomerID FROM Accounts WHERE AccountID = NEW.AccountID),
        NEW.TransactionType,
        NEW.Amount,
        NEW.TransactionDate
    );
END;
//
DELIMITER ;
