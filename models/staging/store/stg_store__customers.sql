with source as (
      select * from {{ source('public', 'customer') }}
),
renamed as (
    select
        customer_id,
        store_id as customer_store_id,
        first_name,
        last_name,
        first_name || ' ' || last_name as customer_name,
        email,
        address_id,
        activebool as customer_is_active,
        create_date as created_at,
        last_update as update_at,
        last_update::date as update_date,
        active

    from source
)
select * from renamed
  