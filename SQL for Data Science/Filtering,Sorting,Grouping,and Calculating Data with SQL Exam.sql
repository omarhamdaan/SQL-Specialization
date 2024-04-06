
--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the 
--ER diagram to familiarize yourself with the table and column names to write accurate queries and get the 
--appropriate answers.

--Question 1
--Find all the tracks that have a length of 5,000,000 milliseconds or more.


select milliseconds from tracks where milliseconds >=5000000 ;


+--------------+
| Milliseconds |
+--------------+
|      5286953 |
|      5088838 |
+--------------+

--Question 2
-- Find all the invoices whose total is between $5 and $15 dollars.

select InvoiceID,total from Invoices where total between 5 and 15;


+-----------+-------+
| InvoiceId | Total |
+-----------+-------+
|         3 |  5.94 |
|         4 |  8.91 |
|         5 | 13.86 |
|        10 |  5.94 |
|        11 |  8.91 |
|        12 | 13.86 |
|        17 |  5.94 |
|        18 |  8.91 |
|        19 | 13.86 |
|        24 |  5.94 |
+-----------+-------+
(Output limit exceeded, 10 of 168 total rows shown)


--Question 3
-- Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

select * FROM Customers where State in('RJ','DF','AB','BC','CA','WA','NY')


+------------+-----------+----------+-----------------------+---------------------------+----------------+-------+---------+------------+--------------------+--------------------+-------------------------------+--------------+
| CustomerId | FirstName | LastName | Company               | Address                   | City           | State | Country | PostalCode | Phone              | Fax                | Email                         | SupportRepId |
+------------+-----------+----------+-----------------------+---------------------------+----------------+-------+---------+------------+--------------------+--------------------+-------------------------------+--------------+
|         12 | Roberto   | Almeida  | Riotur                | Praça Pio X, 119          | Rio de Janeiro | RJ    | Brazil  | 20040-020  | +55 (21) 2271-7000 | +55 (21) 2271-7070 | roberto.almeida@riotur.gov.br |            3 |
|         13 | Fernanda  | Ramos    | None                  | Qe 7 Bloco G              | Brasília       | DF    | Brazil  | 71020-677  | +55 (61) 3363-5547 | +55 (61) 3363-7855 | fernadaramos4@uol.com.br      |            4 |
|         14 | Mark      | Philips  | Telus                 | 8210 111 ST NW            | Edmonton       | AB    | Canada  | T6G 2C7    | +1 (780) 434-4554  | +1 (780) 434-5565  | mphilips12@shaw.ca            |            5 |
|         15 | Jennifer  | Peterson | Rogers Canada         | 700 W Pender Street       | Vancouver      | BC    | Canada  | V6C 1G8    | +1 (604) 688-2255  | +1 (604) 688-8756  | jenniferp@rogers.ca           |            3 |
|         16 | Frank     | Harris   | Google Inc.           | 1600 Amphitheatre Parkway | Mountain View  | CA    | USA     | 94043-1351 | +1 (650) 253-0000  | +1 (650) 253-0000  | fharris@google.com            |            4 |
|         17 | Jack      | Smith    | Microsoft Corporation | 1 Microsoft Way           | Redmond        | WA    | USA     | 98052-8300 | +1 (425) 882-8080  | +1 (425) 882-8081  | jacksmith@microsoft.com       |            5 |
|         18 | Michelle  | Brooks   | None                  | 627 Broadway              | New York       | NY    | USA     | 10012-2612 | +1 (212) 221-3546  | +1 (212) 221-4679  | michelleb@aol.com             |            3 |
|         19 | Tim       | Goyer    | Apple Inc.            | 1 Infinite Loop           | Cupertino      | CA    | USA     | 95014      | +1 (408) 996-1010  | +1 (408) 996-1011  | tgoyer@apple.com              |            3 |
|         20 | Dan       | Miller   | None                  | 541 Del Medio Avenue      | Mountain View  | CA    | USA     | 94040-111  | +1 (650) 644-3358  | None               | dmiller@comcast.com           |            4 |
+------------+-----------+----------+-----------------------+---------------------------+----------------+-------+---------+------------+--------------------+--------------------+-------------------------------+--------------+



--Question 4

--Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

select * from invoices where CustomerId in(56,58) and Total between 1 and 5


+-----------+------------+---------------------+---------------------+--------------+--------------+----------------+-------------------+-------+
| InvoiceId | CustomerId | InvoiceDate         | BillingAddress      | BillingCity  | BillingState | BillingCountry | BillingPostalCode | Total |
+-----------+------------+---------------------+---------------------+--------------+--------------+----------------+-------------------+-------+
|       119 |         56 | 2010-06-12 00:00:00 | 307 Macacha Güemes  | Buenos Aires |         None | Argentina      | 1106              |  1.98 |
|       142 |         56 | 2010-09-14 00:00:00 | 307 Macacha Güemes  | Buenos Aires |         None | Argentina      | 1106              |  3.96 |
|       337 |         56 | 2013-01-28 00:00:00 | 307 Macacha Güemes  | Buenos Aires |         None | Argentina      | 1106              |  1.98 |
|       120 |         58 | 2010-06-12 00:00:00 | 12,Community Centre | Delhi        |         None | India          | 110017            |  1.98 |
|       315 |         58 | 2012-10-27 00:00:00 | 12,Community Centre | Delhi        |         None | India          | 110017            |  1.98 |
|       338 |         58 | 2013-01-29 00:00:00 | 12,Community Centre | Delhi        |         None | India          | 110017            |  3.96 |
|       412 |         58 | 2013-12-22 00:00:00 | 12,Community Centre | Delhi        |         None | India          | 110017            |  1.99 |
+-----------+------------+---------------------+---------------------+--------------+--------------+----------------+-------------------+-------+



--Question 5
-- Find all the tracks whose name starts with 'All'.

select * from tracks where Name like 'All%';

+---------+----------------------------------------+---------+-------------+---------+--------------------------------------------------+--------------+-----------+-----------+
| TrackId | Name                                   | AlbumId | MediaTypeId | GenreId | Composer                                         | Milliseconds |     Bytes | UnitPrice |
+---------+----------------------------------------+---------+-------------+---------+--------------------------------------------------+--------------+-----------+-----------+
|      38 | All I Really Want                      |       6 |           1 |       1 | Alanis Morissette & Glenn Ballard                |       284891 |   9375567 |      0.99 |
|     134 | All For You                            |      14 |           1 |       3 | None                                             |       235833 |   7726948 |      0.99 |
|     385 | All Star                               |      33 |           1 |       7 | Nando Reis                                       |       176326 |   5891697 |      0.99 |
|    1009 | All My Life                            |      81 |           1 |       4 | Foo Fighters                                     |       263653 |   8665545 |      0.99 |
|    1608 | All My Love                            |     130 |           1 |       1 | Robert Plant & John Paul Jones                   |       356284 |  11684862 |      0.99 |
|    1892 | All Within My Hands                    |     155 |           1 |       3 | Bob Rock/James Hetfield/Kirk Hammett/Lars Ulrich |       527986 |  17162741 |      0.99 |
|    2192 | All or None                            |     180 |           1 |       1 | Stone Gossard                                    |       277655 |   9104728 |      0.99 |
|    2274 | All Dead, All Dead                     |     186 |           1 |       1 | May                                              |       190119 |   6144878 |      0.99 |
|    2888 | All the Best Cowboys Have Daddy Issues |     230 |           3 |      19 | None                                             |      2555492 | 211743651 |      1.99 |
|    2969 | All Because Of You                     |     235 |           1 |       1 | Adam Clayton, Bono, Larry Mullen & The Edge      |       219141 |   7198014 |      0.99 |
|    2991 | All Along The Watchtower               |     237 |           1 |       1 | Dylan, Bob                                       |       264568 |   8623572 |      0.99 |
|    3003 | All I Want Is You                      |     237 |           1 |       1 | Bono/Clayton, Adam/Mullen Jr., Larry/The Edge    |       390243 |  12729820 |      0.99 |
|    3017 | All I Want Is You                      |     238 |           1 |       1 | U2 & Van Dyke Parks                              |       591986 |  19202252 |      0.99 |
|    3316 | All My Love                            |     258 |           1 |      17 | E. Schrody/L. Dimant                             |       200620 |   8027065 |      0.99 |
|    3374 | All Night Thing                        |     269 |           2 |      23 | None                                             |       231803 |   3997982 |      0.99 |
+---------+----------------------------------------+---------+-------------+---------+--------------------------------------------------+--------------+-----------+-----------+


--Question 6 
--Find all the customer emails that start with "J" and are from gmail.com.

select * from customers where Email like 'J%@gmail.com'

+------------+-----------+----------+---------+-------------+----------------+-------+---------+------------+-------------------+------+---------------------+--------------+
| CustomerId | FirstName | LastName | Company | Address     | City           | State | Country | PostalCode | Phone             |  Fax | Email               | SupportRepId |
+------------+-----------+----------+---------+-------------+----------------+-------+---------+------------+-------------------+------+---------------------+--------------+
|         28 | Julia     | Barnett  |    None | 302 S 700 E | Salt Lake City | UT    | USA     | 84102      | +1 (801) 531-7272 | None | jubarnett@gmail.com |            5 |
+------------+-----------+----------+---------+-------------+----------------+-------+---------+------------+-------------------+------+---------------------+--------------+


--Question 7
-- Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

Select * from invoices where BillingCity in 
('Brasília','Edmonton','Vancouver') 
ORDER BY InvoiceId  DESC;


+-----------+------------+---------------------+---------------------+-------------+--------------+----------------+-------------------+-------+
| InvoiceId | CustomerId | InvoiceDate         | BillingAddress      | BillingCity | BillingState | BillingCountry | BillingPostalCode | Total |
+-----------+------------+---------------------+---------------------+-------------+--------------+----------------+-------------------+-------+
|       362 |         14 | 2013-05-11 00:00:00 | 8210 111 ST NW      | Edmonton    | AB           | Canada         | T6G 2C7           | 13.86 |
|       351 |         14 | 2013-03-31 00:00:00 | 8210 111 ST NW      | Edmonton    | AB           | Canada         | T6G 2C7           |  1.98 |
|       328 |         15 | 2012-12-15 00:00:00 | 700 W Pender Street | Vancouver   | BC           | Canada         | V6C 1G8           |  0.99 |
|       319 |         13 | 2012-11-01 00:00:00 | Qe 7 Bloco G        | Brasília    | DF           | Brazil         | 71020-677         |  8.91 |
|       276 |         15 | 2012-04-26 00:00:00 | 700 W Pender Street | Vancouver   | BC           | Canada         | V6C 1G8           |  5.94 |
|       264 |         13 | 2012-03-03 00:00:00 | Qe 7 Bloco G        | Brasília    | DF           | Brazil         | 71020-677         | 13.86 |
|       254 |         15 | 2012-01-23 00:00:00 | 700 W Pender Street | Vancouver   | BC           | Canada         | V6C 1G8           |  3.96 |
|       253 |         13 | 2012-01-22 00:00:00 | Qe 7 Bloco G        | Brasília    | DF           | Brazil         | 71020-677         |  1.98 |
|       231 |         15 | 2011-10-21 00:00:00 | 700 W Pender Street | Vancouver   | BC           | Canada         | V6C 1G8           |  1.98 |
|       230 |         14 | 2011-10-08 00:00:00 | 8210 111 ST NW      | Edmonton    | AB           | Canada         | T6G 2C7           |  0.99 |
|       178 |         14 | 2011-02-17 00:00:00 | 8210 111 ST NW      | Edmonton    | AB           | Canada         | T6G 2C7           |  5.94 |
|       156 |         14 | 2010-11-15 00:00:00 | 8210 111 ST NW      | Edmonton    | AB           | Canada         | T6G 2C7           |  3.96 |
|       133 |         14 | 2010-08-13 00:00:00 | 8210 111 ST NW      | Edmonton    | AB           | Canada         | T6G 2C7           |  1.98 |
|       132 |         13 | 2010-07-31 00:00:00 | Qe 7 Bloco G        | Brasília    | DF           | Brazil         | 71020-677         |  0.99 |
|       102 |         15 | 2010-03-16 00:00:00 | 700 W Pender Street | Vancouver   | BC           | Canada         | V6C 1G8           |  9.91 |
|        80 |         13 | 2009-12-10 00:00:00 | Qe 7 Bloco G        | Brasília    | DF           | Brazil         | 71020-677         |  5.94 |
|        58 |         13 | 2009-09-07 00:00:00 | Qe 7 Bloco G        | Brasília    | DF           | Brazil         | 71020-677         |  3.96 |
|        47 |         15 | 2009-07-16 00:00:00 | 700 W Pender Street | Vancouver   | BC           | Canada         | V6C 1G8           | 13.86 |
|        36 |         15 | 2009-06-05 00:00:00 | 700 W Pender Street | Vancouver   | BC           | Canada         | V6C 1G8           |  1.98 |
|        35 |         13 | 2009-06-05 00:00:00 | Qe 7 Bloco G        | Brasília    | DF           | Brazil         | 71020-677         |  1.98 |
|         4 |         14 | 2009-01-06 00:00:00 | 8210 111 ST NW      | Edmonton    | AB           | Canada         | T6G 2C7           |  8.91 |
+-----------+------------+---------------------+---------------------+-------------+--------------+----------------+-------------------+-------+

--Question 8
--Show the number of orders placed by each customer.

SELECT CustomerId, COUNT(*) AS Orders
FROM Invoices
GROUP BY CustomerId
ORDER BY Orders DESC

+------------+--------+
| CustomerId | Orders |
+------------+--------+
|          1 |      7 |
|          2 |      7 |
|          3 |      7 |
|          4 |      7 |
|          5 |      7 |
|          6 |      7 |
|          7 |      7 |
|          8 |      7 |
|          9 |      7 |
|         10 |      7 |
+------------+--------+
(Output limit exceeded, 10 of 59 total rows shown)

--Question 9 Find the albums with 12 or more tracks.

SELECT AlbumId, Count(*) AS Ntracks
FROM Tracks
GROUP BY AlbumId
HAVING COUNT (*) >= 12

+---------+---------+
| AlbumId | Ntracks |
+---------+---------+
|       5 |      15 |
|       6 |      13 |
|       7 |      12 |
|       8 |      14 |
|      10 |      14 |
|      11 |      12 |
|      12 |      12 |
|      14 |      13 |
|      18 |      17 |
|      21 |      18 |
+---------+---------+
(Output limit exceeded, 10 of 158 total rows shown)
