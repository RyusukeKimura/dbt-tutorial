-- 初回注文日が直近注文日より後になっている異常なデータを抽出
select
    customer_id,
    first_order,
    most_recent_order
from {{ ref('dim_customers') }}
where first_order > most_recent_order
