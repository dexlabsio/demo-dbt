select 
    staff_id,
    staff_name,
    address_number,
    address,
    email,
    active,
    username,
    update_at,
    picture
    
from {{ ref('int_dim_staff') }} as staff