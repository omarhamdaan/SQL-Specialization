-- Query 1 : Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)



SELECT CustomerId,
       FirstName || " " || LastName AS FullName,
       Address,
       UPPER(City || " " || Country) AS CityCountry
FROM Customers


+------------+-----------------------+--------------------------------------+----------------------------+
| CustomerId | FullName              | Address                              | CityCountry                |
+------------+-----------------------+--------------------------------------+----------------------------+
|          1 | Luís Gonçalves        | Av. Brigadeiro Faria Lima, 2170      | SãO JOSé DOS CAMPOS BRAZIL |
|          2 | Leonie Köhler         | Theodor-Heuss-Straße 34              | STUTTGART GERMANY          |
|          3 | François Tremblay     | 1498 rue Bélanger                    | MONTRéAL CANADA            |
|          4 | Bjørn Hansen          | Ullevålsveien 14                     | OSLO NORWAY                |
|          5 | František Wichterlová | Klanova 9/506                        | PRAGUE CZECH REPUBLIC      |
|          6 | Helena Holý           | Rilská 3174/6                        | PRAGUE CZECH REPUBLIC      |
|          7 | Astrid Gruber         | Rotenturmstraße 4, 1010 Innere Stadt | VIENNE AUSTRIA             |
|          8 | Daan Peeters          | Grétrystraat 63                      | BRUSSELS BELGIUM           |
|          9 | Kara Nielsen          | Sønder Boulevard 51                  | COPENHAGEN DENMARK         |
|         10 | Eduardo Martins       | Rua Dr. Falcão Filho, 155            | SãO PAULO BRAZIL           |
|         11 | Alexandre Rocha       | Av. Paulista, 2022                   | SãO PAULO BRAZIL           |
|         12 | Roberto Almeida       | Praça Pio X, 119                     | RIO DE JANEIRO BRAZIL      |
|         13 | Fernanda Ramos        | Qe 7 Bloco G                         | BRASíLIA BRAZIL            |
|         14 | Mark Philips          | 8210 111 ST NW                       | EDMONTON CANADA            |
|         15 | Jennifer Peterson     | 700 W Pender Street                  | VANCOUVER CANADA           |
|         16 | Frank Harris          | 1600 Amphitheatre Parkway            | MOUNTAIN VIEW USA          |
|         17 | Jack Smith            | 1 Microsoft Way                      | REDMOND USA                |
|         18 | Michelle Brooks       | 627 Broadway                         | NEW YORK USA               |
|         19 | Tim Goyer             | 1 Infinite Loop                      | CUPERTINO USA              |
|         20 | Dan Miller            | 541 Del Medio Avenue                 | MOUNTAIN VIEW USA          |
|         21 | Kathy Chase           | 801 W 4th Street                     | RENO USA                   |
|         22 | Heather Leacock       | 120 S Orange Ave                     | ORLANDO USA                |
|         23 | John Gordon           | 69 Salem Street                      | BOSTON USA                 |
|         24 | Frank Ralston         | 162 E Superior Street                | CHICAGO USA                |
|         25 | Victor Stevens        | 319 N. Frances Street                | MADISON USA                |
+------------+-----------------------+--------------------------------------+----------------------------+
(Output limit exceeded, 25 of 59 total rows shown)


--Query 2 : Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.


SELECT FirstName,
       LastName,
       LOWER(SUBSTR(FirstName,1,4)) AS A,
       LOWER(SUBSTR(LastName,1,2)) AS B,
       LOWER(SUBSTR(FirstName,1,4)) || LOWER(SUBSTR(LastName,1,2)) AS userId
FROM Employees

+-----------+----------+------+----+--------+
| FirstName | LastName | A    | B  | userId |
+-----------+----------+------+----+--------+
| Andrew    | Adams    | andr | ad | andrad |
| Nancy     | Edwards  | nanc | ed | nanced |
| Jane      | Peacock  | jane | pe | janepe |
| Margaret  | Park     | marg | pa | margpa |
| Steve     | Johnson  | stev | jo | stevjo |
| Michael   | Mitchell | mich | mi | michmi |
| Robert    | King     | robe | ki | robeki |
| Laura     | Callahan | laur | ca | laurca |
+-----------+----------+------+----+--------+


-- Query 3 : Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.

SELECT FirstName,
       LastName,
       HireDate,
       (STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate)) 
          - (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', HireDate)) 
          AS YearsWorked
FROM Employees
WHERE YearsWorked >= 15
ORDER BY LastName ASC

+-----------+----------+---------------------+-------------+
| FirstName | LastName | HireDate            | YearsWorked |
+-----------+----------+---------------------+-------------+
| Andrew    | Adams    | 2002-08-14 00:00:00 |          21 |
| Laura     | Callahan | 2004-03-04 00:00:00 |          20 |
| Nancy     | Edwards  | 2002-05-01 00:00:00 |          21 |
| Steve     | Johnson  | 2003-10-17 00:00:00 |          20 |
| Robert    | King     | 2004-01-02 00:00:00 |          20 |
| Michael   | Mitchell | 2003-10-17 00:00:00 |          20 |
| Margaret  | Park     | 2003-05-03 00:00:00 |          20 |
| Jane      | Peacock  | 2002-04-01 00:00:00 |          22 |
+-----------+----------+---------------------+-------------+


--Query 4 : Find the cities with the most customers and rank in descending order.



SELECT City,
       COUNT(*)
FROM Customers
GROUP BY City
ORDER BY COUNT(*) DESC
+---------------+----------+
| City          | COUNT(*) |
+---------------+----------+
| Berlin        |        2 |
| London        |        2 |
| Mountain View |        2 |
| Paris         |        2 |
| Prague        |        2 |
| São Paulo     |        2 |
| Amsterdam     |        1 |
| Bangalore     |        1 |
| Bordeaux      |        1 |
| Boston        |        1 |
| Brasília      |        1 |
| Brussels      |        1 |
| Budapest      |        1 |
| Buenos Aires  |        1 |
| Chicago       |        1 |
| Copenhagen    |        1 |
| Cupertino     |        1 |
| Delhi         |        1 |
| Dijon         |        1 |
| Dublin        |        1 |
| Edinburgh     |        1 |
| Edmonton      |        1 |
| Fort Worth    |        1 |
| Frankfurt     |        1 |
| Halifax       |        1 |
+---------------+----------+
(Output limit exceeded, 25 of 53 total rows shown)

--Query 5 : Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.

SELECT C.FirstName,
       C.LastName,
       I.InvoiceId,
       C.FirstName || C.LastName || I.InvoiceID AS NewId
FROM Customers C INNER JOIN Invoices I
ON C.CustomerId = I.CustomerID
WHERE NewId LIKE 'AstridGruber%'

+-----------+----------+-----------+-----------------+
| FirstName | LastName | InvoiceId | NewId           |
+-----------+----------+-----------+-----------------+
| Astrid    | Gruber   |        78 | AstridGruber78  |
| Astrid    | Gruber   |        89 | AstridGruber89  |
| Astrid    | Gruber   |       144 | AstridGruber144 |
| Astrid    | Gruber   |       273 | AstridGruber273 |
| Astrid    | Gruber   |       296 | AstridGruber296 |
| Astrid    | Gruber   |       318 | AstridGruber318 |
| Astrid    | Gruber   |       370 | AstridGruber370 |
+-----------+----------+-----------+-----------------+

