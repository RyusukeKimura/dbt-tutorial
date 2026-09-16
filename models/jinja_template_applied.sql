{# 1. 変数の宣言（コントロールステートメント） #}
{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

select
    order_id,
    
    {# 2. forループで動的にSQLを生成 #}
    {% for payment_method in payment_methods %}
    sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount
    
    {# 最後のループ以外はカンマを付与するif条件 #}
    {% if not loop.last %},{% endif %}
    {% endfor %}
    
from {{ ref('stg_payments') }}
group by 1
