select
extract (year from s.sale_date )||'-'|| extract (month from s.sale_date ) as date,
count(distinct c.first_name||'_'||c.last_name||'_'||c.age) as total_customer,
round(sum(s.quantity*p.price),0) as income
from sales s 
left join customers c
on s.customer_id =c.customer_id 
left join products p 
on  s.product_id = p.product_id
group by s.sale_date
order by s.sale_date
