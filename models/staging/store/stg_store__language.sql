with source as (
      select * from {{ source('public', '_language_') }}
),
renamed as (
    select
        language_id,
        name,
        last_update as updated_at
    from source
)
select * from renamed