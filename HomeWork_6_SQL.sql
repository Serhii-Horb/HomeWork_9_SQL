use homework;

/* 1) Вывести максимальный и минимальный credit_limit. */
select 
max(CREDIT_LIMIT) as max_credit_limit,
min(CREDIT_LIMIT) as min_credit_limit
from customers;

/* 2) Вывести покупателей у которых creditlimit выше среднего creditlimit. */
select 
	CUST_FIRST_NAME,
    CUST_LAST_NAME
from customers
where CREDIT_LIMIT > (select avg(CREDIT_LIMIT) from customers);

/* 3) Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500. */
select
	count(*)
from customers
where CUST_FIRST_NAME LIKE 'D%' AND CREDIT_LIMIT > 500;

/* 4) Найти среднее значение unit_price */
select
	avg(UNIT_PRICE) as average_unit_price
    from order_items;

/* 5) Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего. */
select 
	t1.PRODUCT_NAME
from product_information as t1
inner join order_items as t2
on t1.PRODUCT_ID = t2.PRODUCT_ID
WHERE QUANTITY < (SELECT AVG(QUANTITY) FROM order_items);

/* 6) Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL). */
select
	t1.CUST_FIRST_NAME,
    t1.CUST_LAST_NAME
from customers as t1
inner join orders as t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
WHERE ORDER_TOTAL = (SELECT MAX(ORDER_TOTAL) FROM customers);

/* 7) Найти сумму общей суммы покупок(ORDER_TOTAL) всех женатых мужчин покупателей. */
select
	SUM(t1.ORDER_TOTAL) as total_order_amount
    from orders as t1
inner join customers as t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
    WHERE MARITAL_STATUS = 'married' and GENDER = 'M';











