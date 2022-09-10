truncate analysis.dm_rfm_segments ;
with all_data as 
(
	select trr.user_id, recency,frequency,monetary_value from
	analysis.tmp_rfm_recency trr  join 
	analysis.tmp_rfm_frequency trf on trr.user_id = trf.user_id join 
	analysis.tmp_rfm_monetary_value trmv on trr.user_id = trmv.user_id 
	
)
insert into analysis.dm_rfm_segments 
select * from all_data


--user_id|recency|frequency|monetary_value|
--------+-------+---------+--------------+
--      0|      1|        3|             4|
--      1|      4|        3|             3|
--      2|      2|        3|             5|
--      3|      2|        3|             3|
--      4|      4|        3|             3|
--      5|      5|        5|             5|
--      6|      1|        3|             5|
--      7|      4|        2|             2|
--      8|      1|        1|             3|
--      9|      1|        2|             2|