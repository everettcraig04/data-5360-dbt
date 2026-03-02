{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT ROW_NUMBER() OVER (ORDER BY Order_Date) AS Date_Key,
Order_Date,
DAYOFWEEK(Order_Date) AS DayofWeek,
MONTH(Order_Date) AS Month,
QUARTER(Order_Date) AS Quarter,
YEAR(Order_Date) AS Year
FROM {{ source('oliver_landing', 'orders') }}