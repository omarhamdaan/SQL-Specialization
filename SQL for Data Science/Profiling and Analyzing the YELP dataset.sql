Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = select count(*)   from attribute ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

ii. Business table = select count(*)   from business ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

iii. Category table = select count(*)   from category ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

iv. Checkin table = select count(*)   from checkin ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

v. elite_years table = select count(*)   from elite_years ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

vi. friend table = select count(*)   from friend ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

vii. hours table =select count(*)   from hours ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

viii. photo table = select count(*)   from photo ;
+----------+
| count(*) |
+----------+
|    10000 |
+-
ix. review table = select count(*)   from review ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

x. tip table = select count(*)   from tip ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

xi. user table = select count(*)   from user ;
+----------+
| count(*) |
+----------+
|    10000 |
+----------+

2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business =SELECT COUNT(DISTINCT id) FROM business;
+--------------------+
| COUNT(DISTINCT id) |
+--------------------+
|              10000 |
+--------------------+

ii. Hours = SELECT COUNT(DISTINCT business_id) FROM hours;
+-----------------------------+
| COUNT(DISTINCT business_id) |
+-----------------------------+
|                        1562 |
+-----------------------------+

iii. Category = SELECT COUNT(DISTINCT business_id) FROM category;
+-----------------------------+
| COUNT(DISTINCT business_id) |
+-----------------------------+
|                        2643 |
+-----------------------------+

iv. Attribute = SELECT COUNT(DISTINCT business_id) FROM attribute;
+-----------------------------+
| COUNT(DISTINCT business_id) |
+-----------------------------+
|                        1115 |
+-----------------------------+

v. Review = SELECT COUNT(DISTINCT id) FROM review;
+--------------------+
| COUNT(DISTINCT id) |
+--------------------+
|              10000 |
+--------------------+

vi. Checkin = SELECT COUNT(DISTINCT business_id) FROM checkin;

+-----------------------------+
| COUNT(DISTINCT business_id) |
+-----------------------------+
|                         493 |
+-----------------------------+

vii. Photo = SELECT COUNT(DISTINCT id) FROM photo;
+--------------------+
| COUNT(DISTINCT id) |
+--------------------+
|              10000 |
+--------------------+

viii. Tip =  SELECT COUNT(DISTINCT user_id) FROM tip; SELECT COUNT(DISTINCT business_id) FROM tip;


+-------------------------+
| COUNT(DISTINCT user_id) |		
+-------------------------+
|                     537 |
+-------------------------+
+-----------------------------+
| COUNT(DISTINCT business_id) |
+-----------------------------+
|                        3979 |
+-----------------------------+

ix. User =  SELECT COUNT(DISTINCT id) FROM user;
+--------------------+
| COUNT(DISTINCT id) |
+--------------------+
|              10000 |
+--------------------+

x. Friend = SELECT COUNT(DISTINCT user_id) FROM friend;
+-------------------------+
| COUNT(DISTINCT user_id) |
+-------------------------+
|                      11 |
+-------------------------+
xi. Elite_years = SELECT COUNT(DISTINCT user_id) FROM elite_years;

+-------------------------+
| COUNT(DISTINCT user_id) |
+-------------------------+
|                    2780 |
+-------------------------+
Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.


3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer:NO 

	
	SQL code used to arrive at answer : 
SELECT COUNT(*)
		FROM user
		WHERE id IS NULL OR 
		  name IS NULL OR 
		  review_count IS NULL OR 
		  yelping_since IS NULL OR
		  useful IS NULL OR 
		  funny IS NULL OR 
		  cool IS NULL OR 
		  fans IS NULL OR 
		  average_stars IS NULL OR 
		  compliment_hot IS NULL OR 
		  compliment_more IS NULL OR 
		  compliment_profile IS NULL OR 
		  compliment_cute IS NULL OR 
		  compliment_list IS NULL OR 
		  compliment_note IS NULL OR 
		  compliment_plain IS NULL OR 
		  compliment_cool IS NULL OR 
		  compliment_funny IS NULL OR 
		  compliment_writer IS NULL OR 
		  compliment_photos IS NULL 
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars  

	select min(stars) from review
	select max(stars) from review
	select avg(stars) from review

	
		min:	1	max:5  		avg: 3.7082		
		
	ii. Table: Business, Column: Stars

	select min(stars) from business
	select max(stars) from business
	select avg(stars) from business
	
		min:1.0		max:5.0		avg:3.6549
		
	
	iii. Table: Tip, Column: Likes
		select min(likes) from tip
		select max(likes) from tip
		select avg(likes) from tip

		min:0		max:2		avg:0.0144
		
	
	iv. Table: Checkin, Column: Count
		select min(count) from checkin
		select max(count) from checkin
		select avg(count) from checkin
	
		min:1		max:53		avg:1.9414
		
	
	v. Table: User, Column: Review_count
		select min(review_count) from user
		select max(review_count) from user
		select avg(review_count) from user
	
		min:0		max:2000	avg:24.2995


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
		
		select city , sum(review_count) as reviews  from business 
		GROUP BY city
		ORDER BY reviews desc
	
	
	Copy and Paste the Result Below:
	
	+-----------------+---------+
| city            | reviews |
+-----------------+---------+
| Las Vegas       |   82854 |
| Phoenix         |   34503 |
| Toronto         |   24113 |
| Scottsdale      |   20614 |
| Charlotte       |   12523 |
| Henderson       |   10871 |
| Tempe           |   10504 |
| Pittsburgh      |    9798 |
| Montréal        |    9448 |
| Chandler        |    8112 |
| Mesa            |    6875 |
| Gilbert         |    6380 |
| Cleveland       |    5593 |
| Madison         |    5265 |
| Glendale        |    4406 |
| Mississauga     |    3814 |
| Edinburgh       |    2792 |
| Peoria          |    2624 |
| North Las Vegas |    2438 |
| Markham         |    2352 |
| Champaign       |    2029 |
| Stuttgart       |    1849 |
| Surprise        |    1520 |
| Lakewood        |    1465 |
| Goodyear        |    1155 |
+-----------------+---------+
(Output limit exceeded, 25 of 362 total rows shown)

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:
select  stars as star_rating, count(id) as "count"
from business
where city = "Avon"
group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+-------+
| star_rating | count |
+-------------+-------+
|         1.5 |     1 |
|         2.5 |     2 |
|         3.5 |     3 |
|         4.0 |     2 |
|         4.5 |     1 |
|         5.0 |     1 |
+-------------+-------+



ii. Beachwood

SQL code used to arrive at answer:
select  stars as star_rating, count(id) as "count"
from business
where city = "Beachwood"
group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+-------+
| star_rating | count |
+-------------+-------+
|         2.0 |     1 |
|         2.5 |     1 |
|         3.0 |     2 |
|         3.5 |     2 |
|         4.0 |     1 |
|         4.5 |     2 |
|         5.0 |     5 |
+-------------+-------+
		
7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

	select id , review_count as reviews from user
	group by id
	order by reviews desc
	limit 3
		
	Copy and Paste the Result Below:

+------------------------+---------+
| id                     | reviews |
+------------------------+---------+
| -G7Zkl1wIWBBmD0KRy_sCw |    2000 |
| -3s52C4zL_DHRK0ULG6qtg |    1629 |
| -8lbUNlXVSoXqaRRiHiSNg |    1339 |
+------------------------+---------+


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	No , based on the results of the query : 
			SELECT id,
			   name,
			   review_count,
			   fans,
		FROM user
		ORDER BY fans DESC
	result shows that some users have higher amount of fans and less amount of review counts than other users
+------------------------+-----------+--------------+------+---------------------+
| id                     | name      | review_count | fans | yelping_since       |
+------------------------+-----------+--------------+------+---------------------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |          609 |  503 | 2007-07-19 00:00:00 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 | 2011-03-30 00:00:00 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 | 2012-11-27 00:00:00
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: More reviews contains the word " Love " with 1780 

	SELECT count(text) as Love from review
	where text LIKE "%love%"
+------+
| Love |
+------+
| 1780 |
+---
	SELECT count(text) as hate from review
	where text LIKE "%hate%"

+------+
| hate |
+------+
|  232 |
+------+
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
		select id,name , fans as fans from user
		group by id
		order by fans desc
		limit 10

	
	
	Copy and Paste the Result Below:
	+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+---


Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
 
The Result shows  that only on Monday Food "Halo Brewery " is not shown , so the distribution would be equal , other days more 4-5 star food is present 


ii. Do the two groups you chose to analyze have a different number of reviews?
     
Yes shown in the query output , Loblaws (2-3)  has 10 , Halo Brewery(4-5) has 15 , Cabin Fever(4-5) has 26     
        
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
NO they have different postal code

SQL code used for analysis:

SELECT B.name,
			   B.review_count,
			   H.hours,
			   postal_code,
			   CASE
				  WHEN hours LIKE "%monday%" THEN 1
				  WHEN hours LIKE "%tuesday%" THEN 2
				  WHEN hours LIKE "%wednesday%" THEN 3
				  WHEN hours LIKE "%thursday%" THEN 4
				  WHEN hours LIKE "%friday%" THEN 5
				  WHEN hours LIKE "%saturday%" THEN 6
				  WHEN hours LIKE "%sunday%" THEN 7
			   END AS ord,
			   CASE
				  WHEN B.stars BETWEEN 2 AND 3 THEN '2-3 stars'
				  WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
			   END AS star_rating
		FROM business B INNER JOIN hours H
		ON B.id = H.business_id
		INNER JOIN category C
		ON C.business_id = B.id
		WHERE (B.city == 'Toronto'
		AND
		C.category LIKE 'Food')
		AND
		(B.stars BETWEEN 2 AND 3
		OR
		B.stars BETWEEN 4 AND 5)
		GROUP BY stars,ord
		ORDER BY ord,star_rating ASC

+--------------+--------------+-----------------------+-------------+-----+-------------+
| name         | review_count | hours                 | postal_code | ord | star_rating |
+--------------+--------------+-----------------------+-------------+-----+-------------+
| Loblaws      |           10 | Monday|8:00-22:00     | M6R 1X3     |   1 | 2-3 stars   |
| Cabin Fever  |           26 | Monday|16:00-2:00     | M6P 1A6     |   1 | 4-5 stars   |
| Loblaws      |           10 | Tuesday|8:00-22:00    | M6R 1X3     |   2 | 2-3 stars   |
| Halo Brewery |           15 | Tuesday|15:00-21:00   | M6H 1V5     |   2 | 4-5 stars   |
| Cabin Fever  |           26 | Tuesday|18:00-2:00    | M6P 1A6     |   2 | 4-5 stars   |
| Loblaws      |           10 | Wednesday|8:00-22:00  | M6R 1X3     |   3 | 2-3 stars   |
| Halo Brewery |           15 | Wednesday|15:00-21:00 | M6H 1V5     |   3 | 4-5 stars   |
| Cabin Fever  |           26 | Wednesday|18:00-2:00  | M6P 1A6     |   3 | 4-5 stars   |
| Loblaws      |           10 | Thursday|8:00-22:00   | M6R 1X3     |   4 | 2-3 stars   |
| Halo Brewery |           15 | Thursday|15:00-21:00  | M6H 1V5     |   4 | 4-5 stars   |
| Cabin Fever  |           26 | Thursday|18:00-2:00   | M6P 1A6     |   4 | 4-5 stars   |
| Loblaws      |           10 | Friday|8:00-22:00     | M6R 1X3     |   5 | 2-3 stars   |
| Halo Brewery |           15 | Friday|15:00-21:00    | M6H 1V5     |   5 | 4-5 stars   |
| Cabin Fever  |           26 | Friday|18:00-2:00     | M6P 1A6     |   5 | 4-5 stars   |
| Loblaws      |           10 | Saturday|8:00-22:00   | M6R 1X3     |   6 | 2-3 stars   |
| Halo Brewery |           15 | Saturday|11:00-21:00  | M6H 1V5     |   6 | 4-5 stars   |
| Cabin Fever  |           26 | Saturday|16:00-2:00   | M6P 1A6     |   6 | 4-5 stars   |
| Loblaws      |           10 | Sunday|8:00-22:00     | M6R 1X3     |   7 | 2-3 stars   |
| Halo Brewery |           15 | Sunday|11:00-21:00    | M6H 1V5     |   7 | 4-5 stars   |
| Cabin Fever  |           26 | Sunday|16:00-2:00     | M6P 1A6     |   7 | 4-5 stars   |
+--------		
		
		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:  More Reviews on Opened businessess than Closed Businesses
         
         
ii. Difference 2: More Data collected on Opened Businesses Than Closed Businesses 
         
         
         
SQL code used for analysis:

	SELECT COUNT(DISTINCT(id)) as ID,
			   AVG(review_count) as Average_Review_Count,
			   SUM(review_count) as Total_Review_Count,
			   AVG(stars) as Average_Stars,
			   is_open as Open_Closed
		FROM business
		GROUP BY is_open
+------+----------------------+--------------------+-------------------+-------------+
|   ID | Average_Review_Count | Total_Review_Count |     Average_Stars | Open_Closed |
+------+----------------------+--------------------+-------------------+-------------+
| 1520 |   23.198026315789473 |              35261 | 3.520394736842105 |           0 |
| 8480 |   31.757075471698112 |             269300 | 3.679009433962264 |           1 |
+------+----------------------+--------------------+-------------------+-------------+
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         Predicting whether a business will stay open or close 
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
  
To enhance the understanding of businesses about critical factors that contribute to their sustainability, we will focus on several key data points. These include the number of reviews, the business's star rating, operational hours, and the pivotal role of location—emphasized by the repeated mention of "location." We will also collect geographical coordinates, specifically latitude and longitude, along with city, state, postal code, and address details to simplify future processing. Additionally, categories and attributes will be recorded to help differentiate various business types. The is_open status will indicate whether businesses are currently operational or have ceased operations permanently, rather than just their daily opening hours.                         
                  
iii. Output of your finished dataset:
         +------------------------+--------------------------------+-----------------------------+---------------+-------+-------------+----------+-----------+--------------+-------+--------------+---------------+-----------------+----------------+--------------+----------------+--------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------+
| id                     | name                           | address                     | city          | state | postal_code | latitude | longitude | review_count | stars | monday_hours | tuesday_hours | wednesday_hours | thursday_hours | friday_hours | saturday_hours | sunday_hours | categories                                                                                                                                                                                                 | attributes                                                                                                                                                                                                                                                                                                                          | is_open |
+------------------------+--------------------------------+-----------------------------+---------------+-------+-------------+----------+-----------+--------------+-------+--------------+---------------+-----------------+----------------+--------------+----------------+--------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------+
| -0DET7VdEQOJVJ_v6klEug | Flaming Kitchen                | 3235 York Regional Road 7   | Markham       | ON    | L3R 3P9     |  43.8484 |  -79.3487 |           25 |   3.0 | 12:00-23:00  | 12:00-23:00   | 12:00-23:00     | 12:00-23:00    | 12:00-23:00  | 12:00-23:00    | 12:00-23:00  | Asian Fusion,Restaurants                                                                                                                                                                                   | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,RestaurantsPriceRange2,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,BusinessParking                                                           |       1 |
| -2HjuT4yjLZ3b5f_abD87Q | Freeman's Car Stereo           | 4821 South Blvd             | Charlotte     | NC    | 28217       |  35.1727 |  -80.8755 |            8 |   3.5 | 9:00-19:00   | 9:00-19:00    | 9:00-19:00      | 9:00-19:00     | 9:00-19:00   | 9:00-17:00     | None         | Electronics,Shopping,Automotive,Car Stereo Installation                                                                                                                                                    | BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessParking,WheelchairAccessible                                                                                                                                                                                                                                              |       1 |
| -CdstAUdEvci8GeJG8owpQ | Motors & More                  | 2315 Highland Dr            | Las Vegas     | NV    | 89102       |  36.1465 |  -115.167 |            7 |   5.0 | 7:00-17:00   | 7:00-17:00    | 7:00-17:00      | 7:00-17:00     | 7:00-17:00   | 8:00-12:00     | None         | Home Services,Solar Installation,Heating & Air Conditioning/HVAC                                                                                                                                           | BusinessAcceptsCreditCards,BusinessAcceptsBitcoin,ByAppointmentOnly                                                                                                                                                                                                                                                                 |       1 |
| -K4gAv8_vjx8-2BxkVeRkA | Baby Cakes                     | 4145 Erie St                | Willoughby    | OH    | 44094       |  41.6399 |  -81.4064 |            5 |   3.5 | None         | 11:00-17:00   | 11:00-17:00     | 11:00-20:00    | 11:00-17:00  | 10:00-17:00    | None         | Bakeries,Food                                                                                                                                                                                              | BusinessAcceptsCreditCards,RestaurantsTakeOut,WheelchairAccessible,RestaurantsDelivery                                                                                                                                                                                                                                              |       1 |
| -PtTGvWsckUL8tTutHr6Ew | Snip-its Rocky River           | 21609 Center Ridge Rd       | Rocky River   | OH    | 44116       |  41.4595 |  -81.8587 |           18 |   2.5 | 10:00-19:00  | 10:00-19:00   | 10:00-19:00     | 10:00-19:00    | 10:00-19:00  | 9:00-17:30     | 10:00-16:00  | Beauty & Spas,Hair Salons                                                                                                                                                                                  | BusinessAcceptsCreditCards,RestaurantsPriceRange2,GoodForKids,BusinessParking,ByAppointmentOnly                                                                                                                                                                                                                                     |       1 |
| -ayZoW_iNDsunYXX_0x1YQ | Standard Restaurant Supply     | 2922 E McDowell Rd          | Phoenix       | AZ    | 85008       |  33.4664 |  -112.018 |           15 |   3.5 | 8:00-18:00   | 8:00-18:00    | 8:00-18:00      | 8:00-18:00     | 8:00-18:00   | 9:00-17:00     | None         | Shopping,Wholesalers,Restaurant Supplies,Professional Services,Wholesale Stores                                                                                                                            | BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessParking,BikeParking,WheelchairAccessible                                                                                                                                                                                                                                  |       1 |
| -d9qyfNhLMQwVVg_raBKeg | What A Bagel                   | 973 Eglinton Avenue W       | York          | ON    | M6C 2C4     |  43.6999 |  -79.4295 |            8 |   3.0 | 6:00-15:30   | 6:00-15:30    | 6:00-15:30      | 6:00-15:30     | 6:00-15:30   | 6:00-15:30     | None         | Restaurants,Bagels,Breakfast & Brunch,Food                                                                                                                                                                 | NoiseLevel,RestaurantsAttire,RestaurantsTableService,OutdoorSeating                                                                                                                                                                                                                                                                 |       1 |
| -hjbcaxaU9yYXY2iI-49sw | Pinnacle Fencing Solutions     |                             | Phoenix       | AZ    | 85060       |  33.4805 |  -111.997 |           13 |   4.0 | 8:00-16:00   | 8:00-16:00    | 8:00-16:00      | 8:00-16:00     | 8:00-16:00   | None           | None         | Home Services,Contractors,Fences & Gates                                                                                                                                                                   | BusinessAcceptsCreditCards,ByAppointmentOnly                                                                                                                                                                                                                                                                                        |       1 |
| -iu4FxdfxN4rU4Fu9BjiFw | Alterations Express            | 17240 Royalton Rd           | Strongsville  | OH    | 44136       |  41.3141 |  -81.8207 |            3 |   4.0 | 8:00-19:00   | 8:00-19:00    | 8:00-19:00      | 8:00-19:00     | 8:00-19:00   | 8:00-18:00     | None         | Shopping,Bridal,Dry Cleaning & Laundry,Local Services,Sewing & Alterations                                                                                                                                 | BusinessParking,BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessAcceptsBitcoin,BikeParking,ByAppointmentOnly,WheelchairAccessible                                                                                                                                                                                         |       1 |
| -j4NsiRzSMrMk2N_bGH_SA | Extra Space Storage            | 2880 W Elliot Rd            | Chandler      | AZ    | 85224       |  33.3496 |  -111.892 |            5 |   4.0 | 8:00-17:30   | 8:00-17:30    | 8:00-17:30      | 8:00-17:30     | 8:00-17:30   | 8:00-17:30     | 10:00-14:00  | Home Services,Self Storage,Movers,Shopping,Local Services,Home Decor,Home & Garden                                                                                                                         | BusinessAcceptsCreditCards                                                                                                                                                                                                                                                                                                          |       1 |
| -uiBBVWI6tMDm2JFbZFrOw | Gussied Up                     | 1090 Bathurst St            | Toronto       | ON    | M5R 1W5     |  43.6727 |  -79.4142 |            6 |   4.5 | None         | 11:00-19:00   | 11:00-19:00     | 11:00-19:00    | 11:00-19:00  | 11:00-17:00    | 12:00-16:00  | Women's Clothing,Shopping,Fashion                                                                                                                                                                          | BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessParking,BikeParking                                                                                                                                                                                                                                                       |       1 |
| 0-aPEeNc2zVb5Gp-i7Ckqg | Buddy's Muffler & Exhaust      | 1509 Hickory Grove Rd       | Gastonia      | NC    | 28056       |  35.2772 |    -81.06 |            4 |   5.0 | 8:30-17:00   | 8:30-17:00    | 8:30-17:00      | 8:30-17:00     | 8:30-17:00   | 9:00-15:00     | None         | Automotive,Auto Repair                                                                                                                                                                                     | BusinessAcceptsCreditCards                                                                                                                                                                                                                                                                                                          |       1 |
| 01xXe2m_z048W5gcBFpoJA | Five Guys                      | 2641 N 44th St, Ste 100     | Phoenix       | AZ    | 85008       |   33.478 |  -111.986 |           63 |   3.5 | 10:00-22:00  | 10:00-22:00   | 10:00-22:00     | 10:00-22:00    | 10:00-22:00  | 10:00-22:00    | 10:00-22:00  | American (New),Burgers,Fast Food,Restaurants                                                                                                                                                               | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,DriveThru,BusinessParking                      |       1 |
| 06I2r8S3tHP_LwGnnkk6Uw | All Storage - Anthem           | 2620 W Horizon Ridge Pkwy   | Henderson     | NV    | 89052       |  36.0021 |  -115.102 |            3 |   3.5 | 9:00-16:30   | 9:00-16:30    | 9:00-16:30      | 9:00-16:30     | 9:00-16:30   | 9:00-16:30     | None         | Truck Rental,Local Services,Self Storage,Parking,Automotive                                                                                                                                                | BusinessAcceptsCreditCards,BusinessAcceptsBitcoin                                                                                                                                                                                                                                                                                   |       1 |
| 07h3mGtTovPJE660nX6E-A | Mood                           | 1 Greenside Place           | Edinburgh     | EDH   | EH1 3AA     |   55.957 |  -3.18502 |           11 |   2.0 | None         | None          | None            | 22:30-3:00     | 22:00-3:00   | 22:00-3:00     | 22:30-3:00   | Dance Clubs,Nightlife                                                                                                                                                                                      | Alcohol,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,AgesAllowed,Music,Smoking,RestaurantsGoodForGroups,WheelchairAccessible                                                                                                                                                                                    |       0 |
| 0AJF-USLN6K5T4caooDdjw | Starbucks                      | 4605 E Chandler Blvd, Ste A | Phoenix       | AZ    | 85048       |  33.3044 |  -111.984 |           52 |   3.0 | 5:00-20:00   | 5:00-20:00    | 5:00-20:00      | 5:00-20:30     | 5:00-20:00   | 5:00-20:00     | 5:00-20:00   | Coffee & Tea,Food                                                                                                                                                                                          | BusinessParking,Caters,WiFi,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,BikeParking,RestaurantsTakeOut                                                                                                                                                                                                         |       1 |
| 0B3W6KxkD3o4W4l6cq735w | Big Smoke Burger               | 260 Yonge Street            | Toronto       | ON    | M4B 2L9     |  43.6546 |  -79.3805 |           47 |   3.0 | 10:30-21:00  | 10:30-21:00   | 10:30-21:00     | 10:30-21:00    | 10:30-21:00  | 10:30-21:00    | 11:00-19:00  | Poutineries,Burgers,Restaurants                                                                                                                                                                            | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,WheelchairAccessible,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,DriveThru,BusinessParking |       1 |
| 0IySwcfqwJjpHPsYwjpAkg | Subway                         | 2904 Yorkmont Rd            | Charlotte     | NC    | 28208       |  35.1903 |  -80.9288 |            7 |   3.5 | 6:00-22:00   | 6:00-22:00    | 6:00-22:00      | 6:00-22:00     | 6:00-22:00   | 10:00-21:00    | None         | Fast Food,Restaurants,Sandwiches                                                                                                                                                                           | Ambience,RestaurantsPriceRange2,GoodForKids                                                                                                                                                                                                                                                                                         |       1 |
| 0K2rKvqdBmiOAUTebcUohQ | Red Rock Canyon Visitor Center | 1000 Scenic Loop Dr         | Las Vegas     | NV    | 89161       |  36.1357 |  -115.428 |           32 |   4.5 | 8:00-16:30   | 8:00-16:30    | 8:00-16:30      | 8:00-16:30     | 8:00-16:30   | 8:00-16:30     | 8:00-16:30   | Education,Visitor Centers,Professional Services,Special Education,Local Services,Community Service/Non-Profit,Hotels & Travel,Travel Services,Gift Shops,Shopping,Parks,Hiking,Flowers & Gifts,Active Life | BusinessAcceptsCreditCards,GoodForKids                                                                                                                                                                                                                                                                                              |       1 |
| 0Ni7Stqt4RFWDGjOYRi2Bw | Scent From Above Company       | 2501 W Behrend Dr, Ste 67   | Scottsdale    | AZ    | 85027       |  33.6656 |  -112.111 |           14 |   4.5 | 6:00-16:00   | 6:00-16:00    | 6:00-16:00      | 6:00-16:00     | 6:00-16:00   | None           | None         | Home Cleaning,Local Services,Professional Services,Carpet Cleaning,Home Services,Office Cleaning,Window Washing                                                                                            | BusinessAcceptsCreditCards,ByAppointmentOnly                                                                                                                                                                                                                                                                                        |       1 |
| 0WBMEfqXQnEOAIkV-uCW6w | The Charlotte Room             | 19 Charlotte Street         | Toronto       | ON    | M5V 2H5     |  43.6466 |  -79.3938 |           10 |   3.5 | 15:00-1:00   | 15:00-1:00    | 15:00-1:00      | 15:00-1:00     | 15:00-2:00   | 18:00-2:00     | None         | Event Planning & Services,Bars,Nightlife,Lounges,Pool Halls,Venues & Event Spaces                                                                                                                          | BusinessParking,HasTV,CoatCheck,NoiseLevel,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,Music,WheelchairAccessible,Smoking,Ambience,BestNights,RestaurantsGoodForGroups,HappyHour,GoodForDancing,Alcohol                                                                                                        |       0 |
| 0Y3lHyqRHfWOBuQlS1bM0g | PC Savants                     | 11966 W Candelaria Ct       | Sun City      | AZ    | 85373       |  33.6901 |  -112.319 |           11 |   5.0 | 10:00-19:00  | 10:00-19:00   | 10:00-19:00     | 10:00-19:00    | 10:00-19:00  | 11:00-18:00    | 11:00-18:00  | IT Services & Computer Repair,Electronics Repair,Local Services,Mobile Phone Repair                                                                                                                        | BusinessAcceptsCreditCards,BusinessAcceptsBitcoin                                                                                                                                                                                                                                                                                   |       1 |
| 0aKsGxx7XP2TMs_fn_9xVw | Sweet Ruby Jane Confections    | 8975 S Eastern Ave, Ste 3-B | Las Vegas     | NV    | 89123       |   36.015 |  -115.118 |           30 |   4.0 | 10:00-19:00  | 10:00-19:00   | 10:00-19:00     | 10:00-19:00    | 10:00-19:00  | 10:00-19:00    | None         | Food,Chocolatiers & Shops,Bakeries,Specialty Food,Desserts                                                                                                                                                 | BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessParking,WheelchairAccessible                                                                                                                                                                                                                                              |       0 |
| 0cxO1Lx2Pi7u6ftWX3Wksg | Oinky's Pork Chop Heaven       | 22483 Emery Rd              | North Randall | OH    | 44128       |  41.4352 |  -81.5214 |            3 |   3.0 | 6:00-23:00   | 6:00-23:00    | 6:00-23:00      | 6:00-23:00     | 6:00-23:00   | 6:00-23:00     | 6:00-23:00   | Soul Food,Restaurants                                                                                                                                                                                      | RestaurantsAttire,RestaurantsGoodForGroups,GoodForKids,RestaurantsReservations,RestaurantsTakeOut                                                                                                                                                                                                                                   |       1 |
| 0e-j5VcEn54EZT-FKCUZdw | Sushi Osaka                    | 5084 Dundas Street W        | Toronto       | ON    | M9A 1C2     |  43.6452 |  -79.5324 |            8 |   4.5 | 11:00-23:00  | 11:00-23:00   | 11:00-23:00     | 11:00-23:00    | 11:00-23:00  | 11:00-23:00    | 14:00-23:00  | Sushi Bars,Restaurants,Japanese,Korean                                                                                                                                                                     | RestaurantsTakeOut,WiFi,RestaurantsGoodForGroups,RestaurantsReservations                                                                                                                                                                                                                                                            |       1 |
+------------------------+--------------------------------+-----------------------------+---------------+-------+-------------+----------+-----------+--------------+-------+--------------+---------------+-----------------+----------------+--------------+----------------+--------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------+
(Output limit exceeded, 25 of 70 total rows shown)
         
iv. Provide the SQL code you used to create your final dataset:
SELECT 
    B.id,
    B.name,
    B.address,
    B.city,
    B.state,
    B.postal_code,
    B.latitude,
    B.longitude,
    B.review_count,
    B.stars,
    MAX(CASE WHEN H.hours LIKE "%monday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') END) AS monday_hours,
    MAX(CASE WHEN H.hours LIKE "%tuesday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') END) AS tuesday_hours,
    MAX(CASE WHEN H.hours LIKE "%wednesday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') END) AS wednesday_hours,
    MAX(CASE WHEN H.hours LIKE "%thursday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') END) AS thursday_hours,
    MAX(CASE WHEN H.hours LIKE "%friday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') END) AS friday_hours,
    MAX(CASE WHEN H.hours LIKE "%saturday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') END) AS saturday_hours,
    MAX(CASE WHEN H.hours LIKE "%sunday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') END) AS sunday_hours,
    GROUP_CONCAT(DISTINCT C.category) AS categories,
    GROUP_CONCAT(DISTINCT A.name) AS attributes,
    B.is_open
FROM business B
JOIN hours H ON B.id = H.business_id
JOIN category C ON B.id = C.business_id
JOIN attribute A ON B.id = A.business_id
GROUP BY B.id;


