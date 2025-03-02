/* Create a table named "nyc_yellow_taxi_trips_2016_06_01" for storing the data of New York City
taxi trips. */

CREATE TABLE nyc_yellow_taxi_trips_2016_06_01 (
	trip_id bigserial PRIMARY KEY,
	vendor_id varchar(1) NOT NULL,
	tpep_pickup_datetime timestamp with time zone NOT NULL,
	tpep_dropoff_datetime timestamp with time zone NOT NULL,
	passenger_count integer NOT NULL,
	trip_distance numeric(8,2) NOT NULL,
	pickup_longitude numeric(18,15) NOT NULL,
	pickup_latitude numeric(18,15) NOT NULL,
	rate_code_id varchar(2) NOT NULL,
	store_and_fwd_flag varchar(1) NOT NULL,
	dropoff_longitude numeric(18,15) NOT NULL,
	dropoff_latitude numeric(18,15) NOT NULL,
	payment_type varchar(1) NOT NULL,
	fare_amount numeric(9,2) NOT NULL,
	extra numeric(9,2) NOT NULL,
	mta_tax numeric(5,2) NOT NULL,
	tip_amount numeric(9,2) NOT NULL,
	tolls_amount numeric(9,2) NOT NULL,
	improvement_surcharge numeric(9,2) NOT NULL,
	total_amount numeric(9,2) NOT NULL
);


-- Import the data to the table
COPY nyc_yellow_taxi_trips_2016_06_01 (
	vendor_id,
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	passenger_count,
	trip_distance,
	pickup_longitude,
	pickup_latitude,
	rate_code_id,
	store_and_fwd_flag,
	dropoff_longitude,
	dropoff_latitude,
	payment_type,
	fare_amount,
	extra,
	mta_tax,
	tip_amount,
	tolls_amount,
	improvement_surcharge,
	total_amount
)
FROM 'C:\Users\ecord\Documents\SQL_Beginners\sql_exercises\data\yellow_tripdata_2016_06_01.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');


-- Create a new column "trip_time_sec" that calculates the time of the trip in seconds.

ALTER TABLE nyc_yellow_taxi_trips_2016_06_01 ADD COLUMN trip_time_sec double precision;


-- Fill the column trip_time_sec with the interval time between pick up and drop off.

UPDATE nyc_yellow_taxi_trips_2016_06_01
SET trip_time_sec = date_part('epoch',(tpep_dropoff_datetime - tpep_pickup_datetime));


