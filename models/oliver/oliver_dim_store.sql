{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
Store_ID AS StoreKey,
Store_ID,
Store_Name,
Street,
City,
State
FROM {{ source('oliver_landing', 'store') }}