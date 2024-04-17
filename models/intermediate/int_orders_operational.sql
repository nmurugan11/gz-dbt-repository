{{ config(schema='dbt_Nivetha') }} 
SELECT 
    o.orders_id
    ,o.date_date
    ,ROUND(o.margin + s.shipping_fee - (s.logcost + CAST(ship_cost AS FLOAT64)),2) AS operational_margin
    ,o.quantity
    ,o.revenue
    ,CAST(purchase_cost AS FLOAT64) AS purchase_cost
    ,o.margin
    ,s.shipping_fee
    ,s.logcost
    ,CAST(ship_cost AS FLOAT64) AS ship_cost
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw__ship")}} s 
    USING(orders_id)
ORDER BY orders_id DESC