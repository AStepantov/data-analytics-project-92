with t1 as (
select 
row_number () over (partition by c.customer_id ) as RN,
concat(c.first_name,' ',c.last_name) as customer,
s.sale_date,
concat(e.first_name,' ',e.last_name) as seller
from sales s 
left join employees e 
on s.sales_person_id = e.employee_id
left join customers c 
on s.customer_id = c.customer_id 
left join products p 
on s.product_id =p.product_id
where p.price = 0
group by c.customer_id,s.sale_date,customer,seller
order by c.customer_id
) 
select 
t1.customer,
t1.sale_date,
t1.seller
from t1
where rn=1



