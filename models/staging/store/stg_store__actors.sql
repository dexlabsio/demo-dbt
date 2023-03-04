with source as (
      select * from {{ source('public', 'actor') }}
),
renamed as (
    select
        actor_id,
        first_name as actor_first_name,
        last_name as actor_last_name,
        first_name || ' ' || last_name as actor_complete_name,
        last_update as update_at,
        last_update::date  as updated_date
    from source
)
select * from renamed
  