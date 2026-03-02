 {{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


SELECT
c.first_name as customer_first_name,
c.last_name as customer_last_name,
d.order_date,
e.first_name as employee_first_name,
e.last_name as employee_last_name,
s.store_name,
p.product_name
ol.unitprice,
ol.quantity
FROM {{ ref('fact_sales') }} f
LEFT JOIN {{ ref('oliver_dim_customer') }} c ON c.customer_id = o.customer_id
LEFT JOIN {{ ref('oliver_dim_date') }} d ON d.order_date = o.order_date
LEFT JOIN {{ ref('oliver_dim_employee') }} e ON e.employee_id = o.employee_id
LEFT JOIN {{ ref('oliver_dim_product') }} p ON p.product_id = ol.product_id
LEFT JOIN {{ ref('oliver_dim_store') }} s ON s.store_id = o.store_id