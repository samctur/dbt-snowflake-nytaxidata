{{ config(materialized='ephemeral') }}

select
  *,
  datediff('minute', pickup_datetime, dropoff_datetime) as trip_duration_minutes,
  round(total_amount / nullif(trip_distance, 0), 2) as revenue_per_mile,
  round(tip_amount / nullif(fare_amount, 0), 2) as tip_percent
from {{ ref('int_yellow_tripdata_filtered') }}
