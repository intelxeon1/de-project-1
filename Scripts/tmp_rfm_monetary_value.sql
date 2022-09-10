truncate analysis.tmp_rfm_monetary_value  ;

with segment_size 
as ( select count(*) / 5 as s from analysis.v_users vu ) ,
client_sum as 
	(	
		select vu2.id as user_id,sum(vo.payment) as s
		from analysis.v_users vu2 left outer join analysis.v_orders vo on 
			vu2.id = vo.user_id and vo.status = '4' and vo.order_ts >= '2022-01-01'::timestamp		
		group by vu2.id 
		order by 2,1
	),
t_mon as 
	(
		select *,
			(row_number() OVER() - 1 ) / ( select s from segment_size ) + 1 as monetary_value 	
		from client_sum order by monetary_value 
	)
insert into analysis.tmp_rfm_monetary_value select user_id, monetary_value  from t_mon;	
	
	
