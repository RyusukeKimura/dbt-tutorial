-- 各支払い方法の合計と、最終的な総額(amount)が一致しないレコードを抽出
select
    order_id,
    amount,
    (
      credit_card_amount 
      + coupon_amount 
      + bank_transfer_amount 
      + gift_card_amount
    ) as calculated_total
from {{ ref('fct_orders') }}
where amount != (credit_card_amount + coupon_amount + bank_transfer_amount + gift_card_amount)
