use shop_new;
-- 1. Найти общую сумму заказов для каждого клиента.
select 
	t1.CNAME,
    sum(t2.AMT) as total_sum
from CUSTOMERS as t1
inner join ORDERS as t2
on t1.CUST_ID = t2.CUST_ID
group by t1.CNAME
order by total_sum;

-- 2. Получить количество заказов для каждого продавца.
select
	t1.SNAME,
	count(*) as order_count
from SELLERS as t1
inner join ORDERS as t2
on t1.SELL_ID = t2.SELL_ID
group by t1.SNAME
order by order_count desc;

-- 3. Получить количество клиентов с рейтингом выше среднего.
select
	count(*) as count_clients
from CUSTOMERS
where RATING > (select avg(RATING)
					from CUSTOMERS);

-- 4. Получить количество клиентов в каждом городе с рейтингом выше 200.
select
	CITY,
	count(*) as count_clients
from CUSTOMERS
where RATING > 200
group by CUSTOMERS.CITY;

-- 5. Получить количество заказов, сделанных в каждый месяц.
select
	extract(month from ODATE) as month,
	count(*) as orders_count
from ORDERS
group by month
order by month;

-- 6. Найти клиентов, у которых сумма заказов превышает среднюю сумму заказов всех клиентов.
select
	t1.CNAME,
    sum(t2.AMT) as total_orders_amount
from CUSTOMERS as t1
inner join ORDERS as t2
on t1.CUST_ID = t2.CUST_ID
group by t1.CNAME
having total_orders_amount > (select avg(t2.AMT)
								from ORDERS as t2);








