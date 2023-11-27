select
case 
	when c.age >16 and c.age <=25 then '16-25'
	when c.age >=26 and c.age <=40 then '26-40'
	else '40+'
end as age_category, 
count (c.customer_id)
from customers c  
group by age_category
order by age_category


