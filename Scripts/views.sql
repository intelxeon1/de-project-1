create or replace view analysis.v_orders as select * from production.orders o;
create or replace view analysis.v_users as select * from production.users u ;
create or replace view analysis.v_orderitems as select * from production.orderitems o  ;
create or replace view analysis.v_orderstatuses as select * from production.orderstatuses o ;
create or replace view analysis.v_orderstatuslog as select * from production.orderstatuslog o2; 
