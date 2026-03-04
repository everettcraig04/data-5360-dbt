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
p.product_name,
f.unit_price,
f.quantity
FROM {{ ref('fact_sales') }} f
LEFT JOIN {{ ref('oliver_dim_customer') }} c ON c.customer_key = f.customer_key
LEFT JOIN {{ ref('oliver_dim_date') }} d ON d.date_key = f.date_key
LEFT JOIN {{ ref('oliver_dim_employee') }} e ON e.employee_key = f.employee_key
LEFT JOIN {{ ref('oliver_dim_product') }} p ON p.productkey = f.productkey
LEFT JOIN {{ ref('oliver_dim_store') }} s ON s.storekey = f.storekey