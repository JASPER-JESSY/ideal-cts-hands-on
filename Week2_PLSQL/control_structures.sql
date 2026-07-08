CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    balance NUMBER,
    isVIP VARCHAR2(5)
);

CREATE TABLE Loans (
    loan_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    interest_rate NUMBER(5,2),
    due_date DATE,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);
INSERT INTO Customers VALUES (1,'Rahul',65,12000,'FALSE');
INSERT INTO Customers VALUES (2,'Priya',45,8000,'FALSE');
INSERT INTO Customers VALUES (3,'John',70,15000,'FALSE');

INSERT INTO Loans VALUES (101,1,10,DATE '2026-07-20');
INSERT INTO Loans VALUES (102,2,8,DATE '2026-08-25');
INSERT INTO Loans VALUES (103,3,9,DATE '2026-07-28');

COMMIT;

SET SERVEROUTPUT ON;

BEGIN
    FOR rec IN (
        SELECT c.customer_id,
               c.age,
               l.loan_id,
               l.interest_rate
        FROM Customers c
        JOIN Loans l
          ON c.customer_id = l.customer_id
    )
    LOOP
        IF rec.age > 60 THEN

            UPDATE Loans
            SET interest_rate = interest_rate * 0.99
            WHERE loan_id = rec.loan_id;

            DBMS_OUTPUT.PUT_LINE(
                'Discount applied to Customer ID: ' ||
                rec.customer_id
            );

        END IF;
    END LOOP;

    COMMIT;
END;
/
SET SERVEROUTPUT ON;

BEGIN
    FOR rec IN (
        SELECT customer_id,
               balance
        FROM Customers
    )
    LOOP

        IF rec.balance > 10000 THEN

            UPDATE Customers
            SET isVIP = 'TRUE'
            WHERE customer_id = rec.customer_id;

            DBMS_OUTPUT.PUT_LINE(
                'Customer ' ||
                rec.customer_id ||
                ' promoted to VIP'
            );

        END IF;

    END LOOP;

    COMMIT;
END;
/
SET SERVEROUTPUT ON;

BEGIN

    FOR rec IN (
        SELECT c.name,
               l.due_date
        FROM Customers c
        JOIN Loans l
          ON c.customer_id = l.customer_id
        WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear ' ||
            rec.name ||
            ', your loan is due on ' ||
            TO_CHAR(rec.due_date,'DD-MON-YYYY')
        );

    END LOOP;

END;
/