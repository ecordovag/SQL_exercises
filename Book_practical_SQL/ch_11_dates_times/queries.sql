/* 
Ex 11-3: As a bonus challenge, use the statistics functions in Chapter 10 to calculate the 
correlation coefficient and r-squared values using trip time and the total_amount column in the 
New York City taxi data, which represents the total amount charged to passengers. Do the same with 
the trip_distance and total_amount columns. Limit the query to rides that last three hours or less. 
*/

/* Table filtered by trips that lasted more or equal than 1 second and less than 3600 seconds 
(three hours). */

SELECT trip_time_sec,
	trip_distance,
	total_amount
FROM nyc_yellow_taxi_trips_2016_06_01
WHERE trip_time_sec > 0
	AND trip_time_sec < 3600
ORDER BY trip_time_sec;


/* Calculate the correlation coefficient and the r-squared value between trip_time_sec 
(trip time in seconds) and total amount.*/

SELECT round(CORR(total_amount, trip_time_sec)::numeric,2) AS corr_amount_time,
	round(regr_r2(total_amount, trip_time_sec)::numeric,2) AS r_sq_amount_time
FROM nyc_yellow_taxi_trips_2016_06_01;


/*Calculate the correlation coefficient and the r-squared value between trip_distance 
and total amount.*/

SELECT round(CORR(total_amount, trip_distance)::numeric,2) AS corr_amount_distance,
	round(regr_r2(total_amount, trip_distance)::numeric,2) AS r_sq_amount_distance
FROM nyc_yellow_taxi_trips_2016_06_01;
