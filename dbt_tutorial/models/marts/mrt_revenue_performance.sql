with actuals as (
    select
        date_trunc(order_date, month) as revenue_month,
        sum(amount) as actual_amount
    from {{ ref('fct_orders') }}
    group by 1
),
targets as (
    select * from {{ ref('revenue_targets') }}
)

select
    targets.month,
    targets.target_amount,
    coalesce(actuals.actual_amount, 0) as actual_amount,
    (actuals.actual_amount >= targets.target_amount) as is_target_met
from targets
left join actuals on targets.month = actuals.revenue_month