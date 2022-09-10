truncate analysis.tmp_rfm_frequency ;

with segment_size 
as ( select count(*) / 5 as s from analysis.v_users vu ) ,
client_count_order as 
	(	
		select vu2.id as user_id,count(vo.order_id) as c
		from analysis.v_users vu2 left outer join analysis.v_orders vo on 
			vu2.id = vo.user_id and vo.status = '4' and vo.order_ts >= '2022-01-01'::timestamp		
		group by vu2.id 
		order by 2,1
	),
t_freq as 
	(
		select *,
			(row_number() OVER() - 1 ) / ( select s from segment_size ) + 1 as frequency 	
		from client_count_order order by c
	)
insert into analysis.tmp_rfm_frequency select user_id, frequency  from t_freq;	
	
	
