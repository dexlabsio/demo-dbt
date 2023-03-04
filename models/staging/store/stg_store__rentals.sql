with source as (
      select * from {{ source('public', 'rental') }}
),
renamed as (
    select
        rental_id,
        rental_date,
        inventory_id,
        customer_id,
        return_date,
        staff_id,
        last_update as update_at,
        last_update::date as update_date

    from source
)
select * from renamed