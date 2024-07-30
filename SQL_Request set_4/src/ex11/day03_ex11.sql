with current_price as (
    select price
    from menu m 
    where pizza_name = 'Greek pizza'
),
update_price as (
    select price * 0.9 as new_price from current_price
)
update menu
set price = update_price.new_price
from update_price
where pizza_name = 'Greek pizza';