{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
Employee_ID AS Employee_Key,
Employee_ID,
First_Name,
Last_Name, 
Hire_Date,
Position,
Email,
Phone_Number
FROM {{ source('oliver_landing', 'employee') }}