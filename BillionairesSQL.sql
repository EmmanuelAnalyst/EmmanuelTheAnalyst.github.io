create database forbes_billionaires;

use forbes_billionaires;

select * from forbes_billionaires;


#TOP 20 BILLIONAIRES
select name, networth, age, country, source, industry, 
concat(name, ' ', 'owner of ', source, ' ', 'has a networth of ', networth, ' ', 'billion dollars') as 'In Summary'
from forbes_billionaires
limit 21;


#TOP 10 COUNTRIES WITH THE MOST BILLIONAIRES
select country, count(*) as number_of_billionaires,
concat(country, ' ', 'has ', count(*), ' ', 'billionaires') as 'summary'
from forbes_billionaires
group by country
order by number_of_billionaires desc;
-- LIMIT 10;


#BILLIONAIRES WITH AGE GREATER 50
select *
from forbes_billionaires
where age > 50
order by age desc;


#BILLIONAIRES WITH AGE BELOW 50
select * 
from forbes_billionaires
where age <= 50
order by age desc;


#NUMBER OF BILLIONAIRES WITHIN THE SAME AGE BRACKET
select age, count(*) as number_of_billionaires,
concat('there are ', count(*), ' ', ' billionaires who are currentrly ', age, ' ', 'years old') as summary
from forbes_billionaires
group by age
order by number_of_billionaires desc;


#TOP SOURCE WITH THE MOST BILLIONAIES
select source, count(*) as number_of_billionaires
from forbes_billionaires
group by source
order by number_of_billionaires desc;


#TOP INDUSTRIES WITH THE MOST BILLIONAIRES
select industry, count(*) as number_of_billionaires
from forbes_billionaires
group by industry
order by number_of_billionaires desc;


#BILLIONAIRES IN NIGERIA
select *
from forbes_billionaires
where country = 'nigeria';


#INDUSTRIES IN UNITED STATES WITH THE MOST BILLIONAIRES
select country, industry, count(industry) as industry
from forbes_billionaires
group by industry
having country = 'united states'
order by industry desc;


#INDUSTRIES IN CHINA WITH THE MOST BILLIONAIRES
select country, industry, count(industry) as industry
from forbes_billionaires
group by industry
having country = 'china'
order by industry desc;


#INDUSTRIES IN INDIA WITH THE MOST BILLIONAIRES
select country, industry, count(industry) as industry
from forbes_billionaires
group by industry
having country = 'india'
order by industry desc;