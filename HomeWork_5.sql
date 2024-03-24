use homework;

/* 1. Вывести имя, фамилию пользователей и даты их заказов(order_date). */
select
	t1.CUST_FIRST_NAME,
	t1.CUST_LAST_NAME,
    t2.ORDER_DATE 
		from customers as t1
		inner join orders as t2
        on t1.CUSTOMER_ID = t2.CUSTOMER_ID;
        
/* 2. Вывести даты заказов продуктов и описание этих продуктов(product_description). */
select
	t1.ORDER_DATE,
    t3.PRODUCT_DESCRIPTION
		from orders as t1
        inner join order_items as t2
        on t1.ORDER_ID = t2.ORDER_ID
        inner join product_information as t3
        on t2.PRODUCT_ID = t3.PRODUCT_ID;
        
/* 3. Вывести имя, фамилию пользователей, даты заказов(orderdate), описание продуктов, которые они заказали и категории соответствующих продуктов (categoryname). */
select
	t1.CUST_FIRST_NAME, 
	t1.CUST_LAST_NAME, 
    t2.ORDER_DATE, 
    t3.PRODUCT_DESCRIPTION, 
    t4.CATEGORY_NAME 
	from customers as t1
		inner join orders as t2
		on t1.CUSTOMER_ID = t2.CUSTOMER_ID
        inner join order_items as t5
        on t2.ORDER_ID = t5.ORDER_ID
        inner join product_information as t3
        on t5.PRODUCT_ID = t3.PRODUCT_ID
        inner join categories_tab as t4
        on t3.CATEGORY_ID = t4.CATEGORY_ID;
        
        
/* 4. Вывести названия(productname), описания категорий(categorydescription) и количества(quantity) тех продуктов, у которых минимальная стоимость (min_price) больше 300.*/
	select
		t1.PRODUCT_NAME, 
        t2.CATEGORY_DESCRIPTION, 
        t4.QUANTITY 
		from product_information as t1
        inner join categories_tab as t2
        on t1.CATEGORY_ID = t2.CATEGORY_ID
        inner join product_information as t3
        on t2.CATEGORY_ID = t3.CATEGORY_ID
        inner join order_items as t4
        on t3.PRODUCT_ID = t4.PRODUCT_ID
        where t3.MIN_PRICE > 300;
        
/* 5. Вывести имя, фамилию покупателей, которые купили принтеры. */ 
	select
		t1.CUST_FIRST_NAME, 
		t1.CUST_LAST_NAME
		from customers as t1
			inner join orders as t2
			on t1.CUSTOMER_ID = t2.CUSTOMER_ID
			inner join order_items as t5
			on t2.ORDER_ID = t5.ORDER_ID
			inner join product_information as t3
			on t5.PRODUCT_ID = t3.PRODUCT_ID
			inner join categories_tab as t4
			on t3.CATEGORY_ID = t4.CATEGORY_ID
            where t4.CATEGORY_DESCRIPTION = 'printers';
        
/* 6. Вывести имя, фамилию всех женатых мужчин покупателей, которые покупали продукты со стоимостью (list_price) больше 550. */
	select
		t1.CUST_FIRST_NAME, 
		t1.CUST_LAST_NAME
		from customers as t1
			inner join orders as t2
            on t1.CUSTOMER_ID = t2.CUSTOMER_ID
            inner join order_items as t3
            on t2.ORDER_ID = t3.ORDER_ID
            inner join product_information as t4
            on t3.PRODUCT_ID = t4.PRODUCT_ID
        where t1.MARITAL_STATUS = 'married' and t1.GENDER = 'M' and t4.LIST_PRICE > 550;
        
/* 7. Вывести названия(product_name) тех продуктов, у которых стоимость больше, чем у продукта 'LaserPro 600/6/BW’.*/
	select
		PRODUCT_NAME
        from product_information
        where LIST_PRICE > (select LIST_PRICE
								from product_information 
									where PRODUCT_NAME = 'LaserPro 600/6/BW');
        
        
        
        
        
        
        
