with source as (
      select * from {{ source('public', 'store') }}
),
renamed as (
    select
        store_id,
        manager_staff_id,
        address_id,
        last_update as update_at,
        last_update::date as update_date

    from source
)
select * from renamed
  