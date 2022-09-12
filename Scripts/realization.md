# Витрина RFM

## 1.1. Выясните требования к целевой витрине.

Витрина должна содержать следующие поля:
		user_id
		recency (число от 1 до 5)
		frequency (число от 1 до 5)
		monetary_value (число от 1 до 5)

	Данные: с 2022 года

	Название витрины: dm_rfm_segment в схеме analysis

	Заполнение: только разовая загрузка

	Источники:
		справочник клиентов - production.users
		данные по заказам клиентов - production.orders, необходимо учитывать только успешные заказы (status=closed)
		данные по статусам заказа production.orderstatuses



## 1.2. Изучите структуру исходных данных.

producition.users: первичный ключ id, тип int4. Поле login имеют опцию NOT NULL 

produciton.orders: все поля NOT NULL, первичный ключ - order_id;
				   ограничение типа CHECK на поля: ((cost = (payment + bonus_payment)));
				   внешних ключей нет;
				   индекс по order_id
				   поле order_id - внешний ключ для production.orderitems и orderstatuslog
				   
production.orderstatuses: все поля not null, id - внешний ключ

## 1.3. Проанализируйте качество данных

production.users: поля login и name перепутаны местами;
				  также вызывает вопрос длина login - обычно логины имеют фиксированную длину;
		Для задачи данные проблемы качеста не существенны и могут быть проигнорированы.
		
production.orders: нет внешнего ключа на users по полю user_id,
				   проверка показывает, что неправильных id клиентов нет:				   
select o.user_id  from production.orders o where user_id not in ( select user_id from production.users u)
					
				   нет внешниего ключа по полю status, проверка показывает, что неправильных статусов нет:
select o.status  from production.orders o where status not in (select status from production.orderstatuses o2)




## 1.4. Подготовьте витрину данных


### 1.4.1. Сделайте VIEW для таблиц из базы production.**

views.sql

### 1.4.2. Напишите DDL-запрос для создания витрины.**

datamart_ddl.sql

### 1.4.3. Напишите SQL запрос для заполнения витрины

tmp*.sql
datamart_query.sql



2. Доработка представлений

orders_view.sql

	
	
	
	
	

