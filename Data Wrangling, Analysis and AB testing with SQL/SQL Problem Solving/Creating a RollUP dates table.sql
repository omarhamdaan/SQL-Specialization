--Exercise 1: 
--Create a subtable of orders per day. Make sure you decide whether you are counting invoices or line items. 

SELECT 
date(paid_at) as day ,  
COUNT(DISTINCT invoice_id) AS orders , 
COUNT(DISTINCT line_item_id) AS items_ordered 

from 
dsv1069.orders
GROUP BY 
date(paid_at)

-- Exercise 2: “Check your joins”. We are still trying to count orders per day. In this step join the 
-- sub table from the previous exercise to the dates rollup table so we can get a row for every 
-- date. Check that the join works by just running a “select *” query

SELECT
  *
FROM
  dsv1069.dates_rollup
  LEFT OUTER JOIN (
    SELECT
      date(paid_at) AS DAY,
      COUNT(DISTINCT invoice_id) AS orders,
      COUNT(DISTINCT line_item_id) AS items_ordered
    FROM
      dsv1069.orders
    GROUP BY
      date(paid_at)
  ) daily_orders
  ON 
  daily_orders.day = dates_rollup.date


date			d7_ago			d28_ago			day		orders		items_ordered				
2013-01-01 00:00:00	2012-12-25 00:00:00	2012-12-04 00:00:00			
2013-01-02 00:00:00	2012-12-26 00:00:00	2012-12-05 00:00:00			
2013-01-03 00:00:00	2012-12-27 00:00:00	2012-12-06 00:00:00			
2013-01-04 00:00:00	2012-12-28 00:00:00	2012-12-07 00:00:00			
2013-01-05 00:00:00	2012-12-29 00:00:00	2012-12-08 00:00:00			
2013-01-06 00:00:00	2012-12-30 00:00:00	2012-12-09 00:00:00			
2013-01-07 00:00:00	2012-12-31 00:00:00	2012-12-10 00:00:00	

		
-- Exercise 3: “Clean up your Columns” 
-- In this step be sure to specify the columns you actually 
-- want to return, and if necessary do any aggregation needed to get a count of the orders made 
-- per day.

SELECT
  dates_rollup.date,
  COALESCE(SUM(orders), 0) AS orders,
  COALESCE(SUM(items_ordered), 0) AS items_ordered
FROM
  dsv1069.dates_rollup
  LEFT OUTER JOIN (
    SELECT
      DATE(paid_at) AS DAY,
      COUNT(DISTINCT invoice_id) AS orders,
      COUNT(DISTINCT line_item_id) AS items_ordered
    FROM
      dsv1069.orders
    GROUP BY
      DAY
  ) daily_orders ON daily_orders.day = dates_rollup.date
GROUP BY
  dates_rollup.date

	date		    orders		items_ordered
2013-01-01 00:00:00		0		0
2013-01-02 00:00:00		0		0
2013-01-03 00:00:00		0		0
2013-01-04 00:00:00		0		0
2013-01-05 00:00:00		0		0
2013-01-06 00:00:00		0		0
2013-01-07 00:00:00		0		0
2013-01-08 00:00:00		0		0
2013-01-09 00:00:00		0		0
2013-01-10 00:00:00		0		0
2013-01-11 00:00:00		0		0
-- Exercise 4: Weekly Rollup. 
-- Figure out which parts of the JOIN condition need to be edited 
-- create 7 day rolling orders table. 

SELECT
  *
FROM
  dsv1069.dates_rollup
  LEFT OUTER JOIN (
    SELECT
      date(paid_at) AS DAY,
      COUNT(DISTINCT invoice_id) AS orders,
      COUNT(DISTINCT line_item_id) AS items_ordered
    FROM
      dsv1069.orders
    GROUP BY
      date(paid_at)
  ) daily_orders
  ON 
  dates_rollup.date >= daily_orders.day
  AND 
    dates_rollup.d7_ago <   daily_orders.day
date			d7_ago			d28_ago			day		orders		items_ordered	
2018-06-01 00:00:00	2018-05-25 00:00:00	2018-05-04 00:00:00	2018-05-26 00:00:00	15	38
2018-06-01 00:00:00	2018-05-25 00:00:00	2018-05-04 00:00:00	2018-05-27 00:00:00	23	51
2018-06-01 00:00:00	2018-05-25 00:00:00	2018-05-04 00:00:00	2018-05-28 00:00:00	17	47
2018-06-01 00:00:00	2018-05-25 00:00:00	2018-05-04 00:00:00	2018-05-29 00:00:00	17	40
2018-06-01 00:00:00	2018-05-25 00:00:00	2018-05-04 00:00:00	2018-05-30 00:00:00	10	25
2018-06-01 00:00:00	2018-05-25 00:00:00	2018-05-04 00:00:00	2018-05-31 00:00:00	14	32
2018-06-01 00:00:00	2018-05-25 00:00:00	2018-05-04 00:00:00	2018-06-01 00:00:00	8	17
2018-05-31 00:00:00	2018-05-24 00:00:00	2018-05-03 00:00:00	2018-05-25 00:00:00	18	38
2018-05-31 00:00:00	2018-05-24 00:00:00	2018-05-03 00:00:00	2018-05-26 00:00:00	15	38

-- Exercise 5: Column Cleanup. 
-- Finish creating the weekly rolling orders table, by performing 
-- any aggregation steps and naming your columns appropriately. 

SELECT
  dates_rollup.date,
  COALESCE(SUM(orders), 0) AS orders,
  COALESCE(SUM(items_ordered), 0) AS items_ordered

FROM
  dsv1069.dates_rollup
  LEFT OUTER JOIN (
    SELECT
      date(paid_at) AS DAY,
      COUNT(DISTINCT invoice_id) AS orders,
      COUNT(DISTINCT line_item_id) AS items_ordered
    FROM
      dsv1069.orders
    GROUP BY
      date(paid_at)
  ) daily_orders
  ON 
  dates_rollup.date >= daily_orders.day
  AND 
    dates_rollup.d7_ago <   daily_orders.day
  GROUP BY 
  dates_rollup.date


	date		    	orders		items_ordered
2014-11-01 00:00:00		57			138
2017-06-27 00:00:00		100			267
2018-02-07 00:00:00		112			275
2017-12-29 00:00:00		106			271
2017-07-14 00:00:00		96			232
2015-03-20 00:00:00		63			147
2015-09-08 00:00:00		64			163
2015-12-24 00:00:00		99			270
2013-10-15 00:00:00		24			61
2015-10-14 00:00:00		87			211
2013-03-14 00:00:00		1			2
2017-02-01 00:00:00		87			212
2018-03-24 00:00:00		102			259