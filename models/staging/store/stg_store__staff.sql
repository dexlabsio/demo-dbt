with source as (
      select * from {{ source('public', 'staff') }}
),
renamed as (
    select
        staff_id,
        first_name,
        last_name,
        first_name || ' ' ||last_name as complete_name,
        address_id,
        email,
        store_id,
        active,
        username,
        password,
        last_update as update_at,
        last_update::date as update_date,
        picture

    from source
)
select * from renamed
  