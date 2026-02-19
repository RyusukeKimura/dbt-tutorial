-- 注文がないのにLTVがある、または注文があるのにLTVが0以下の異常値を抽出
select
    customer_id,
    number_of_orders,
    customer_lifetime_value
from {{ ref('dim_customers') }}
where (number_of_orders = 0 and customer_lifetime_value > 0)
   or (number_of_orders > 0 and customer_lifetime_value <= 0)
