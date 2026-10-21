{{
  config(
    materialized = 'ephemeral',
    )
}}


SELECT 
    BOOKING_ID,
    BOOKING_DATE,
    CREATED_AT
FROM 
    {{ ref('obt') }}
