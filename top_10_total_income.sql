select 
concat(e.first_name,' ', e.last_name) as name,
count(s.product_id) as operations,
round(sum(s.quantity*p.price),0) as income
from sales s 
left join products p 
on S.product_id=P.product_id
left join employees e 
on s.sales_person_id = e.employee_id 
group by e.first_name, e.last_name
order by income desc 
limit 10

