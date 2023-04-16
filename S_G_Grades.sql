create database students_gamification_grades;

use students_gamification_grades;

select * from students_gamification_grades; 

-- Total Number of Students
select count(*) as total_number_of_students
from students_gamification_grades;


-- Number of students that did not take the practice exam before using the gamified app
select count(*) as students,
concat('A total of ', count(*), ' ', 'students did not take the exam before using the gamified app') 'summary'
from students_gamification_grades
where practice_exam = 0;


-- Number of students that took the first exam before using the gamified app
select count(*) as students,
concat('A total of ', count(*), ' ', 'students took the exam before using the gamified app') 'summary'
from students_gamification_grades
where practice_exam > 0;


-- Number of students that took the final exam after using the gamified app
select count(final_exam) as number_of_students,
concat('A total of ', count(*), ' ', 'students took the exam after using the gamified app') 'summary'
from students_gamification_grades;



-- Lets Analyze the grades of the student and see if the platform (using gamified app) improved the performance of the students or not


-- first lets look at the students that had an improved perfomance(grade) after using the gamified app 
select count(*) as number_of_improved_students, 
concat('A total of ', count(*), ' ', 'students saw improvement in their grades after using the gamified app') 'summary', 
round(33/69 * 100, 2) as percentage
from students_gamification_grades
where user = "Yes" and final_exam > practice_exam;     -- 47.83% of improved performance from students who used the gamified app

-- This shows the data of the 33 students who had improved grade after using the gamified app
select row_number() over () as row_num, practice_exam, user, final_exam
from students_gamification_grades
where user = "Yes" and final_exam > practice_exam;



-- Lets also look at the student that had improved grades without using the gamified app
select count(*) as number_of_improved_students, 
concat('A total of ', count(*), ' ', 'students saw improvement in their grades without using the app') 'summary', 
round(19/69 * 100, 2) as percentage
from students_gamification_grades
where user = "No" and final_exam > practice_exam;     -- 27.54% of improved performance from student who didn't used the gamified app


-- This shows the data of the 19 students who had improved grades without using the gamified app
select row_number() over () as row_num, practice_exam, user, final_exam
from students_gamification_grades
where user = "No" and final_exam > practice_exam;



-- Now lets look at the students that had no improved perfomance(grade) after using the gamified app
select count(*) as number_of_declined_students, 
concat('A total of ', count(*), ' ', 'students saw no improvement in their grades after using the app') 'summary', 
round(11/69 * 100, 2) as percentage
from students_gamification_grades
where user = "Yes" and practice_exam >= final_exam;     -- 15.94% of declined performance from students who used the gamified app


-- This shows the data of the 11 students who had no improved grade after using the gamified app
select row_number() over () as row_num, practice_exam, user, final_exam
from students_gamification_grades
where user = "Yes" and practice_exam >= final_exam;



-- Let's look at students who did not show any improvement without the gamified app.
select count(*) as number_of_declined_students, 
concat('A total of ', count(*), ' ', 'students saw no improvement in their grades after using the app') 'summary', 
round(6/69 * 100, 2) as percentage
from students_gamification_grades
where user = "No" and practice_exam >= final_exam;     -- 8.70% of declined performance from students who didn't use the gamified app


-- This shows the data of the 6 students who did not show any improvement wihout the gamified app
select row_number() over () as row_num, practice_exam, user, final_exam
from students_gamification_grades
where user = "No" and practice_exam >= final_exam;



