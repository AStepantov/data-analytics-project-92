with t1 as(
select 
round(avg(s.quantity*p.price),0) as avg_income
from sales s
left join products p 
on s.product_id = p.product_id
 ),t2 as (
select 
concat(e.first_name,' ', e.last_name) as name,
round(avg(s.quantity*p.price),0) as average_income
from sales s  
left join employees e 
on e.employee_id= s.sales_person_id  
left join products p 
on s.product_id = p.product_id
group by e.first_name , e.last_name 
order by average_income asc 
)
select 
t2.name,
t2.average_income
from t2
cross join t1
where t2.average_income < t1.avg_income
order by t2.average_income
