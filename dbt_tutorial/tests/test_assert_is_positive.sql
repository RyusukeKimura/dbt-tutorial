{% test assert_is_positive(model, column_name) %}

with validation as (
    select
        {{ column_name }} as field
    from {{ model }}
)

select *
from validation
-- 0未満（負の数）がある場合にレコードを返す（＝テスト失敗）
where field < 0

{% endtest %}
