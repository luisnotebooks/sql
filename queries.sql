# First we need to query this data set to get some aggregations and formatting the way we need them.

SELECT
  CAST(starttime AS date) AS date,
  COUNT(*) AS num_trips,
  round(SUM(tripduration/60),2) AS total_duration_minutes,
  COUNT(DISTINCT bikeid) AS num_bikes
FROM
  `bigquery-public-data.new_york.citibike_trips`
GROUP BY
  date
ORDER BY
  date ASC


# let's get a table with date, start_station_name, total num_trips, unique num_bikes and trip durations while grouping the information by individual bike station

SELECT
  CAST(starttime AS date) AS date,
  start_station_name,
  COUNT(*) AS num_trips,
  COUNT(DISTINCT bikeid) AS num_bikes,
  ROUND(SUM(tripduration/60),2) AS total_trip_duration_minutes
FROM
  `bigquery-public-data.new_york.citibike_trips`
GROUP BY
  date,
  start_station_name


# Let's get another table with date, usertype, gender, num_trips in total, tripduration while grouping it by date usertype and gender.

SELECT
  CAST(starttime AS date) AS date,
  usertype,
  gender,
  COUNT(*) AS num_trips,
  ROUND(SUM(tripduration/60),2) AS total_duration_minutes
FROM
  `bigquery-public-data.new_york.citibike_trips`
WHERE
  gender != 'unknown'
GROUP BY
  date,
  usertype,
  gender

# Lastly let's get a table with bikeid, date, num_trips, tripduration while grouping by date and bikeid.

SELECT
  bikeid,
  CAST(starttime AS date) AS date,
  COUNT(*) AS num_trips,
  round(SUM(tripduration/60),2) AS total_duration_minutes
FROM
  `bigquery-public-data.new_york.citibike_trips`
GROUP BY
  date,
  bikeid
