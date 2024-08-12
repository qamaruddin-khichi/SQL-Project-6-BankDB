-- ==================================================================================================================
-- ========================================== EASY LEVEL QUESTIONS ==================================================
-- ==================================================================================================================

-- 1. List all the customers.

SELECT CONCAT(fname, ' ', ltname) AS Customer_Name
FROM customer;

-- 2. Retrieve all branches located in Mumbai.

SELECT bname
FROM branch
WHERE bcity = "Mumbai";

-- 3. Show all account numbers and their corresponding opening balances.

SELECT
	acnumber,
    opening_balance
FROM account;

-- 4. Find the details of the customer with the custid 'C00001'.

SELECT *
FROM customer
WHERE custid = "C00001";

-- 5. List all transactions done via 'Cash'.

SELECT *
FROM trandetails
WHERE medium_of_transaction = "Cash";

-- 6. Retrieve all loans taken by customers in the branch with bid 'B00001'.

SELECT 
    custid,
    c.fname,
    c.ltname,
    l.bid,
    l.loan_amount
FROM
    loan AS l
        JOIN
    customer AS c USING (custid)
WHERE
    l.bid = 'B00001';
    
-- 7. Find all accounts that are currently 'Active'.

SELECT
	acnumber,
    astatus
FROM account
WHERE astatus = "Active";

-- 8. List the names of customers who have a loan.

SELECT 
    c.fname,
    c.ltname,
    l.loan_amount
FROM
    loan AS l
        JOIN
    customer AS c USING (custid);
    
-- 9. Show the details of all transactions in the account 'A00001'.

SELECT *
FROM trandetails
WHERE acnumber = "A00001";

-- 10. Retrieve all the loan amounts greater than 200000.

SELECT *
FROM loan
WHERE loan_amount > 200000;

-- ==================================================================================================================
-- ========================================== INTERMEDIATE LEVEL QUESTIONS ==========================================
-- ==================================================================================================================

-- 11. List the customers who have accounts in the branch 'B00001'.

SELECT 
    c.custid,
    c.fname,
    c.ltname,
    a.acnumber,
    b.bname
FROM
    account AS a
        LEFT JOIN
    branch AS b USING (bid)
        JOIN
    customer AS c
WHERE
    b.bid = 'B00001';

-- 12. Show the total transaction amount for each account.

SELECT 
    t.acnumber, SUM(t.transaction_amount) AS total_transation_amount
FROM
    account AS a
        JOIN
    trandetails AS t USING (acnumber)
GROUP BY t.acnumber;
    
-- 13. Find the number of active accounts in each branch.

SELECT 
    b.bname AS branch_name, COUNT(a.acnumber) AS no_of_accounts
FROM
    account AS a
        JOIN
    branch AS b USING (bid)
WHERE
    a.astatus = 'Active'
GROUP BY branch_name;

-- 14. List the customers who have taken loans from more than one branch.

SELECT 
    c.fname, c.ltname
FROM
    customer c
        JOIN
    loan l USING (custid)
        JOIN
    branch b USING (bid)
GROUP BY c.fname , c.ltname
HAVING COUNT(DISTINCT b.bid) > 1;

-- 15. Retrieve the average opening balance of all accounts.

SELECT 
    acnumber,
    (opening_balance) AS avg_opening_balance
FROM
    account;

-- 16. Find the customers who have made withdrawals in March 2013.

SELECT 
    c.fname, c.ltname, t.*
FROM
    customer c
        JOIN
    account a USING (custid)
        JOIN
    trandetails t USING (acnumber)
WHERE
    MONTH(t.dot) = 3 AND YEAR(t.dot) = 2013;
    
-- 17. Show the account numbers and their corresponding customers' names for accounts opened before 2010.

SELECT 
    C.fname, C.ltname, A.acnumber
FROM
    customer C
        JOIN
    account A ON C.custid = A.custid
WHERE
    YEAR(A.aod) < 2010;
    
-- 18. Retrieve the details of customers who have both an account and a loan.

SELECT C.fname, C.ltname, L.loan_amount
FROM customer C
JOIN loan L
USING (custid);

-- 19. List the transactions in 'Delhi' branches.

SELECT 
    A.acnumber,
    B.bid,
    T.tnumber,
    T.transaction_amount,
    T.transaction_type
FROM
    trandetails T
        JOIN
    account A USING (acnumber)
        JOIN
    branch B USING (bid)
WHERE
    B.bcity = 'Delhi';

-- 20. Show the total loan amount taken by each customer.

SELECT 
    C.fname,
    C.ltname,
    SUM(L.loan_amount) AS total_loan
FROM
    customer C
        JOIN
    loan L USING (custid)
GROUP BY C.fname , C.ltname
ORDER BY total_loan DESC;

-- ==================================================================================================================
-- ========================================== ADVANCED LEVEL QUESTIONS ==================================================
-- ==================================================================================================================

-- 21. Find the total balance of all accounts after all transactions are applied.

SELECT 
    A.acnumber,
    SUM(T.transaction_amount) AS total_balance
FROM
    account A
        JOIN
    trandetails T USING (acnumber)
GROUP BY A.acnumber
ORDER BY total_balance;

-- 22. List the customers who have made more than three transactions.

SELECT 
    C.fname, C.ltname
FROM
    customer C
        JOIN
    account A USING (custid)
        JOIN
    trandetails T USING (acnumber)
GROUP BY C.fname , C.ltname
HAVING COUNT(T.tnumber) > 3;

-- 23. Retrieve the details of customers who have accounts in more than one branch.

SELECT 
    C.custid, C.fname, C.ltname, B.bname
FROM
    customer C
        JOIN
    account A USING (custid)
        JOIN
    branch B USING (bid)
GROUP BY C.custid , C.fname , C.ltname , B.bname
HAVING COUNT(B.bname) > 1;

-- 24. Show the branch with the highest number of active accounts.

SELECT 
    B.bname, COUNT(A.astatus) AS account_type
FROM
    account A
        JOIN
    branch B USING (bid)
WHERE
    A.astatus = 'Active'
GROUP BY B.bname
ORDER BY account_type DESC;

-- 25. Find the customers who have taken the highest loan amounts.

SELECT 
    C.fname, C.ltname, SUM(L.loan_amount) AS total_amount
FROM
    customer C
        JOIN
    loan L USING (custid)
GROUP BY C.fname , C.ltname
ORDER BY total_amount DESC;

-- 26. Retrieve the customers who have an average transaction amount greater than 5000.

SELECT 
    C.fname,
    C.ltname,
    ROUND(AVG(T.transaction_amount), 2) AS avg_trans_amount
FROM
    customer C
        JOIN
    account A USING (custid)
        JOIN
    trandetails T USING (acnumber)
GROUP BY C.fname , C.ltname
HAVING avg_trans_amount > 5000;

-- 27. List the branches and the total loan amount issued in each branch. 

SELECT 
    B.bname, SUM(L.loan_amount) AS total_loan
FROM
    branch B
        JOIN
    loan L USING (bid)
GROUP BY B.bname
ORDER BY total_loan DESC;

-- 28. Show the accounts that have had no transactions.

SELECT 
    A.acnumber
FROM
    account A
        JOIN
    trandetails T USING (acnumber)
GROUP BY A.acnumber
HAVING COUNT(T.tnumber) < 1;

-- 29. Find the branches where the total transaction amount exceeds 20000.

SELECT 
    B.bname, SUM(T.transaction_amount) AS total_trans_amount
FROM
    branch B
        JOIN
    account A USING (bid)
        JOIN
    trandetails T USING (acnumber)
GROUP BY B.bname
HAVING total_trans_amount > 20000;

-- 30. Retrieve the details of the top 5 customers by total transaction amount.

SELECT 
    C.custid, C.fname, C.ltname
FROM
    customer C
        JOIN
    account A USING (custid)
        JOIN
    trandetails T USING (acnumber)
ORDER BY T.transaction_amount DESC
LIMIT 5