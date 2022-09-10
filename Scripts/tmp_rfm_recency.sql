truncate analysis.tmp_rfm_recency;

with segment_size 
as ( select count(*) / 5 as s from analysis.v_users vu ) ,
client_last_order as 
	(	
		select vu2.id as user_id,coalesce(max(order_ts),'1000-01-01'::timestamp) as ord_date 
		from analysis.v_users vu2 left outer join analysis.v_orders vo on
			vu2.id = vo.user_id 
			and vo.status = '4'
			and vo.order_ts >= '2022-01-01'::timestamp
		group by vu2.id 
		order by 2,1
	),
t_recency as 
	(
	select *,
		(row_number() OVER() - 1 ) / ( select s from segment_size ) + 1 as recency	
		from client_last_order order by ord_date
	)
insert into analysis.tmp_rfm_recency select user_id, recency from t_recency 
	
	
