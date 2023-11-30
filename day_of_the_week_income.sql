with t1 as (
select 
concat(e.first_name,' ',e.last_name) as name,
extract (isodow from s.sale_date) as day_num,
round(sum(s.quantity*p.price),0) as income
from sales s 
left join employees e 
on s.sales_person_id = e.employee_id 
left join products p 
on s.product_id = p.product_id 
group by e.first_name,e.last_name,day_num
)
select 
t1. name,
case 
	when t1.day_num = '1' then 'monday '
	when t1.day_num = '2' then 'tuesday '
	when t1.day_num = '3' then 'wednesday '
	when t1.day_num = '4' then 'thursday '
	when t1.day_num = '5' then 'friday '
	when t1.day_num = '6' then 'saturday '
	when t1.day_num = '7' then 'sunday '
	end as weekday,
t1.income
from t1
order by t1.day_num, t1.name
