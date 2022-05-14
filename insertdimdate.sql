BEGIN TRANSACTION 

BEGIN TRY

DECLARE @StartDate DATE = '2022/01/01';
/* Retrieve exact end of month date - 3 months later */
DECLARE @EndDate DATE = DATEADD(DAY, -1, DATEADD(MONTH, 3, @StartDate));

/* Recursive sequence returning number of days between 1st Jan and 2 months later...*/
;WITH seq(n) AS 
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, @StartDate, @EndDate)
)
/* Second sequence adds 1 day to @StartDate and returns a date for the number of times in 'seq'  ...*/
,
dates(d) AS 
(
  SELECT DATEADD(DAY, n, @StartDate) FROM seq
)
/* Third sequence takes every date 'd' and returns date conversions inside 'date_fields'... */
,
date_fields AS 
(
SELECT 
	CONVERT(DATE, d) AS initial_date,
	DATENAME(WEEKDAY, d) AS day_of_week,
	DATEPART(DAY, d) AS month_day,
	FORMAT(d, 'MMMM') AS month_name,
	DATEPART(YEAR, d) AS year,
	'Q' + CONVERT(varchar, DATEPART(QUARTER, d)) AS quarter
FROM dates
)
/* Take every element of 'date_fields' and insert into 'DimDate' table ... */

INSERT INTO TestDimDate
SELECT * FROM date_fields;

END TRY

BEGIN CATCH

IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION;

END CATCH

IF @@TRANCOUNT > 0
	COMMIT TRANSACTION;






