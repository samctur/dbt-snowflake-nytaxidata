select
    t.*,
    pickup_zone."ZONE" as pickup_zone_name,
    dropoff_zone."ZONE" as dropoff_zone_name
from {{ ref('int_yellow_tripdata_enriched') }} as t
left join {{ ref('taxi_zone_lookup') }} as pickup_zone
on t.pickup_location_id = pickup_zone."LOCATIONID"
    left join {{ ref('taxi_zone_lookup') }} as dropoff_zone
    on t.dropoff_location_id = dropoff_zone."LOCATIONID"
