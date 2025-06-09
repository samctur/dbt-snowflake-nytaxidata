{{ config(materialized='table') }}

select
    pickup_location_id,
    date_trunc('day', pickup_datetime) as trip_date,
    count(*) as trip_count,
    round(sum(fare_amount), 2) as total_fare,
    round(sum(tip_amount), 2) as total_tips,
    round(sum(total_amount), 2) as total_revenue
from {{ ref('stg_yellow_tripdata') }}
group by 1, 2
