with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('revenue_targets') }}

),

renamed as (

    select
      date(month) as month,
      cast(target_amount as int64) as target_amount,
    from source

)

select * from renamed
