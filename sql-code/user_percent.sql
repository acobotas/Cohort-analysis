WITH 
cohort_data AS (
    SELECT
      user_pseudo_id,
      DATE_TRUNC(subscription_start, WEEK(MONDAY)) AS cohort_week,
      subscription_start,
      COALESCE(subscription_end, '2021-02-07') AS subscription_end
    FROM
       `subscriptions`
  WHERE 
    subscription_start >= '2020-11-02'
)
,
retained AS (  
SELECT
    cohort_week,
    SUM(CASE WHEN DATE_DIFF(subscription_end, cohort_week, WEEK) >=0 THEN 1 ELSE 0 END) AS week_0,
    SUM(CASE WHEN DATE_DIFF(subscription_end, cohort_week, WEEK) >=1 THEN 1 ELSE 0 END) AS week_1,
    SUM(CASE WHEN DATE_DIFF(subscription_end, cohort_week, WEEK) >=2 THEN 1 ELSE 0 END) AS week_2,
    SUM(CASE WHEN DATE_DIFF(subscription_end, cohort_week, WEEK) >=3 THEN 1 ELSE 0 END) AS week_3,
    SUM(CASE WHEN DATE_DIFF(subscription_end, cohort_week, WEEK) >=4 THEN 1 ELSE 0 END) AS week_4,
    SUM(CASE WHEN DATE_DIFF(subscription_end, cohort_week, WEEK) >=5 THEN 1 ELSE 0 END) AS week_5,
    SUM(CASE WHEN DATE_DIFF(subscription_end, cohort_week, WEEK) >=6 THEN 1 ELSE 0 END) AS week_6
FROM
    cohort_data
GROUP BY
    cohort_week
ORDER BY
    cohort_week
)

SELECT
  cohort_week,
  IF(week_0 = 0, NULL, CONCAT(ROUND(100 * week_1 / week_1, 1), '%')) AS week_0,
  IF(week_1 = 0, NULL, CONCAT(ROUND(100 * week_1 / week_0, 1), '%')) AS week_1,
  IF(week_2 = 0, NULL, CONCAT(ROUND(100 * week_2 / week_0, 1), '%')) AS week_2,
  IF(week_3 = 0, NULL, CONCAT(ROUND(100 * week_3 / week_0, 1), '%')) AS week_3,
  IF(week_4 = 0, NULL, CONCAT(ROUND(100 * week_4 / week_0, 1), '%')) AS week_4,
  IF(week_5 = 0, NULL, CONCAT(ROUND(100 * week_5 / week_0, 1), '%')) AS week_5,
  IF(week_6 = 0, NULL, CONCAT(ROUND(100 * week_6 / week_0, 1), '%')) AS week_6
FROM retained    