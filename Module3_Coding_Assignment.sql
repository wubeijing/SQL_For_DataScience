/*
Question 1: Using a subquery, find the names of all the tracks for the album "Californication".
*/

SELECT
Tracks.name
FROM Tracks
WHERE Tracks.AlbumId = (
  SELECT Albums.AlbumId
  FROM Albums
  WHERE Albums.Title = "Californication"
)

/*
Question 2: Find the total number of invoices for each customer along with the customer's full name, city and email.
*/

SELECT
Customers.FirstName
, Customers.LastName
, Customers.City
, Customers.Email
, COUNT (Invoices.CustomerId) AS TotalInvoices
FROM (
  Customers INNER JOIN Invoices ON Customers.CustomerId = Invoices.CustomerId
)
GROUP BY Customers.CustomerId;

/*
Question 3: Retrieve the track name, album, artistID, and trackID for all the albums.
*/

SELECT
Tracks.Name
, Albums.Title
, Albums.ArtistId
, Tracks.TrackId
FROM (
  Tracks INNER JOIN Albums ON Tracks.AlbumId = Albums.AlbumId
)

/*
Question 4: Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
*/

SELECT
M.LastName AS Manager
, E.LastName AS Employee
FROM (
  Employees E INNER JOIN Employees M
  ON E.ReportsTo = M.EmployeeId
)

/*
Question 5: Find the name and ID of the artists who do not have albums.
*/

SELECT
Artists.ArtistId
, Artists.Name
FROM (
  Artists LEFT JOIN Albums ON Artists.ArtistId = Albums.ArtistId
)
WHERE Albums.Title IS NULL;


/*
Question 6: Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
*/

SELECT
FirstName
, LastName
FROM Employees
UNION
SELECT
FirstName
, LastName
FROM Customers
ORDER BY LastName DESC;

/*
Question 7: See if there are any customers who have a different city listed in their billing city versus their customer city.
*/

SELECT
Customers.FirstName
, Customers.LastName
, Customers.City
, Invoices.BillingCity
FROM (
  Customers INNER JOIN Invoices ON Customers.CustomerId = Invoices.CustomerId
)
WHERE Customers.City != Invoices.BillingCity;
