 SELECT *
 FROM survey
 LIMIT 10;

 SELECT question,
    COUNT(DISTINCT user_id) AS 'num_users' 
 FROM survey
 GROUP BY question;

 SELECT *
 FROM quiz
 LIMIT 5;

 SELECT style, COUNT(style) AS 'num_users'
 FROM quiz
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 1;

 SELECT fit, COUNT(fit) AS 'num_users'
 FROM quiz
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 1;

 SELECT shape, COUNT(shape) AS 'num_users'
 FROM quiz
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 1;

 SELECT color, COUNT(color) AS 'num_users'
 FROM quiz
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 1;

 SELECT *
 FROM home_try_on
 LIMIT 5;

 SELECT *
 FROM purchase
 LIMIT 5;

 SELECT style, COUNT(style) AS 'num_purchases'
 FROM purchase
 GROUP BY 1
 ORDER By 2
 LIMIT 1;

 SELECT model_name, COUNT(model_name) AS 'num_purchases'
 FROM purchase
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 1;

 SELECT color, COUNT(color) AS 'num_purchases'
 FROM purchase
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 1;

 WITH funnel_table AS (
 SELECT q.*,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS q
 LEFT JOIN home_try_on AS h
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS p
   ON p.user_id = q.user_id
 )
 SELECT COUNT(user_id) AS 'num_users',
   SUM(is_home_try_on) AS 'num_home_try_on',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_home_try_on) / COUNT(user_id) AS 'prop_home_try_on',
   1.0 * SUM(is_purchase) / SUM(is_home_try_on) AS 'prop_purchase'
 FROM funnel_table;

 WITH funnel_table AS (
 SELECT q.*,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS q
 LEFT JOIN home_try_on AS h
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS p
   ON p.user_id = q.user_id
 )
 SELECT number_of_pairs,
   COUNT(user_id) AS 'num_users',
   SUM(is_home_try_on) AS 'num_home_try_on',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_home_try_on) / 1000 AS 'prop_home_try_on',
   1.0 * SUM(is_purchase) / SUM(is_home_try_on) AS 'prop_purchase'
 FROM funnel_table
 GROUP BY 1;

 WITH funnel_table AS (
 SELECT q.*,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS q
 LEFT JOIN home_try_on AS h
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS p
   ON p.user_id = q.user_id
 )
 SELECT shape,
   COUNT(user_id) AS 'num_users',
   SUM(is_home_try_on) AS 'num_home_try_on',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_home_try_on) / COUNT(user_id) AS 'prop_home_try_on',
   1.0 * SUM(is_purchase) / SUM(is_home_try_on) AS 'prop_purchase'
 FROM funnel_table
 GROUP BY 1;

 WITH funnel_table AS (
 SELECT q.*,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS q
 LEFT JOIN home_try_on AS h
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS p
   ON p.user_id = q.user_id
 )
 SELECT style,
    COUNT(user_id) as 'num_users',
    SUM(is_home_try_on) AS 'num_home_try_on',
    SUM(is_purchase) AS 'num_purchase',
    1.0 * SUM(is_home_try_on) / COUNT(user_id) AS 'prop_home_try_on',
    1.0 * SUM(is_purchase) / SUM(is_home_try_on) AS 'prop_purchase'
 FROM funnel_table
 GROUP BY 1;