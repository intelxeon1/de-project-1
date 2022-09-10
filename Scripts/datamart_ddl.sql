
CREATE TABLE analysis.dm_rfm_segments (
	user_id int4 NOT null primary key,
	recency  smallint NOT NULL CHECK(recency >= 1 AND recency <= 5),
	frequency  smallint NOT NULL CHECK(recency >= 1 AND recency <= 5),
	monetary_value smallint NOT NULL CHECK(recency >= 1 AND recency <= 5)		
)