with source as (
      select * from {{ source('public', 'inventory') }}
),
renamed as (
    select
        inventory_id,
        film_id,
        store_id,
        last_update as update_at,
        last_update::date as update_date

    from source
)
select * from renamed
