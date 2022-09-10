create or replace view analysis.v_orders2 as 
select o.order_id , order_ts, user_id, bonus_payment,payment,cost,bonus_grant,status_id as status
from production.orders o left outer join 
(	
	select distinct on (order_id) order_id,dttm,status_id  from production.orderstatuslog o 
	order by 1,2 desc
) as ord_st on o.order_id  = ord_st.order_id

