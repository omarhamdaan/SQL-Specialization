-- Exercise 1: 
--Goal: Here we use users ​ table to pull a list of user email addresses. Edit the query to pull email 
--addresses, but only for non-deleted users.

SELECT
  email_address
FROM
  dsv1069.users
WHERE
  deleted_at ISNULL

	count
1	47402


--Exercise 2: 
--Goal: Use the items​ table to count the number of items for sale in each category 

SELECT
  category,
  count(id) AS item_count
FROM
  dsv1069.items
GROUP BY
  category
ORDER BY
  item_count DESC

instrument	239
gadget		233
module		227
mechanism	225
tool		222
device		216
widget		212
dongle		211
apparatus	207
contraption	206


--Exercise 3: 
--Goal: Select all of the columns from the result when you JOIN the users​ table to the orders 
table

SELECT
  *
FROM
  dsv1069.orders
  JOIN dsv1069.users ON orders.user_id = users.id

--Exercise 4: 
--Goal: Check out the query below. This is not the right way to count the number of viewed_item 
events. Determine what is wrong and correct the error.  


SELECT
  COUNT(DISTINCT event_id) AS EVENTS
FROM
  dsv1069.events
WHERE
  event_name = 'view_item'

	events
1	262786



--Exercise 5:
 --Goal:Compute the number of items in the items table which have been ordered. The query 
below runs, but it isn’t right. Determine what is wrong and correct the error or start from scratch.

SELECT
  count(DISTINCT orders.item_id) AS item_count
FROM
  dsv1069.orders
  JOIN dsv1069.items ON items.id = orders.item_id

	item_count
1 	2198

--Exercise 6: 
--Goal: For each user figure out IF a user has ordered something, and when their first purchase 
was. The query below doesn’t return info for any of the users who haven’t ordered anything. 

SELECT 
  users.id AS user_id , 
  MIN(orders.paid_at) AS min_paid_at
FROM 
  dsv1069.users 
  LEFT OUTER JOIN
  dsv1069.orders
  ON
  orders.user_id = users.id 
  GROUP BY 
  users.id
 
user_id		min_paid_at
4	
8	
9	
10	
12	
13	
17		2013-05-25 08:27:17
21	
23	
24	
25		2013-05-17 03:11:48
26	
27	
30	
31	
34	
35	
41	
43	
45	
46	
47	
50	
51	
52	
54	
55	
57	
62	
63		2013-07-07 11:26:45
65		2013-05-09 10:22:58
66	
69		2013-08-09 23:25:51
75	
76	
86	


--Exercise 7: 
--Goal: Figure out what percent of users have ever viewed the user profile page, but this query 
isn’t right. Check to make sure the number of users adds up, and if not, fix the query.  

SELECT
(CASE WHEN first_view IS NULL THEN false 
    ELSE true END ) AS has_viewed_profile_page, 
COUNT (user_id) as users 
FROM 
  (SELECT 
    users.id AS user_id ,
    MIN(event_time) as first_view
    FROM 
      dsv1069.users
      LEFT OUTER JOIN 
      dsv1069.events 
      ON 
        events.user_id = users.id 
      AND 
        event_name ='view_user_profile'
        GROUP BY 
        users.id 
        ) first_profile_views
        GROUP BY 
        (CASE WHEN first_view IS NULL THEN false 
          ELSE true END)


has_viewed_profile	users
false			114143	
true			3035
