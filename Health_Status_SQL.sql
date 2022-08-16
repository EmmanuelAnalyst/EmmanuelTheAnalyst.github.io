create database health;

use health;

select * from health_data;

create view new_health_data
as
select gender, age, hypertension, heart_disease, ever_married, work_type, residence_type, avg_glucose_level, bmi,
case 
when bmi < 18.5 then 'underweight'
when bmi between 18.5 and 24.9 then 'healthy weight'
when bmi between 25 and 29.9 then 'overweight'
when bmi between 30 and 39.9 then 'obesity'
else 'morbid obesity'
end as 'bmi_ranges', 
smoking_status, stroke
from health_data;


select * from new_health_data;

-- NUMBER OF MALE AND FEMALE PATIENTS
select gender, count(*) as number_of_patients
from new_health_data
group by gender;


-- THE WORK STATUS OF THE PATIENTS
select work_type, count(*) as number_of_patients
from new_health_data
group by work_type;


-- GROUPING THE WORK STATUS BY MALE AND FEMALE
select work_type, gender, count(*) as number_of_patients
from new_health_data
group by gender, work_type
order by work_type desc;


-- THE SMOKING STATUS OF THE PATIENTS
select smoking_status, count(*) as number_of_patients
from new_health_data
group by smoking_status
order by number_of_patients desc;


-- GROUPING THE SMOKING STATUS BY MALE AND FEMALE
select gender, count(*) as number_of_patients, smoking_status
from new_health_data
group by gender, smoking_status
order by smoking_status desc;


-- THE RESIDENCE OF THE PATIENTS
select residence_type, count(*) as number_of_patients
from new_health_data
group by residence_type
order by number_of_patients desc;


-- THE MARITAL STATUS OF THE PATIENTS
select count(*) as number_of_patients, ever_married,
concat('A total of ', count(*), ' ', 'patients have a marital status of ', ever_married) as 'summary'
from new_health_data
group by ever_married;


-- GROUPING THE MARITAL STATUS BY MALE AND FEMALE PATIENTS
select gender, count(*) as number_of_patients, ever_married
from new_health_data
group by gender, ever_married;


-- THE BODY MASS INDEX (BMI) RANGE OF THE PATIENTS
select bmi_ranges, count(*) as number_of_patients,
concat('There are ', count(*), ' ', 'patients with the ', bmi_ranges, ' ', 'status') as 'summary'
from new_health_data
group by bmi_ranges;


-- NUBMER OF MALE AND FEMALE PATIENTS WITH HYPERTENSION
select gender, count(*) as 'number of patients', hypertension
from new_health_data
group by gender, hypertension
having hypertension = 'yes'
order by gender desc;


-- NUMBER OF MALE AND FEMALE PATIENTS WITH A HEART DISEASE
select gender, count(*) as 'number of patients', heart_disease
from new_health_data
group by gender, heart_disease
having heart_disease = 'yes'
order by gender desc;


-- NUMBER OF MALE AND FEMALE PATIENTS WITH A STROKE
select gender, count(*) as 'number of patients', stroke
from new_health_data
group by gender, stroke
-- having stroke = 'yes'
order by gender desc;


-- THE MINIMUM, MAXIXUM AND AVERAGE AGE OF THE PATIENTS
select min(age) as 'minimum age', max(age) as 'maximum age', round(avg(age), 2) as 'average age'
from new_health_data;


-- COMMON AGE AMONG THE PATIENTS
select age, count(*) as patients,
concat('There are ', count(*), ' ', 'patients with the age ', age) as 'common age'
from new_health_data
group by age
order by age desc;


-- NUMBER OF MALE AND FEMALE PATIENTS WITH NO HYPERTENSION, HEART_DISEASE AND A STROKE
select gender, hypertension, heart_disease, stroke, count(*) as number_of_patients
from new_health_data
group by gender, hypertension, heart_disease, stroke
having hypertension = 'no' and heart_disease = 'no' and stroke = 'no'
order by number_of_patients;


-- FULL RECORDS OF PATIENTS WITH NO HYPERTENSION, HEART_DISEASE AND A STROKE
select *
from  new_health_data
where hypertension = 'no' and heart_disease = 'no' and stroke = 'no'
order by age desc;


-- NUMBER OF MALE AND FEMALE PATIENTS WITH HYPERTION, HEART DISEASE AND A STROKE
select gender, hypertension, heart_disease, stroke, count(*) as number_of_patients
from new_health_data
group by gender, hypertension, heart_disease, stroke
having hypertension = 'yes' and heart_disease = 'yes' and stroke = 'yes'
order by number_of_patients;


-- FULL RECORDS OF PATIENTS WITH HYPERTENSION, HEART_DISEASE AND A STROKE
select *
from  new_health_data
where hypertension = 'yes' and heart_disease = 'yes' and stroke = 'yes'
order by age desc;


-- NUMBER OF MALE AND FEMALE PATIENTS WITH HEART DISEASE THAT STILL SMOKES
select gender, count(*) as number_of_patients, heart_disease, smoking_status
from new_health_data
group by gender, smoking_status, heart_disease
having smoking_status = 'smokes' and heart_disease = 'yes'
order by number_of_patients desc;


-- FULL RECORDS OF PATIENTS WITH HEART DISEASE THAT STILL SMOKES
select gender, age, heart_disease, smoking_status, bmi_ranges
from new_health_data
where smoking_status = 'smokes' and heart_disease = 'yes'
order by age desc;



-- CREATING RECORDS FOR THE CHILDREN, TEENAGE AND ADULT PATIENTS
create view teenage_records
as
select *
from new_health_data
where age between 13 and 17;

create view children_records
as 
select *
from new_health_data
where age < 13;

create view Adult_records
as
select *
from new_health_data
where age >= 18;



-- children records health analysis

select * from children_records;

-- TOTAL NUMBER OF CHILDREN
select count(*) as 'Total number of children'
from children_records;

-- DISTINCT COLUMNS
select distinct hypertension, heart_disease, stroke, ever_married
from children_records;

-- TOTAL NUMBER OF MALE AND FEMALE CHILDREN
select gender, count(*) as number_of_children
from children_records
group by gender;

-- THE BMI RANGES OF THE CHILDREN
select bmi_ranges, count(*) as number_of_children
from children_records
group by bmi_ranges
order by number_of_children desc;

-- CHILD OR CHILDREN WITH A HEART DISEASE
select * 
from children_records
where heart_disease = 'yes';

-- THE RESIDENCE TYPE OF THE CHILDREN
select residence_type, count(*) as number_of_children
from children_records
group by residence_type;

-- CHILD OR CHILDREN WITH A STROKE
select * 
from children_records
where stroke = 'yes';

-- SMOKING STATUS OF THE CHILDREN
select smoking_status, count(*) as number_of_children
from children_records
group by smoking_status;

-- SMOKING STATUS OF CHILDREN THAT STILL SMOKES
select * 
from children_records
where smoking_status = 'smokes';

-- NUMBER OF MALE AND FEMALE PATIENTS THAT FORMERLY SMOKED
select gender, smoking_status, count(*) as number_of_children
from children_records
group by gender, smoking_status
having smoking_status = 'formerly smoked';


-- Teenager's records health analysis

select * from teenage_records;

-- THE TOTAL NUMBER OF TEENAGERS
select count(*) as 'Total number of teenagers'
from teenage_records;

-- TOTAL NUMBER OF TEENAGERS GROUPED BY MALE AND FEMALE
select gender, count(*) as number_of_teenagers
from teenage_records
group by gender;

-- DISTINCT COLUMNS
select distinct hypertension, heart_disease, stroke, ever_married
from teenage_records;

-- THE TEENAGER(S) WITH STROKE
select * 
from teenage_records
where stroke = 'yes';

-- THE BMI RANGES OF THE TEENAGERS
select bmi_ranges, count(*) as number_of_teenagers
from teenage_records
group by bmi_ranges
order by number_of_teenagers desc;

-- THE TEENAGERS WITH MORBID OBESITY
select bmi_ranges, gender, count(*) as number_of_teenagers
from teenage_records
group by gender, bmi_ranges
having bmi_ranges = 'morbid obesity';

-- FULL RECORD OF TEENAGERS WITH MORBID OBESITY
select *
from teenage_records
where bmi_ranges = 'morbid obesity'
order by gender desc;

-- THE SMOKING STAUTS OF THE TEENAGERS
select smoking_status, count(*) as number_of_teenagers
from teenage_records
group by smoking_status
order by number_of_teenagers desc;

-- THE TEENAGERS THAT STILL SMOKES
select *
from teenage_records
where smoking_status = 'smokes';



-- Adult records health analysis

select * from adult_records;

-- TOTAL NUMBER OF ADULT
select count(*) as 'Total number of adult'
from adult_records;

-- TOTAL NUMBER OF MALE AND FEMALE ADULT
select gender, count(*) as number_of_adult
from adult_records
group by gender;

-- DISTINCT COLUMNS
select distinct hypertension, heart_disease, stroke, ever_married
from adult_records;

-- THE NUMBER OF MALE AND FEMALE ADULT WITH HYPERTENSION 
select gender, hypertension, count(*) as number_of_adult, 
concat('There are ', count(*), ' ', gender, ' ', 'patients with ', hypertension, ' ', 'hypertension') as 'summary'
from adult_records
group by gender, hypertension
order by number_of_adult;

-- THE NUMBER OF MALE AND FEMALE ADULT WITH A HEART DISEASE
select gender, heart_disease, count(*) as number_of_adult,
concat('There are ', count(*), ' ', gender, ' ', 'patients with a ', heart_disease, ' ', 'to heart disease') as 'summary'
from adult_records
group by gender, heart_disease
order by number_of_adult;

-- THE NUMBER OF MALE AND FEMALE ADULT WITH A STROKE
select gender, stroke, count(*) as number_of_adult,
concat('There are ', count(*), ' ', gender, ' ', 'patients with a ', stroke, ' ', 'to stroke') as 'summary'
from adult_records
group by gender, stroke
order by number_of_adult;

-- MARITAL STATUS OF THE MALE AND FEMALE ADULT PATIENTS
select gender, ever_married, count(*) as number_of_adult,
concat(count(*), ' ', gender, ' ', 'recorded ', ever_married, ' ' , 'as their marital status') as 'summary'
from adult_records
group by gender, ever_married
order by number_of_adult desc;

-- THE WORK TYPE OF THE MALE AND FEMALE ADULT PATIENTS
select work_type, gender, count(*) as number_of_adult
from adult_records
group by gender, work_type
order by work_type;

-- THE BMI OF THE ADULT PATIENTS
select bmi_ranges, count(*) as number_of_patients
from adult_records
group by bmi_ranges
order by number_of_patients desc;

-- THE BMI OF BOTH THE MALE AND FEMALE ADULT PATIENTS
select bmi_ranges, gender, count(*) as number_of_patients
from adult_records
group by gender, bmi_ranges
order by bmi_ranges;

-- THE SMOKING STATUS OF THE ADULT PATIENTS
select smoking_status, count(*) as number_of_adult
from adult_records
group by smoking_status
order by number_of_adult desc;

-- THE SMOKINGS STATUS OF BOTH THE MALE AND FEMALE ADULT PATIENTS
select smoking_status, gender, count(*) as number_of_adult
from adult_records
group by gender, smoking_status
order by smoking_status desc;