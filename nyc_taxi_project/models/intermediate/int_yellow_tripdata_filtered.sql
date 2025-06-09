{{ config(materialized='ephemeral') }}

select *
from {{ ref('stg_yellow_tripdata') }}
where
    pickup_datetime is not null
  and dropoff_datetime is not null
  and trip_distance > 0
  and total_amount > 0
