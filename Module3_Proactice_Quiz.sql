/*
Question 1
How many albums does the artist Led Zeppelin have?
*/

SELECT COUNT(Albumid) AS totalAlbums
FROM albums
WHERE Artistid = (
    SELECT Artistid
    FROM artists
    WHERE Name = "Led Zeppelin"
)

/*
Question 2
Create a list of album titles and the unit prices for the artist "Audioslave".
*/

SELECT
artists.Name
, tracks.UnitPrice
FROM (albums INNER JOIN artists ON albums.Artistid = artists.Artistid)
INNER JOIN tracks ON tracks.Albumid = albums.Albumid
WHERE artists.Name = "Audioslave";

/*
Question 3
Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?
*/

SELECT
customers.FirstName
, customers.LastName
, invoices.Invoiceid
FROM (customers LEFT JOIN invoices ON customers.Customerid = invoices.Customerid)
WHERE Invoiceid IS NULL;

/*
Question 4
Find the total price for each album. What is the total price for the album "Big Ones"?
*/

SELECT
albums.Title
, SUM(tracks.UnitPrice)
FROM albums INNER JOIN tracks ON albums.Albumid = tracks.Albumid
WHERE albums.Title = "Big Ones"
GROUP BY albums.Title;

/*
Question 5
How many records are created when you apply a Cartesian join to the invoice and invoice items table?
*/

SELECT COUNT(*)
FROM invoices CROSS JOIN invoice_items;
