use Ecommerce

select * from Data

begin transaction
--Remove unwanted data 
delete from Data  
where price is null and user_id is NULL  

--check null values
select count(*) from data
where user_id is null

--Fill null cells
update data
set brand = 'Other'
where brand is null

update data
set category_code = 'Other'
where category_code is null

update data
set user_id = 0
where user_id is null

commit

--- remove all duplicate value 
begin transaction

;WITH cte AS ( SELECT *, ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY event_time DESC) AS rn
    FROM Data
)
DELETE FROM cte
where rn > 1

commit
