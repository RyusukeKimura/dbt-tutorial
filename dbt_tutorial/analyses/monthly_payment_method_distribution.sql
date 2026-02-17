select
    -- 1. 年月で切り捨て
    date_trunc(order_date, month) as order_month,

    -- 2. 全体の売上合計（分母）
    sum(amount) as total_amount,

    -- 3. 各支払い方法の割合を計算（分子 / 分母 * 100）
    round(safe_divide(sum(credit_card_amount),sum(amount)) * 100, 2) as credit_card_pct,
    round(safe_divide(sum(coupon_amount),sum(amount)) * 100, 2) as coupon_amount_pct,
    round(safe_divide(sum(bank_transfer_amount),sum(amount)) * 100, 2) as bank_transfer_amount_pct,
    round(safe_divide(sum(gift_card_amount),sum(amount)) * 100, 2) as gift_card_amount_pct

from {{ ref('fct_orders') }}

group by 1
order by 1
