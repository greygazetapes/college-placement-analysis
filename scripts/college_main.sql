-- использовать базу данных
USE collegePlacement;


-- показать все столбцы
SELECT * FROM college;


-- (1) связь уровня интеллекта с трудоустроенностью (max - 158, min - 41  --->  от 40 до 160  --->  )
SELECT 
	CASE
		WHEN iq BETWEEN 40 AND 59 THEN 1
        WHEN iq BETWEEN 60 AND 79 THEN 2
        WHEN iq BETWEEN 80 AND 99 THEN 3
        WHEN iq BETWEEN 100 AND 119 THEN 4
        WHEN iq BETWEEN 120 AND 139 THEN 5
        WHEN iq BETWEEN 140 and 159 THEN 6
	END AS Порядок,
    CASE
		WHEN iq BETWEEN 40 AND 59 THEN '40-59'
        WHEN iq BETWEEN 60 AND 79 THEN '60-79'
        WHEN iq BETWEEN 80 AND 99 THEN '80-99'
        WHEN iq BETWEEN 100 AND 119 THEN '100-119'
        WHEN iq BETWEEN 120 AND 139 THEN '120-139'
        WHEN iq BETWEEN 140 and 159 THEN '140-159'
	END AS Уровень_IQ,
    COUNT(*) as Количество_студентов,
    COUNT(CASE WHEN placement = 'YES' THEN 1 END) AS Трудоустроенные,
    COUNT(CASE WHEN placement = 'NO' THEN 1 END) AS Нетрудоустроенные,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_трудоустроенных,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_нетрудоустроенных,
    CONCAT(ROUND(COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*) * 100, 2) - ROUND(COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*) * 100, 2), '%') 
    AS Разница_в_процентах
FROM college
GROUP BY Порядок, Уровень_IQ
ORDER BY Порядок DESC;


-- (2) связь результатов за прошлый семестр с трудоустроенностью (max - 10. min - 5)
SELECT
	CASE
		WHEN prev_sem_result BETWEEN 5 AND 5.99 THEN 1
        WHEN prev_sem_result BETWEEN 6 AND 6.99 THEN 2
        WHEN prev_sem_result BETWEEN 7 AND 7.99 THEN 3
        WHEN prev_sem_result BETWEEN 8 AND 8.99 THEN 4
        WHEN prev_sem_result BETWEEN 9 AND 9.99 THEN 5
        WHEN prev_sem_result = 10 THEN 6
	END AS Порядок,
	CASE
		WHEN prev_sem_result BETWEEN 5 AND 5.99 THEN  '5'
        WHEN prev_sem_result BETWEEN 6 AND 6.99 THEN '6'
        WHEN prev_sem_result BETWEEN 7 AND 7.99 THEN '7'
        WHEN prev_sem_result BETWEEN 8 AND 8.99 THEN '8'
        WHEN prev_sem_result BETWEEN 9 AND 9.99 THEN '9'
        WHEN prev_sem_result = 10 THEN '10'
	END AS Результаты_за_прошлый_семестр,
    COUNT(*) AS Количество_студентов,
    COUNT(CASE WHEN placement = 'YES' THEN 1 END) AS Трудоустроенные,
    COUNT(CASE WHEN placement = 'NO' THEN 1 END) AS Нетрудоустроенные,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_трудоустроенных,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_нетрудоустроенных,
    CONCAT(ROUND(COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*) * 100, 2) - ROUND(COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*) * 100, 2), '%') 
    AS Разница_в_процентах
FROM college
GROUP BY Порядок, Результаты_за_прошлый_семестр
ORDER BY Порядок DESC;


-- (3) связь CGPA с трудоустроенностью (max = 10.46, min = 4.54)
SELECT
	CASE
		WHEN CGPA between 4 AND 4.99 THEN 1
        WHEN CGPA between 5 AND 5.99 THEN 2
        WHEN CGPA between 6 AND 6.99 THEN 3
        WHEN CGPA between 7 AND 7.99 THEN 4
        WHEN CGPA between 8 AND 8.99 THEN 5
        WHEN CGPA between 9 AND 9.99 THEN 6
        WHEN CGPA between 10 AND 10.99 THEN 7
	END AS Порядок,
	CASE
		WHEN CGPA between 4 AND 4.99 THEN '4-5'
        WHEN CGPA between 5 AND 5.99 THEN '5-6'
        WHEN CGPA between 6 AND 6.99 THEN '6-7'
        WHEN CGPA between 7 AND 7.99 THEN '7-8'
        WHEN CGPA between 8 AND 8.99 THEN '8-9'
        WHEN CGPA between 9 AND 9.99 THEN '9-10'
        WHEN CGPA between 10 AND 10.99 THEN '10-11'
	END AS total_GPA,
    COUNT(*) AS Количество_студентов,
    COUNT(CASE WHEN placement = 'YES' THEN 1 END) AS Трудоустроенные,
    COUNT(CASE WHEN placement = 'NO' THEN 1 END) AS Нетрудоустроенные,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_трудоустроенных,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_нетрудоустроенных,
    CONCAT(ROUND(COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*) * 100, 2) - ROUND(COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*) * 100, 2), '%') 
    AS Разница_в_процентах
FROM college
GROUP BY Порядок, total_GPA
ORDER BY Порядок DESC;


-- (4) связь академической успеваемости с трудоустроенностью (max = 10, min = 1)
SELECT
	CASE
		WHEN academic_performance = 1 THEN 1
        WHEN academic_performance = 2 THEN 2
        WHEN academic_performance = 3 THEN 3
        WHEN academic_performance = 4 THEN 4
        WHEN academic_performance = 5 THEN 5
        WHEN academic_performance = 6 THEN 6
        WHEN academic_performance = 7 THEN 7
        WHEN academic_performance = 8 THEN 8
        WHEN academic_performance = 9 THEN 9
        WHEN academic_performance = 10 THEN 10
	END AS Порядок,
    CASE
		WHEN academic_performance = 1 THEN '1'
        WHEN academic_performance = 2 THEN '2'
        WHEN academic_performance = 3 THEN '3'
        WHEN academic_performance = 4 THEN '4'
        WHEN academic_performance = 5 THEN '5'
        WHEN academic_performance = 6 THEN '6'
        WHEN academic_performance = 7 THEN '7'
        WHEN academic_performance = 8 THEN '8'
        WHEN academic_performance = 9 THEN '9'
        WHEN academic_performance = 10 THEN '10'
	END AS Академ_успеваемость,
    COUNT(*) AS Количество_студентов,
    COUNT(CASE WHEN placement = 'YES' THEN 1 END) AS Трудоустроенные,
    COUNT(CASE WHEN placement = 'NO' THEN 1 END) AS Нетрудоустроенные,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_трудоустроенных,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_нетрудоустроенных,
    CONCAT(ROUND(COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*) * 100, 2) - ROUND(COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*) * 100, 2), '%') 
    AS Разница_в_процентах
FROM college
GROUP BY Порядок, Академ_успеваемость
ORDER BY Порядок DESC;


-- (5) связь опыта стажировки с трудоустроенностью (max = YES, min = NO)
SELECT
	CASE
		WHEN internship_experience = 'YES' THEN 1
        WHEN internship_experience = 'NO' THEN 2
	END AS Порядок,
    CASE
		WHEN internship_experience = 'YES' THEN '+'
        WHEN internship_experience = 'NO' THEN '-'
	END AS Опыт_стажировки,
	COUNT(*) AS Количество_студентов,
    COUNT(CASE WHEN placement = 'YES' THEN 1 END) AS Трудоустроенные,
    COUNT(CASE WHEN placement = 'NO' THEN 1 END) AS Нетрудоустроенные,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_трудоустроенных,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_нетрудоустроенных,
    CONCAT(ROUND(COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*) * 100, 2) - ROUND(COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*) * 100, 2), '%') 
    AS Разница_в_процентах
FROM college
GROUP BY Порядок, Опыт_стажировки
ORDER BY Порядок;

-- (6) связь внеклассной оценки с трудоустроенностью (max = 10, min = 0)
SELECT
	CASE
		WHEN extra_curricular_score = 0 THEN 1
        WHEN extra_curricular_score = 1 THEN 2
        WHEN extra_curricular_score = 2 THEN 3
		WHEN extra_curricular_score = 3 THEN 4
        WHEN extra_curricular_score = 4 THEN 5
        WHEN extra_curricular_score = 5 THEN 6
        WHEN extra_curricular_score = 6 THEN 7
        WHEN extra_curricular_score = 7 THEN 8
        WHEN extra_curricular_score = 8 THEN 9
        WHEN extra_curricular_score = 9 THEN 10
        WHEN extra_curricular_score = 10 THEN 11
	END AS Порядок,
    CASE
		WHEN extra_curricular_score = 0 THEN '0'
        WHEN extra_curricular_score = 1 THEN '1'
        WHEN extra_curricular_score = 2 THEN '2'
		WHEN extra_curricular_score = 3 THEN '3'
        WHEN extra_curricular_score = 4 THEN '4'
        WHEN extra_curricular_score = 5 THEN '5'
        WHEN extra_curricular_score = 6 THEN '6'
        WHEN extra_curricular_score = 7 THEN '7'
        WHEN extra_curricular_score = 8 THEN '8'
        WHEN extra_curricular_score = 9 THEN '9'
        WHEN extra_curricular_score = 10 THEN '10'
	END AS Внеклассная_оценка,
	COUNT(*) AS Количество_студентов,
    COUNT(CASE WHEN placement = 'YES' THEN 1 END) AS Трудоустроенные,
    COUNT(CASE WHEN placement = 'NO' THEN 1 END) AS Нетрудоустроенные,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_трудоустроенных,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_нетрудоустроенных,
    CONCAT(ROUND(COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*) * 100, 2) - ROUND(COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*) * 100, 2), '%') 
    AS Разница_в_процентах
FROM college
GROUP BY Порядок, Внеклассная_оценка
ORDER BY Порядок DESC;

-- (7) связь навыков коммуникации с трудоустроенностью (max = 10, min = 1)
SELECT
	CASE
		WHEN communication_skills = 1 THEN 1
        WHEN communication_skills = 2 THEN 2
		WHEN communication_skills = 3 THEN 3
        WHEN communication_skills = 4 THEN 4
        WHEN communication_skills = 5 THEN 5
        WHEN communication_skills = 6 THEN 6
        WHEN communication_skills = 7 THEN 7
        WHEN communication_skills = 8 THEN 8
        WHEN communication_skills = 9 THEN 9
        WHEN communication_skills = 10 THEN 10
	END AS Порядок,
    CASE
		WHEN communication_skills = 1 THEN '1'
        WHEN communication_skills = 2 THEN '2'
		WHEN communication_skills = 3 THEN '3'
        WHEN communication_skills = 4 THEN '4'
        WHEN communication_skills = 5 THEN '5'
        WHEN communication_skills = 6 THEN '6'
        WHEN communication_skills = 7 THEN '7'
        WHEN communication_skills = 8 THEN '8'
        WHEN communication_skills = 9 THEN '9'
        WHEN communication_skills = 10 THEN '10'
	END AS Навыки_коммуникации,
    COUNT(*) AS Количество_студентов,
    COUNT(CASE WHEN placement = 'YES' THEN 1 END) AS Трудоустроенные,
    COUNT(CASE WHEN placement = 'NO' THEN 1 END) AS Нетрудоустроенные,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_трудоустроенных,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_нетрудоустроенных,
    CONCAT(ROUND(COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*) * 100, 2) - ROUND(COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*) * 100, 2), '%') 
    AS Разница_в_процентах
FROM college
GROUP BY Порядок, Навыки_коммуникации
ORDER BY Порядок DESC;
    
-- (8) связь выполненных проектов с трудоустроенностью (max = 5, min = 0)
SELECT
	CASE
		WHEN projects_completed = 0 THEN 1
        WHEN projects_completed = 1 THEN 2
        WHEN projects_completed = 2 THEN 3
        WHEN projects_completed = 3 THEN 4
        WHEN projects_completed = 4 THEN 5
        WHEN projects_completed = 5 THEN 6
	END AS Порядок,
    CASE
		WHEN projects_completed = 0 THEN '0'
        WHEN projects_completed = 1 THEN '1'
        WHEN projects_completed = 2 THEN '2'
        WHEN projects_completed = 3 THEN '3'
        WHEN projects_completed = 4 THEN '4'
        WHEN projects_completed = 5 THEN '5'
	END AS Количество_проектов,
	COUNT(*) AS Количество_студентов,
    COUNT(CASE WHEN placement = 'YES' THEN 1 END) AS Трудоустроенные,
    COUNT(CASE WHEN placement = 'NO' THEN 1 END) AS Нетрудоустроенные,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_трудоустроенных,
    CONCAT(ROUND((COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*)) * 100, 2), '%') AS Процент_нетрудоустроенных,
    CONCAT(ROUND(COUNT(CASE WHEN placement = 'YES' THEN 1 END)/COUNT(*) * 100, 2) - ROUND(COUNT(CASE WHEN placement = 'NO' THEN 1 END)/COUNT(*) * 100, 2), '%') 
    AS Разница_в_процентах
FROM college
GROUP BY Порядок, Количество_проектов
ORDER BY Порядок DESC;
    
		