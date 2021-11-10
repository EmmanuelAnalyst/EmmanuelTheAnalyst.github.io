create database fintech_users;
use fintech_users;
create table fintech_users(user_id int, age int, housing char(2), credit_score int, deposits int, withdrawal int, 
purchases_partners int, purchases int, payment_type varchar(100), zodiac_sign varchar(100), rewards_earned int, reward_rate float);

select row_number() over () as row_num, 
user, age, housing, credit_score,
deposits, withdrawal, purchases_partners, purchases, payment_type, zodiac_sign, rewards_earned, reward_rate,
case
when age between 10 and 30 then '10-30'
when age between 31 and 50 then '31-50'
when age between 51 and 70 then '31-70'
when age between 71 and 80 then '71-80'
when age > 80 then '80+'
else age
end as age_bracket
from fintech_users
where reward_rate > (select avg(reward_rate) from fintech_users)
 -- This query displays the users reward_rate greater than the toal average reward rate which is 1.12
group by user
-- USING THE HAVING CLAUSE
having deposits and withdrawal > 1 and
purchases > 10 and 
housing <> 'na' and
payment_type <> 'na'  and
zodiac_sign <> 'na' and
deposits > 20
and purchases_partners < 100
limit 200;




-- CREATING A DELIMITER FOR USERS WITH A BI_WEEKLY PAYMENT TYPE
delimiter //
create procedure Bi_weekly_payment()
begin
select *
from fintech_users
where payment_type = 'Bi-Weekly'
having deposits and withdrawal > 1 and
purchases > 10 and 
housing <> 'na' and
payment_type <> 'na' and
zodiac_sign <> 'na';
end //
delimiter ;

call Bi_weekly_payment();


-- CREATING A VIEW FOR HOUSING WITH 'O' RECORD
create view O_housing
as
select * from
fintech_users
where housing = 'O'
having deposits and withdrawal > 1 and
purchases > 10 and 
housing <> 'na' and
payment_type <> 'na' and
zodiac_sign <> 'na';

select * from O_housing;

-- CREATING VIEW FOR USERS WITH AQUARIUS ZODAIC SIGN
create view The_Aquarius
as
select * 
from fintech_users
where zodiac_sign = 'Aquarius'
having deposits and withdrawal > 1 and
purchases > 10 and 
housing <> 'na' and
payment_type <> 'na' and
zodiac_sign <> 'na';

select * from The_Aquarius;








