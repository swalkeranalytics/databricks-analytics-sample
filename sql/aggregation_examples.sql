SELECT
  date(tpep_pickup_datetime) AS trip_date,
  COUNT(*) AS total_trips,
  ROUND(SUM(fare_amount), 2) AS total_fare
FROM
  samples.nyctaxi.trips
WHERE
  fare_amount > 0
GROUP BY
  date(tpep_pickup_datetime)
ORDER BY
  trip_date


SELECT
  date_format(tpep_pickup_datetime, 'E') AS day_of_week,
  COUNT(*) AS total_trips,
  ROUND(SUM(fare_amount), 2) AS total_fare
FROM
  samples.nyctaxi.trips
WHERE
  fare_amount > 0
GROUP BY
  date_format(tpep_pickup_datetime, 'E')
ORDER BY
  CASE date_format(tpep_pickup_datetime, 'E')
    WHEN 'Sun' THEN 1
    WHEN 'Mon' THEN 2
    WHEN 'Tue' THEN 3
    WHEN 'Wed' THEN 4
    WHEN 'Thu' THEN 5
    WHEN 'Fri' THEN 6
    WHEN 'Sat' THEN 7
  END
