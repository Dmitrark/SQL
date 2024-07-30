with date_range as (
    select generate_series(
        DATE '2022-01-01',
        DATE '2022-01-10',
        INTERVAL '1 day'
    )::DATE as visit_day
),
visited_days as (
    select distinct on (visit_date) visit_date
    from person_visits pv
    where person_id = 1 or person_id = 2
    order by visit_date
)
select dr.visit_day as missing_date
from date_range dr
left join visited_days vd on dr.visit_day = vd.visit_date
where vd.visit_date is null
order by dr.visit_day;