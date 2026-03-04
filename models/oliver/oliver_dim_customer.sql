{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT CUSTOMER_ID AS Customer_Key,
Customer_ID,
FIRST_NAME,
LAST_NAME,
EMAIL,
PHONE_NUMBER,
STATE
FROM {{ source('oliver_landing', 'customer') }}