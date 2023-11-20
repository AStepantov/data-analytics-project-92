with t1 as(
select 
concat(e.first_name,' ', e.last_name) as name,
to_char(s.sale_date,'d') as day_num,
sum(s.quantity*p.price) as income
from sales as s  
left join employees as e 
on e.employee_id = s.sales_person_id  
left join products as p 
on s.product_id = p.product_id
group by e.first_name,e.last_name,day_num
having sum(s.quantity*p.price) is not null
order by name,day_num
)
select 
t1.name,
case 
		when t1.day_num = '1' then 'Monday'
        when t1.day_num = '2' then 'Tuesday'
        when t1.day_num = '3' then 'Wednesday'
        when t1.day_num = '4' then 'Thursday'
        when t1.day_num = '5' then 'Friday'
        when t1.day_num = '6' then 'Saturday'
        when t1.day_num = '7' then 'Sunday'
end as weekday,
round(income)
from t1
order by t1.day_num,t1.name;
