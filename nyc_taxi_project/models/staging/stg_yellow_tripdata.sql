{{ config(materialized='table') }}

select
    variant_col:"VendorID"::int as vendor_id,
    variant_col:"passenger_count"::int as passenger_count,
    variant_col:"trip_distance"::float as trip_distance,
    variant_col:"RatecodeID"::int as rate_code_id,
    variant_col:"store_and_fwd_flag"::string as store_and_fwd_flag,
    variant_col:"PULocationID"::int as pickup_location_id,
    variant_col:"DOLocationID"::int as dropoff_location_id,
    variant_col:"payment_type"::int as payment_type,
    variant_col:"fare_amount"::float as fare_amount,
    variant_col:"extra"::float as extra,
    variant_col:"mta_tax"::float as mta_tax,
    variant_col:"tip_amount"::float as tip_amount,
    variant_col:"tolls_amount"::float as tolls_amount,
    variant_col:"improvement_surcharge"::float as improvement_surcharge,
    variant_col:"total_amount"::float as total_amount,
    variant_col:"congestion_surcharge"::float as congestion_surcharge,
    variant_col:"cbd_congestion_fee"::float as cbd_congestion_fee,
    variant_col:"Airport_fee"::float as airport_fee,

    -- Convert timestamps from microseconds since epoch
    to_timestamp_ltz(variant_col:"tpep_pickup_datetime"::number / 1e6) as pickup_datetime,
    to_timestamp_ltz(variant_col:"tpep_dropoff_datetime"::number / 1e6) as dropoff_datetime

from {{ source('nytaxidata', 'YELLOW_TRIPDATA') }}
