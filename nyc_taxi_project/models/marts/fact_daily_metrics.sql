{{ config(materialized='table') }}

select
    date_trunc('day', pickup_datetime) as trip_date,
    count(*) as trip_count,
    round(avg(trip_distance), 2) as avg_distance,
    round(avg(fare_amount), 2) as avg_fare,
    round(avg(tip_amount), 2) as avg_tip,
    round(avg(total_amount), 2) as avg_total
from {{ ref('stg_yellow_tripdata') }}
group by 1
order by 1
