select 
    staff.staff_id,
    staff.complete_name as staff_name,
    address.address_number,
    address.address,
    staff.email,
    staff.active,
    staff.username,
    staff.update_at,
    staff.picture

from {{ ref('stg_store__staff') }} as staff
left join {{ ref('stg_store__address') }} as address
    on address.address_id = staff.address_id