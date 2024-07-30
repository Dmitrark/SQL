with RankedRows as (
    select pizza_name,
           ROW_NUMBER() over(partition by pizza_name order by pizza_name) as RowNum
    from menu m
)
select pizza_name
from RankedRows
where RowNum = 1
order by pizza_name desc;
