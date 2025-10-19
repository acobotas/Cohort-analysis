WITH 
cohort_data AS (
    SELECT
      user_pseudo_id,
      DATE_TRUNC(subscription_start, WEEK(MONDAY)) AS cohort_week,
      subscription_start,
      COALESCE(subscription_end, '2021-02-07') AS subscription_end
    FROM
       `turing_data_analytics.subscriptions`
  WHERE 
    subscription_start >= '2020-11-02' /*removes a 'week' that starts on 2020-10-26 and has only 1 day - 2020-11-01*/
--AND
--   subscription_start <= '2021-01-31' /*nieko nedaro, not sure kodel idedam*/
)

SELECT
    cohort_week,
    COUNT(user_pseudo_id) AS week_0_subs,
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