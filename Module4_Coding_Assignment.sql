/*
Question 1: Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
*/

SELECT
  CustomerId
  , FirstName
  , LastName
  , Address
  , UPPER(City || " " || Country) As Location
FROM Customers;

/*
Question 2: Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
*/

SELECT
  LOWER(SUBSTR(FirstName, 1, 4) || SUBSTR(LastName, 1, 2)) AS NewEmployeeId
FROM Employees;

/*
Question 3: Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
*/

SELECT
LastName
  , (STRFTIME("%Y", "now") - STRFTIME("%Y", HireDate))
  - (STRFTIME("%m-%d", "now") < STRFTIME("%m-%d", HireDate))
  AS YearsWorked
FROM Employees
WHERE YearsWorked >= 15
ORDER BY LastName ASC;

/*
Question 4: Profiling the Customers table, answer the following question.
*/

SELECT
  COUNT (*)
FROM Customers
WHERE Fax IS NULL;

--- Change Fax to Phone, Company, PostalCode, FirstName, Address
--- Fax, Phone, Company, PostalCode contains NULL

/*
Question 5: Find the cities with the most customers and rank in descending order.
*/

SELECT
  COUNT(*) AS counts
  , City
FROM Customers
GROUP BY City
ORDER BY counts DESC;

/*
Question 6: Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
*/

SELECT
  Customers.FirstName
  , Customers.LastName
  , Invoices.InvoiceId
  , Customers.FirstName || Customers.LastName || Invoices.InvoiceId As NewInvoiceId
FROM Customers INNER JOIN Invoices ON Customers.CustomerId = Invoices.CustomerId
WHERE NewInvoiceId LIKE "AstridGruber%";
