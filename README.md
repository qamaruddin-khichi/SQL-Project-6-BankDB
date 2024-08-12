# SQL Project 6 - Bank Database

I took the dummy data of a bank from a blog [https://www.codersarts.com/forum/database-schema/creating-bank-database-tables-using-mysql?searchTerm=bank]

I created a bank database in MySQL, created 5 tables, and then inserted some data. After that, I wrote ten SQL queries for the problems given in that blog.

After that, I asked ChatGPT to provide me with more questions related to this database. ChatGPT provided me with 30 questions (Easy, Intermediate, & Advanced level), and I wrote queries for those.

I did all of this just to practice my SQL querying skills.

---

## Table of Contents

1. [10 Initial SQL Questions](#10-initial-sql-questions)
2. [SQL Code for 10 Initial Questions](#sql-code-for-10-initial-questions)
3. [30 Additional SQL Questions](#30-additional-sql-questions)
   - [Easy Level Questions](#easy-level-questions)
   - [Intermediate Level Questions](#intermediate-level-questions)
   - [Advanced Level Questions](#advanced-level-questions)
4. [SQL Code for 30 Questions (Easy, Intermediate, & Advanced Level)](#sql-code-for-30-questions-easy-intermediate-advanced-level)

---

## 10 Initial SQL Questions

1. **Write a query to display the customer number, first name, and customer’s date of birth.**  
   Display in sorted order of date of birth year and within that sort by first name.

2. **Write a query to display the customer’s number, first name, and middle name.**  
   The customers who don’t have a middle name, for them display the last name. Give the alias name as `Cust_Name`.

3. **Write a query to display account number, customer’s number, customer’s first name, last name, account opening date.**

4. **Write a query to display the number of customers from Delhi.**  
   Give the count an alias name of `Cust_Count`.

5. **Write a query to display the customer number, customer first name, account number for the customers whose accounts were created after the 15th of any month.**

6. **Write a query to display the female customers’ first names, city, and account number who are not into business, service, or studies.**

7. **Write a query to display city name and count of branches in that city.**  
   Give the count of branches an alias name of `Count_Branch`.

8. **Write a query to display account id, customer’s first name, customer’s last name for the customers whose account is Active.**

9. **Write a query to display the customer’s number, customer’s first name, branch id, and loan amount for people who have taken loans.**

10. **Write a query to display customer number, customer name, account number where the account status is terminated.**

---

## SQL Code for 10 initial questions

```
-- Problem #1:
-- Write a query to display the customer number, firstname, customer’s date of birth.
-- Display in sorted order of date of birth year and within that sort by firstname.

SELECT 
    custid, fname, dob AS date_of_birth
FROM
    customer
ORDER BY YEAR(date_of_birth) , fname;

-- Problem #2:
-- Write a query to display the customer’s number, first name, and middle name.
-- The customer’s who don’t have a middle name, for them display the last name. Give the alias name as Cust_Name.

SELECT 
    custid,
    fname,
    IF(mname IS NOT NULL, mname, ltname) AS Cust_Name
FROM
    customer;

-- Problem #3:
-- Write a query to display account number, customer’s number, customer’s firstname,lastname,account opening date.

SELECT 
    a.acnumber,
    a.custid,
    c.fname,
    c.ltname,
    a.aod AS account_opening_date
FROM
    account AS a
        JOIN
    customer AS c USING (custid);
    
-- Problem #4:
-- Write a query to display the number of customer’s from Delhi. Give the count an alias name of Cust_Count.

SELECT count(city) As Cust_count
FROM customer
WHERE city = "Delhi";

-- Problem # 5:
-- Write a query to display  the customer number, customer firstname,account number for the customer’s
-- whose accounts were created after 15th of any month.

SELECT 
    a.custid,
    c.fname,
    a.acnumber
FROM
    account AS a
        JOIN
    customer AS c USING (custid)
WHERE DAY(a.aod) > 15;

-- Problem # 6:
-- Write a query to display the customers firstname, city and account number
-- who are not into business, service or studies.

SELECT 
    c.fname, c.city, a.acnumber
FROM
    customer AS c
        JOIN
    account AS a USING (custid)
WHERE
    c.occupation NOT IN ('Business' , 'Service', 'Studies');

-- Problem # 7:
-- Write a query to display city name and count of branches in that city.
-- Give the count of branches an alias name of Count_Branch.

SELECT 
    bcity,
    COUNT(BID) AS Count_Branch
FROM
    branch AS b
GROUP BY bcity;

-- Problem # 8:
-- Write a query to display account id, customer’s firstname, customer’s lastname
-- for the customer’s whose account is Active.

SELECT 
    a.acnumber,
    c.fname,
    c.ltname
FROM
    account AS a
        JOIN
    customer AS c USING (custid)
WHERE a.astatus = "active";

-- Problem # 9:
-- Write a query to display the customer’s number, customer’s firstname,
-- branch id and loan amount for people who have taken loans.

SELECT DISTINCT
    c.custid, c.fname, l.bid, l.loan_amount
FROM
    customer AS c
        JOIN
    LOAN AS l USING (custid);
    
-- Problem # 10:
-- Write a query to display customer number, customer name,
-- account number where the account status is terminated.

SELECT 
    a.acnumber,
    c.fname,
    c.ltname
FROM
    account AS a
        JOIN
    customer AS c USING (custid)
WHERE a.astatus = "terminated";
```

---

## 30 Additional SQL Questions

### Easy Level Questions

1. List all the customers.
2. Retrieve all branches located in Mumbai.
3. Show all account numbers and their corresponding opening balances.
4. Find the details of the customer with the `custid 'C00001'`.
5. List all transactions done via 'Cash'.
6. Retrieve all loans taken by customers in the branch with `bid 'B00001'`.
7. Find all accounts that are currently 'Active'.
8. List the names of customers who have a loan.
9. Show the details of all transactions in the account `'A00001'`.
10. Retrieve all the loan amounts greater than 200000.

### Intermediate Level Questions

1. List the customers who have accounts in the branch `'B00001'`.
2. Show the total transaction amount for each account.
3. Find the number of active accounts in each branch.
4. List the customers who have taken loans from more than one branch.
5. Retrieve the average opening balance of all accounts.
6. Find the customers who have made withdrawals in March 2013.
7. Show the account numbers and their corresponding customers' names for accounts opened before 2010.
8. Retrieve the details of customers who have both an account and a loan.
9. List the transactions in 'Delhi' branches.
10. Show the total loan amount taken by each customer.

### Advanced Level Questions

1. Find the total balance of all accounts after all transactions are applied.
2. List the customers who have made more than three transactions.
3. Retrieve the details of customers who have accounts in more than one branch.
4. Show the branch with the highest number of active accounts.
5. Find the customers who have taken the highest loan amounts.
6. Retrieve the customers who have an average transaction amount greater than 5000.
7. List the branches and the total loan amount issued in each branch.
8. Show the accounts that have had no transactions.
9. Find the branches where the total transaction amount exceeds 20000.
10. Retrieve the details of the top 5 customers by total transaction amount.

---

## SQL Code for 30 questions (Easy, Intermediate, & Advanced Level)

```
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
LIMIT 5;
```
