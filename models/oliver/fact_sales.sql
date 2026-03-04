{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
    c.customer_key,
    d.date_key,
    e.employee_key,
    p.productkey,
    s.storekey,
    ol.order_id,
    ol.unit_price,
    ol.quantity
FROM {{ source('oliver_landing', 'orderline') }} ol
INNER JOIN {{ source('oliver_landing', 'orders') }} o ON ol.order_id = o.order_id
INNER JOIN {{ ref('oliver_dim_customer') }} c ON c.customer_id = o.customer_id
INNER JOIN {{ ref('oliver_dim_date') }} d ON d.order_date = o.order_date
INNER JOIN {{ ref('oliver_dim_employee') }} e ON e.employee_id = o.employee_id
INNER JOIN {{ ref('oliver_dim_product') }} p ON p.product_id = ol.product_id
INNER JOIN {{ ref('oliver_dim_store') }} s ON s.store_id = o.store_id



