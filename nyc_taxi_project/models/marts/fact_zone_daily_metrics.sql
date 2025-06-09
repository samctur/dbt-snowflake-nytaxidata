select
    pickup_zone_name,
    dropoff_zone_name,
    date_trunc('day', pickup_datetime) as trip_date,
    count(*) as trip_count,
    round(avg(trip_distance), 2) as avg_distance,
    round(avg(tip_percent), 2) as avg_tip_percent,
    round(sum(total_amount), 2) as total_revenue
from {{ ref('int_trip_with_zones') }}
group by 1, 2, 3
