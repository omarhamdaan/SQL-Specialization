-- Query 1 : Using a subquery, find the names of all the tracks for the album "Californication".



SELECT Name,
       AlbumID
FROM Tracks
WHERE AlbumId IN (SELECT AlbumId
    FROM Albums
    WHERE Title = "Californication");

+-------------------+---------+
| Name              | AlbumId |
+-------------------+---------+
| Around The World  |     195 |
| Parallel Universe |     195 |
| Scar Tissue       |     195 |
| Otherside         |     195 |
| Get On Top        |     195 |
| Californication   |     195 |
| Easily            |     195 |
| Porcelain         |     195 |
| Emit Remmus       |     195 |
| I Like Dirt       |     195 |
+-------------------+---------+
(Output limit exceeded, 10 of 15 total rows shown)


--Query 2 : Find the total number of invoices for each customer along with the customer's full name, city and email.


SELECT FirstName,
       LastName,
       City,
       Email,
       COUNT(I.CustomerId) AS Invoices
FROM Customers C INNER JOIN Invoices I
ON C.CustomerId = I.CustomerId
GROUP BY C.CustomerId

+-----------+-------------+---------------------+--------------------------+----------+
| FirstName | LastName    | City                | Email                    | Invoices |
+-----------+-------------+---------------------+--------------------------+----------+
| Luís      | Gonçalves   | São José dos Campos | luisg@embraer.com.br     |        7 |
| Leonie    | Köhler      | Stuttgart           | leonekohler@surfeu.de    |        7 |
| François  | Tremblay    | Montréal            | ftremblay@gmail.com      |        7 |
| Bjørn     | Hansen      | Oslo                | bjorn.hansen@yahoo.no    |        7 |
| František | Wichterlová | Prague              | frantisekw@jetbrains.com |        7 |
| Helena    | Holý        | Prague              | hholy@gmail.com          |        7 |
| Astrid    | Gruber      | Vienne              | astrid.gruber@apple.at   |        7 |
| Daan      | Peeters     | Brussels            | daan_peeters@apple.be    |        7 |
| Kara      | Nielsen     | Copenhagen          | kara.nielsen@jubii.dk    |        7 |
| Eduardo   | Martins     | São Paulo           | eduardo@woodstock.com.br |        7 |
+-----------+-------------+---------------------+--------------------------+----------+
(Output limit exceeded, 10 of 59 total rows shown)




-- Query 3 : Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT Tracks.Name,
       A.Name AS Artist,
       Albums.Title AS Album,
       Tracks.TrackId
FROM ((Tracks INNER JOIN Albums
ON Tracks.AlbumId = Albums.AlbumId)
INNER JOIN Artists A
ON A.ArtistId = Albums.ArtistId); 


+-----------------------------------------+--------+---------------------------------------+---------+
| Name                                    | Artist | Album                                 | TrackId |
+-----------------------------------------+--------+---------------------------------------+---------+
| For Those About To Rock (We Salute You) | AC/DC  | For Those About To Rock We Salute You |       1 |
| Put The Finger On You                   | AC/DC  | For Those About To Rock We Salute You |       6 |
| Let's Get It Up                         | AC/DC  | For Those About To Rock We Salute You |       7 |
| Inject The Venom                        | AC/DC  | For Those About To Rock We Salute You |       8 |
| Snowballed                              | AC/DC  | For Those About To Rock We Salute You |       9 |
| Evil Walks                              | AC/DC  | For Those About To Rock We Salute You |      10 |
| C.O.D.                                  | AC/DC  | For Those About To Rock We Salute You |      11 |
| Breaking The Rules                      | AC/DC  | For Those About To Rock We Salute You |      12 |
| Night Of The Long Knives                | AC/DC  | For Those About To Rock We Salute You |      13 |
| Spellbound                              | AC/DC  | For Those About To Rock We Salute You |      14 |
+-----------------------------------------+--------+---------------------------------------+---------+
(Output limit exceeded, 10 of 3503 total rows shown)



--Query 4 : Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT M.LastName AS Manager, 
       E.LastName AS Employee
FROM Employees E INNER JOIN Employees M 
ON E.ReportsTo = M.EmployeeID

+----------+----------+
| Manager  | Employee |
+----------+----------+
| Adams    | Edwards  |
| Edwards  | Peacock  |
| Edwards  | Park     |
| Edwards  | Johnson  |
| Adams    | Mitchell |
| Mitchell | King     |
| Mitchell | Callahan |
+----------+----------+


--Query 5 : Find the name and ID of the artists who do not have albums. 

SELECT Name AS Artist,
       Artists.ArtistId,
       Albums.Title AS Album
FROM Artists
LEFT JOIN Albums
ON Artists.ArtistId = Albums.ArtistId
WHERE Album IS NULL

+----------------------------+----------+-------+
| Artist                     | ArtistId | Album |
+----------------------------+----------+-------+
| Milton Nascimento & Bebeto |       25 |  None |
| Azymuth                    |       26 |  None |
| João Gilberto              |       28 |  None |
| Bebel Gilberto             |       29 |  None |
| Jorge Vercilo              |       30 |  None |
| Baby Consuelo              |       31 |  None |
| Ney Matogrosso             |       32 |  None |
| Luiz Melodia               |       33 |  None |
| Nando Reis                 |       34 |  None |
| Pedro Luís & A Parede      |       35 |  None |
+----------------------------+----------+-------+
(Output limit exceeded, 10 of 71 total rows shown)




--Query 6 : Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName,
       LastName
FROM Employees
UNION
SELECT FirstName,
       LastName
FROM Customers
ORDER BY LastName DESC


+-----------+--------------+
| FirstName | LastName     |
+-----------+--------------+
| Fynn      | Zimmermann   |
| Stanisław | Wójcik       |
| František | Wichterlová  |
| Johannes  | Van der Berg |
| François  | Tremblay     |
| Mark      | Taylor       |
| Ellie     | Sullivan     |
| Victor    | Stevens      |
| Puja      | Srivastava   |
| Jack      | Smith        |
+-----------+--------------+
(Output limit exceeded, 10 of 67 total rows shown)




--Query 7 : See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT C.FirstName,
       C.LastName,
       C.City AS CustomerCity,
       I.BillingCity
FROM Customers C
INNER JOIN Invoices I
ON C.CustomerId = I.CustomerId
WHERE CustomerCity != BillingCity

+-----------+----------+--------------+-------------+
| FirstName | LastName | CustomerCity | BillingCity |
+-----------+----------+--------------+-------------+
+-----------+----------+--------------+-------------+
(Zero rows)


