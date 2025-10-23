-- использовать базу данных
USE collegePlacement;


-- показать все столбцы
SELECT * FROM college;



-- (первый столбец - iq)
	-- отобразить максимальное значение iq
SELECT MAX(iq) 
	AS max_iq
FROM college;

	-- отобразить минимальное значение iq
SELECT MIN(iq) 
	AS min_iq
FROM college;



-- (второй столбец - prev_sem_result)
	-- отобразить максимальное значение prev_sem_result
SELECT MAX(prev_sem_result)
	AS max_prev_sem_result
FROM college;

	-- отобразить минимальное значение prev_sem_result
SELECT MIN(prev_sem_result)
	AS min_prev_sem_result
FROM college;


-- (третий столбец - CGPA)
	-- отобразить максимальное значение CGPA
SELECT MAX(CGPA)
	AS 	max_CGPA
FROM college;

	-- отобразить минимальное значение CGPA
SELECT MIN(CGPA)
	AS 	min_CGPA
FROM college;



-- (четвертый столбец - academic_performance)
	-- отобразить максимальное значение academic_performance
SELECT MAX(academic_performance)
	AS 	max_academic_performance
FROM college;

	-- отобразить минимальное значение academic_performance
SELECT MIN(academic_performance)
	AS 	min_academic_performance
FROM college;



-- (пятый столбец internship_experience - только значения 'NO' и 'YES')



-- (шестой столбец - extra_curricular_score)
	-- отобразить максимальное значение extra_curricular_score
SELECT MAX(extra_curricular_score)
	AS 	max_extra_curricular_score
FROM college;

	-- отобразить минимальное значение extra_curricular_score
SELECT MIN(extra_curricular_score)
	AS 	min_extra_curricular_score
FROM college;



-- (седьмой столбец - communication_skills)
	-- отобразить максимальное значение communication_skills
SELECT MAX(communication_skills)
	AS 	max_communication_skills
FROM college;

	-- отобразить минимальное значение communication_skills
SELECT MIN(communication_skills)
	AS 	min_communication_skills
FROM college;



-- (восьмой столбец - projects_completed)
	-- отобразить максимальное значение projects_completed
SELECT MAX(projects_completed)
	AS 	max_projects_completed
FROM college;

	-- отобразить минимальное значение projects_completed
SELECT MIN(projects_completed)
	AS 	min_projects_completed
FROM college;



-- (девятый столбец placement - только значения 'NO' и 'YES')