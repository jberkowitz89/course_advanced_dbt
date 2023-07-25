{{
  config(
    materialized='table'
  )
}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['event_id', 'user_id', 'session_id']) }} AS event_key,
    event_id,
    session_id,
    user_id,
    event_name,
    created_at
FROM {{ ref('stg_bingeflix_events') }}
