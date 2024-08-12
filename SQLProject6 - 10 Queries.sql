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

