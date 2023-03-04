with source as (
      select * from {{ source('public', 'payment') }}
),
renamed as (
    select
        payment_id,
        customer_id,
        staff_id,
        rental_id,
        amount,
        payment_date as payment_datetime,
        payment_date::date as payment_date

    from source
)
select * from renamed
  