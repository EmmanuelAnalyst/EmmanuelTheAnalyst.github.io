create database student_adaptablility_online;

use student_adaptablility_online;

select * from student_levels_online;


#Total nunmber of student from each educational level         
select education_level, count(*) as 'Total number of students', 
concat('A total of ', count(*), ' ', education_level, ' ', 'student') as 'summary'
from student_levels_online
group by education_level;


#Total number of male and female students from each educational level
select education_level, gender, count(*) as 'Number of students',
concat('There are ', count(*), ' ', gender, ' ', education_level, ' ', 'student') as 'summary'
from student_levels_online
group by education_level, gender
order by education_level desc;


#Number of students that went to a private or public institution                  
select institution_type, count(*) as 'Total number of studets', 
concat('A total of ', count(*), ' ', 'students from a ', institution_type, ' ', 'institution') as 'summary'
from student_levels_online
group by institution_type;


#Number of male and female students that attended a public or private instituition
select institution_type, gender, count(*) as 'Number of student', 
concat('A total of ', count(*), ' ', gender, ' ', 'students from the ', institution_type, ' ', 'institution') as 'summary'
from student_levels_online
group by institution_type, gender
order by institution_type desc;


#Distinct age of all students
select distinct age #27, 23, 18, 11, 10, 9
from student_levels_online
-- where gender = 'male'
order by age desc;


#Age range of students from each education_level
# UNIVERSITY age range is between 18 and 27
select student_id, education_level, gender, age 
from student_levels_online
where education_level = 'university'
order by age desc;

# COLLEGE age range is betweeen 18 and 23
select student_id, education_level, gender, age 
from student_levels_online
where education_level = 'college'
order by age desc;

# SCHOOL age range is betweeen 9 and 18
select student_id, education_level, gender, age 
from student_levels_online
where education_level = 'school'
order by age desc; 


#The total number of devices used by the students
select device, count(*) as 'Total number of students',
concat('A total of ', count(*), ' ', 'student use the ', device, ' ', 'device') as 'summary'
from student_levels_online
group by device;


#The total number of devices used by students from each educational_level
select education_level, device, count(*) as 'Number of student',
concat(count(*), ' ', education_level, ' ', 'students used a ', device, ' ', 'device') as 'summary'
from student_levels_online
group by device, education_level
order by education_level desc;


#The total number of devices used by students from each institution
select institution_type, device, count(*) as 'Number of student',
concat(count(*), ' ', 'students from ', institution_type, ' ', 'institution ', 'used a ', device, ' ', 'device') as 'summary'
from student_levels_online
group by device, institution_type
order by institution_type desc;


#Total number of students that said YES or NO to doing their ITs 
select IT_student, count(*) as 'Number of students', 
concat(count(*), ' ', 'student said ', IT_student, ' ', 'to doing their industrial training') as 'summary'
from student_levels_online
group by it_student
order by it_student desc;


#Total number of students from each educational level that said YES or NO to doing their ITs
select education_level, IT_student, count(*) as 'Number of students',
concat(count(*), ' ', education_level, ' ', 'students said ', IT_student, ' ', 'to doing their industrial training') as 'summary'
from student_levels_online
group by education_level, IT_student
order by education_level desc;


#Total number of students from each institution that said YES or NO to doing their ITs
select institution_type, IT_student, count(*) as 'Number of student',
concat(count(*), ' ', 'student from ', institution_type, ' ', 'institution said ', IT_student, ' ', 'to doing their industrial training') as 'summary'
from student_levels_online
group by institution_type, IT_student
order by institution_type desc;


#Number of student from each educational level that attended a private or public institution
select education_level, institution_type, count(*) as 'Number of students',
concat(count(*), ' ', 'students attended a ', institution_type, ' ', education_level) as 'summary'
from student_levels_online
group by education_level, institution_type
order by education_level desc;


#Number of student from each location
select location, count(*) as 'Number of student', 
concat('A total of ', count(*), ' ', 'students from the ', location, ' ', 'area') as 'summary'
from student_levels_online
group by location;


#Number of student from each educational level and their location
select education_level, location, count(*) as 'Number of student', 
concat(count(*), ' ', 'student attended the ', education_level, ' ', 'located at the ', location, ' ', 'area') as 'summary'
from student_levels_online
group by education_level, location
order by education_level desc;


#Number of students from each institution and their location
select institution_type, location, count(*) as 'Number of student',
concat(count(*), ' ', 'students attended ', institution_type, ' ', 'institution located at ', location, ' ', 'area') as 'summary'
from student_levels_online
group by institution_type, location
order by institution_type desc;


#The financial condition of students from each education_level
select education_level, financial_condition, count(*) as 'Number of students',
concat(count(*), ' ', financial_condition, ' ', 'student attended ', education_level) as 'summary'
from student_levels_online
group by education_level, financial_condition
order by education_level desc;


#The financial condition of students from each institution
select institution_type, financial_condition, count(*) as 'Number of students',
concat(count(*), ' ', financial_condition, ' ', 'student attended a ', institution_type, ' ', 'institution') as 'summary'
from student_levels_online
group by institution_type, financial_condition
order by institution_type;


#The students educational level and the kind of internet they use
select education_level, internet_type, count(*) as 'Number of students',
concat(count(*), ' ', education_level, ' ', 'students used ', internet_type) as 'summary'
from student_levels_online
group by education_level, internet_type
order by education_level desc;


#The flexibility of students from each education level
select education_level, flexibility_level, count(*) as 'Number of students', 
concat(count(*), ' ', education_level, ' ', 'student on a ', flexibility_level, ' ', 'flexibility level') as 'summary'
from student_levels_online
group by education_level, flexibility_level
order by education_level desc;


#The gender and their flexing ability
select gender, flexibility_level, count(*) as 'Number of student', 
concat(count(*), ' ', gender, ' ', 'student on a ', flexibility_level, ' ', 'flexibility level') as 'summary'
from student_levels_online
group by gender, flexibility_level
order by gender desc;


#The network type of students from each educational level
select education_level, network_type, count(*) as 'Number of students', 
concat(count(*), ' ', education_level, ' ', 'student use ', network_type, ' ', 'network') as 'summary'
from student_levels_online
group by education_level, network_type
order by education_level desc;