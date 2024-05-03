-- Task : Create a subtable that has the invoice_id for each user's FIRST order

SELECT
  *
FROM
  (
    SELECT
      user_id,
      invoice_id,
      paid_at,
      RANK() OVER (
        PARTITION BY user_id
        ORDER BY
          paid_at ASC
      ) AS order_num
    FROM
      dsv1069.orders
  ) sub
WHERE
  order_num = 1


--Exercise 1: 
--Create the right subtable for recently viewed events using the view_item_events table.

SELECT user_id,
       item_id,
       event_time,
       ROW_NUMBER ( ) OVER (PARTITION BY user_id ORDER BY event_time DESC) AS view_number
FROM dsv1069.view_item_events

--Exercise 2: Check your joins. 
--Join your tables together recent_views, users, items

SELECT
  *
FROM
  (
    SELECT
      user_id,
      item_id,
      event_time,
      ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY
          event_time DESC
      ) AS view_number
    FROM
      dsv1069.view_item_events
  ) AS recent_views
  JOIN dsv1069.users ON users.id = recent_views.user_id
  JOIN dsv1069.items ON items.id = recent_views.item_id




-- Exercise 3: Clean up your columns. 
-- The goal of all this is to return all of the information we’ll 
-- need to send users an email about the item they viewed more recently. Clean up this query 
-- outline from the outline in EX2 and pull only the columns you need. Make sure they are named 
-- appropriately so that another human can read and understand their contents. 

SELECT
  users.id AS user_id,
  users.email_address,
  items.id AS item_id,
  items.name AS item_name,
  items.category AS item_category
FROM
  (
    SELECT
      user_id,
      item_id,
      event_time,
      ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY
          event_time DESC
      ) AS view_number
    FROM
      dsv1069.view_item_events
  ) AS recent_views
  JOIN dsv1069.users ON users.id = recent_views.user_id
  JOIN dsv1069.items ON items.id = recent_views.item_id




--Exercise 4: Consider any edge cases. 
--If we sent an email to everyone in the results of this 
--query, what would we want to filter out. Add in any extra filtering that you think would make this 
--email better. For example should we include deleted users? Should we send this email to users 
--who already ordered the item they viewed most recently? 

--MODIFICATIONS ADDED

--1) If a user deleted or merged fix the issue ( adding coalesce in the select statement ) 

--2) Do not send an email to a user who is deleted ( adding useres.deleted_at is not null ) 

--3) No need to send notification if they viewed the item 10 years ago ( adding where statement event_time > x amount of time )

--4) No need to send an email notification to buy something already has been bought ( adding a left outer join LEFT OUTER JOIN dsv1069.orders ON   orders.item_id = recent_views.item_id AND orders.user_id = recent_views.user_id) 

SELECT
  COALESCE(users.parent_user_id, users.id) AS user_id,
  users.email_address,
  items.id AS item_id,
  items.name AS item_name,
  items.category AS item_category
FROM
  (
    SELECT
      user_id,
      item_id,
      event_time,
      ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY
          event_time DESC
      ) AS view_number
    FROM
      dsv1069.view_item_events
    WHERE
      event_time > '2017-01-01'
  ) AS recent_views
  JOIN dsv1069.users ON users.id = recent_views.user_id
  LEFT OUTER JOIN dsv1069.orders ON orders.item_id = recent_views.item_id
  AND orders.user_id = recent_views.user_id
WHERE
  view_number = 1
  AND users.deleted_at IS NOT NULL
  AND orders.item_id IS NULL





