-- создание базы данных
CREATE DATABASE collegePlacement;
USE collegePlacement;

-- создание таблицы 
CREATE TABLE college (
id INT AUTO_INCREMENT PRIMARY KEY, -- уникальный айди студента
college_id VARCHAR(7), -- айди учебного заведения
iq INT, -- айкью студента
prev_sem_result FLOAT, -- оценка за проошлый семестр
CGPA FLOAT, -- GPA за весь период обучения
academic_performance INT, -- академическая успеваемость
internship_experience ENUM('NO', 'YES'), -- опыт стажировки
extra_curricular_score INT, -- внеклассная оценка
communication_skills INT, -- навыки коммуникации
projects_completed INT, -- выполненные проекты
placement ENUM('NO', 'YES') -- трудоустройство
);

-- загрузка данных в таблицу
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/collegePlacement.csv"
INTO TABLE college
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(college_id, iq, prev_sem_result, CGPA, academic_performance, internship_experience, extra_curricular_score, communication_skills, projects_completed, placement);

-- показать таблицу
SELECT * FROM college;

-- удалить таблицу
DROP TABLE college;