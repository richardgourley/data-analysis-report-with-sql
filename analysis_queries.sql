/* QUARTER 1 ANALYSIS QUESTIONS */

/* 1. How many incidents were reported in the quarter? */
SELECT 
	COUNT(*) 
FROM 
	TestDimDate d
INNER JOIN TestFact f ON d.date = f.incident_date
WHERE 
	d.year = 2022
AND 
	d.quarter = 'Q1';

/* 2. What was the max, min and average downtime in minutes? */

SELECT
	MAX(f.downtime_in_minutes) AS max_downtime,
	MIN(f.downtime_in_minutes) AS min_downtime,
	AVG(f.downtime_in_minutes) AS average_downtime
FROM TestFact f
INNER JOIN TestDimDate d ON f.incident_date = d.date
WHERE 
	d.year = 2022
AND 
	d.quarter = 'Q1';

/* 3. Which day of the week has most incidents? */

SELECT
	d.day_of_week,
	COUNT(*) AS number_of_incidents
FROM 
	TestDimDate d
INNER JOIN TestFact f ON d.date = f.incident_date
WHERE 
	d.year = 2022
AND 
	d.quarter = 'Q1'
GROUP BY 
	d.day_of_week
ORDER BY 
	number_of_incidents DESC;

/* 4. Which month day had the most incidents? */

SELECT
	d.month_day,
	COUNT(*) AS number_of_incidents
FROM 
	TestDimDate d
INNER JOIN TestFact f ON d.date = f.incident_date
WHERE 
	d.year = 2022
AND 
	d.quarter = 'Q1'
GROUP BY 
	d.month_day
ORDER BY 
	number_of_incidents DESC;

/* 5. Which time of day had most incidents? */

SELECT
	t.time_of_day AS time_of_day,
	COUNT(*) AS number_of_incidents
FROM TestDimTime t
LEFT JOIN TestFact f ON t.hour_of_day = f.hour_of_day
INNER JOIN TestDimDate d ON d.date = f.incident_date
WHERE
	d.year = 2022
AND 
	d.quarter = 'Q1'
GROUP BY
	t.time_of_day;

/* 6. Which hour of the day had the most incidents? */

SELECT
	t.hour_of_day AS hour_of_day,
	COUNT(*) AS number_of_incidents
FROM TestDimTime t
INNER JOIN TestFact f ON t.hour_of_day = f.hour_of_day
INNER JOIN TestDimDate d ON d.date = f.incident_date
WHERE
	d.year = 2022
AND 
	d.quarter = 'Q1'
GROUP BY
	t.hour_of_day
ORDER BY
	number_of_incidents DESC;

/* 7. Which month had most incidents? */

SELECT 
	d.month_name,
	COUNT(*) AS number_incidents
FROM 
	TestDimDate d
INNER JOIN TestFact f ON d.date = f.incident_date
WHERE 
	d.year = 2022
AND 
	d.quarter = 'Q1'
GROUP BY 
	d.month_name
ORDER BY
	number_incidents DESC;

/* 8. Which employee has reported the most incidents, and which office are they based in? */

SELECT 
	e.employee_name,
	o.office_name,
	COUNT(*) AS number_incidents
FROM 
	TestDimEmployee e
INNER JOIN TestFact f ON e.employee_surrogate_key = f.employee_surrogate_key
INNER JOIN TestDimOffice o ON f.office_surrogate_key = o.office_surrogate_key
INNER JOIN TestDimDate d ON f.incident_date = d.date
WHERE
	d.year = 2022
AND 
	d.quarter = 'Q1'
GROUP BY
    e.employee_name,
	o.office_name
ORDER BY 
	number_incidents DESC;

/* 9. Which office had reported the most incidents? */

SELECT 
	o.office_name,
	o.office_city,
	COUNT(*) AS number_incidents
FROM 
	TestDimOffice o
INNER JOIN TestFact f ON o.office_surrogate_key = f.office_surrogate_key
INNER JOIN TestDimDate d ON f.incident_date = d.date
WHERE 
	d.year = 2022
AND 
	d.quarter = 'Q1'
GROUP BY 
	o.office_name, 
	o.office_city
ORDER BY
	number_incidents DESC;

/* 10. Which office has the highest average downtime */

SELECT 
	o.office_name,
	o.office_city,
	AVG(f.downtime_in_minutes) AS average_downtime,
	COUNT(*) AS number_incidents
FROM
	TestDimOffice o 
INNER JOIN TestFact f ON o.office_surrogate_key = f.office_surrogate_key
INNER JOIN TestDimDate d ON f.incident_date = d.date
WHERE
	d.year = 2022
AND
	d.quarter = 'Q1'
GROUP BY
	o.office_name,
	o.office_city
ORDER BY
	average_downtime DESC;