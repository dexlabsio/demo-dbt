with source as (
      select * from {{ source('public', 'address') }}
),
renamed as (
    select
        address_id,
        substring(address, '^[0-9]*') as address_number,
        address,
        address2,
        district,
        city_id,
        postal_code,
        phone,
        last_update as update_at,
        last_update::date as update_date
    from source
)
select * from renamed
  