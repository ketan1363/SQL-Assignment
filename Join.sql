use customer;
select * from customer1;
select * from customer11;

select customer1.Customer_id, customer1.first_name,
customer11.last_name,customer11.address_id
from customer1
inner join customer11
on customer1.customer_id = customer11.customer_id;
select customer1.Customer_id, customer1.first_name,
customer11.last_name,customer11.address_id
from customer1
inner join customer11
on customer1.customer_id = customer11.customer_id
where customer11.address_id >=15;

select c.customer_id,c.first_name,c1.last_name,c1.address_id
from customer1 as c
inner join customer11 as c1
on c.customer_id = c1.customer_id;


/* left join*/

select c.customer_id,c.first_name,c1.address_id,c1.last_name
from customer1 as c
left join customer11 as c1
on c.customer_id = c1.address_id
where c1.address_id <=13;


select * from customer11
right join customer1
on customer11.customer_id = customer1.customer_id;

select c.customer_id,c.first_name,c1.last_name,c1.address_id
from customer11 as c1
right join customer1 as c
on c1.customer_id = c.customer_id
where c1.address_id >=5;

/* full join*/

select c.customer_id,c.first_name,c1.email,c1.address_id
from customer1 as c
join customer11 as c1
where c1.address_id =15;






