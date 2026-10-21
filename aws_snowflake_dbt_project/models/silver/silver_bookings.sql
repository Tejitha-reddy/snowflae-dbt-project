{{
  config(
    materialized = 'incremental',
    unique_key = 'BOOKING_ID',
    on_schema_change = 'append_new_columns'
    )
}}


select 
BOOKING_ID, 
LISTING_ID, 
BOOKING_DATE,
BOOKING_STATUS,
{{multiply('nights_booked','booking_amount',2)}}+cleaning_fee+service_fee as total_amount,
created_At
from {{ ref('bronze_bookings') }}