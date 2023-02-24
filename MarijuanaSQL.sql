create database weed;

use weed;

select * from regulations;
select * from weed_clean;

create view state_weed_data
as
select row_number() over () as row_num, w.state, w.state_s, r.legality, r.medicinal, r.decriminalized, w.highQ_price_ounce, w.medQ_price_ounce, 
w.total_population, w.percent_white, w.percent_black, w. percent_hispanic, w.per_capita_income, w.median_rent, w.median_age
from weed_clean w
inner join regulations r
    on w.state = r.state;
    
    
select * from state_weed_data;


-- THE DISTINCT LEGALITY STATUS IN AMERICA
select distinct legality
from state_weed_data
group by legality;


-- THE NUMBER OF STATES AND ITS LEGALITY STATUS
select legality, count(*) as number_of_state
from state_weed_data
group by legality
order by number_of_state desc;


-- STATES THAT HAVE NOT LEGALIZE THE USE OF WEED
select state, legality, decriminalized
from state_weed_data
where legality = 'fully illegal';


-- STATES THAT HAVE LEAGALIZE THE USE OF WEED
select state, legality, decriminalized
from state_weed_data
where legality = 'fully legal';


-- STATES THAT HAVE APPROVED THE USE OF WEED FOR MEDICAL USE ONLY
select state, legality, decriminalized
from state_weed_data
where legality = 'medical' and decriminalized = 'false';


-- STATE WITH FULL LEGAL AND MEDICAL STATUS
select state, legality, medicinal
from state_weed_data
where legality = 'fully legal' and medicinal = 'true';


-- LEGALIZED STATE AND ITS PER CAPITAL INCOME AND AVERAGE RENT
select state, legality, total_population, per_capita_income, median_rent
from state_weed_data
where legality = 'fully legal'
order by per_capita_income desc;



-- OTHER STATES
select state, legality, total_population, per_capita_income, median_rent
from state_weed_data
where legality <> 'fully legal'
order by per_capita_income desc;


 


-- STATE THAT HAVE HAVE CRIMINALIZED THE USE OF WEED
select state, legality, decriminalized
from state_weed_data
where decriminalized = 'false'

