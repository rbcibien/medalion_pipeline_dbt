{{ config(materialized='table', schema='gold') }}

WITH sales_accumulated_monthly_mv AS (
    SELECT
        EXTRACT(YEAR FROM o.order_date) AS year,
        EXTRACT(MONTH FROM o.order_date) AS month,
        SUM(od.unit_price * od.quantity * (1 - od.discount)) AS accumulated_sales
    FROM
        {{ ref('int_finance__order_details') }} od
    JOIN
        {{ ref('int_finance__orders') }} o ON o.order_id = od.order_id
    GROUP BY
        EXTRACT(YEAR FROM o.order_date),
        EXTRACT(MONTH FROM o.order_date)
    ORDER BY
        EXTRACT(YEAR FROM o.order_date),
        EXTRACT(MONTH FROM o.order_date)
)
SELECT * FROM sales_accumulated_monthly_mv
