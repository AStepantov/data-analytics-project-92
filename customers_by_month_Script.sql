select
to_char(s.sale_date,'YYYY-mm')as date ,
count(distinct c.first_name||'_'||c.last_name||'_'||c.age) as total_customers,
floor(sum(s.quantity*p.price)) as income
from sales s 
left join customers c
on s.customer_id =c.customer_id 
left join products p 
on  s.product_id = p.product_id
group by date
order by date

