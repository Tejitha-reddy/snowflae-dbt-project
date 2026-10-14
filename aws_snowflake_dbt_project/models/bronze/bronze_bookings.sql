/*

{% set incremental_flag = 1 %}
{% set incremental_col = 'created_at' %}

select * from {{ source('staging', 'bookings') }}
{% if incremental_flag == 1 %}
    where {{incremental_col}}> (select coalesce(max({{incremental_col}}),'1900-01-01') from {{ this }})
{% endif %}

*/

-----dbt inbuilt incremental function

{{ config(materialized='incremental') }}

select * from {{ source('staging', 'bookings') }}
{% if is_incremental() %}
  where created_at >= coalesce((select max(created_at) from {{ this }}), '1900-01-01')
{% endif %}