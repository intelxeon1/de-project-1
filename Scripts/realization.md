# ������� RFM

## 1.1. �������� ���������� � ������� �������.

������� ������ ��������� ��������� ����:
		user_id
		recency (����� �� 1 �� 5)
		frequency (����� �� 1 �� 5)
		monetary_value (����� �� 1 �� 5)

	������: � 2022 ����

	�������� �������: dm_rfm_segment � ����� analysis

	����������: ������ ������� ��������

	���������:
		���������� �������� - production.users
		������ �� ������� �������� - production.orders, ���������� ��������� ������ �������� ������ (status=closed)
		������ �� �������� ������ production.orderstatuses



## 1.2. ������� ��������� �������� ������.

producition.users: ��������� ���� id, ��� int4. ���� login ����� ����� NOT NULL 

produciton.orders: ��� ���� NOT NULL, ��������� ���� - order_id;
				   ����������� ���� CHECK �� ����: ((cost = (payment + bonus_payment)));
				   ������� ������ ���;
				   ������ �� order_id
				   ���� order_id - ������� ���� ��� production.orderitems � orderstatuslog
				   
production.orderstatuses: ��� ���� not null, id - ������� ����

## 1.3. ��������������� �������� ������

production.users: ���� login � name ���������� �������;
				  ����� �������� ������ ����� login - ������ ������ ����� ������������� �����;
		��� ������ ������ �������� ������� �� ����������� � ����� ���� ���������������.
		
production.orders: ��� �������� ����� �� users �� ���� user_id,
				   �������� ����������, ��� ������������ id �������� ���:				   
select o.user_id  from production.orders o where user_id not in ( select user_id from production.users u)
					
				   ��� ��������� ����� �� ���� status, �������� ����������, ��� ������������ �������� ���:
select o.status  from production.orders o where status not in (select status from production.orderstatuses o2)




## 1.4. ����������� ������� ������


### 1.4.1. �������� VIEW ��� ������ �� ���� production.**

views.sql

### 1.4.2. �������� DDL-������ ��� �������� �������.**

datamart_ddl.sql

### 1.4.3. �������� SQL ������ ��� ���������� �������

tmp*.sql
datamart_query.sql



2. ��������� �������������

orders_view.sql

	
	
	
	
	

