--Exercise 1: 
--Goal: Write a query to format the view_item event into a table with the appropriate columns for item_id

SELECT
  event_id,
  event_time,
  user_id,
  platform,
  (
    CASE
      WHEN parameter_name = 'item_id' THEN CAST(parameter_value AS INT)
      ELSE NULL
    END
  ) AS item_id
FROM
  dsv1069.events
WHERE
  event_name = 'view_item'
ORDER BY
  event_id


--Exercise 2: 
--Goal: Write a query to format the view_item event into a table with the appropriate columns for item and referrer
SELECT
  event_id,
  event_time,
  user_id,
  platform,
  (
    CASE
      WHEN parameter_name = 'item_id' THEN CAST(parameter_value AS INT)
      ELSE NULL
    END
  ) AS item_id, (
    CASE
      WHEN parameter_name = 'referrer' THEN parameter_value
      ELSE NULL
    END
  ) AS referrer
FROM
  dsv1069.events
WHERE
  event_name = 'view_item'
ORDER BY
  event_id