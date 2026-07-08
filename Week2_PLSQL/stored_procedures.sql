CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    balance NUMBER
);
CREATE TABLE SavingsAccounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    balance NUMBER,
    FOREIGN KEY(customer_id)
    REFERENCES Customers(customer_id)
);
CREATE TABLE Employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    department VARCHAR2(30),
    salary NUMBER
);
CREATE TABLE BankAccounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    balance NUMBER
);
DELETE FROM BankAccounts;
DELETE FROM Employees;
DELETE FROM SavingsAccounts;
DELETE FROM Customers;

COMMIT;

INSERT INTO Customers VALUES (1,'Rahul',5000);
INSERT INTO Customers VALUES (2,'Priya',7000);
INSERT INTO SavingsAccounts VALUES (101,1,20000);
INSERT INTO SavingsAccounts VALUES (102,2,15000);
INSERT INTO Employees VALUES (1,'John','IT',50000);
INSERT INTO Employees VALUES (2,'David','HR',40000);
INSERT INTO Employees VALUES (3,'Mary','IT',60000);
INSERT INTO BankAccounts VALUES (1001,1,30000);
INSERT INTO BankAccounts VALUES (1002,2,12000);
COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN

    UPDATE SavingsAccounts
    SET balance = balance + (balance * 0.01);

    DBMS_OUTPUT.PUT_LINE('Monthly interest applied successfully.');

    COMMIT;

END;
/
BEGIN
    ProcessMonthlyInterest;
END;
/
SELECT * FROM SavingsAccounts;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus
(
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
)
IS
BEGIN

    UPDATE Employees
    SET salary = salary + (salary * p_bonus_percent/100)
    WHERE department = p_department;

    DBMS_OUTPUT.PUT_LINE('Bonus updated successfully.');

    COMMIT;

END;
/
BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/
SELECT * FROM Employees;

CREATE OR REPLACE PROCEDURE TransferFunds
(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN

    SELECT balance
    INTO v_balance
    FROM BankAccounts
    WHERE account_id = p_from_account;

    IF v_balance >= p_amount THEN

        UPDATE BankAccounts
        SET balance = balance - p_amount
        WHERE account_id = p_from_account;

        UPDATE BankAccounts
        SET balance = balance + p_amount
        WHERE account_id = p_to_account;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful.');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance.');

    END IF;

END;
/
BEGIN
    TransferFunds(1001,1002,5000);
END;
/
SELECT * FROM BankAccounts;