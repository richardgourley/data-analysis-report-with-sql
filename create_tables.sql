BEGIN TRANSACTION

BEGIN TRY

CREATE TABLE TestDimDate(
date DATE PRIMARY KEY NOT NULL,
day_of_week VARCHAR(10) NOT NULL,
month_day CHAR(2) NOT NULL,
month_name VARCHAR(10) NOT NULL,
year SMALLINT NOT NULL,
quarter CHAR(2) NOT NULL
);

CREATE TABLE TestDimTime(
hour_of_day CHAR(2) PRIMARY KEY NOT NULL,
time_of_day VARCHAR(15) NOT NULL
);

CREATE TABLE TestDimOffice(
office_surrogate_key INT PRIMARY KEY IDENTITY,
office_name VARCHAR(100) NOT NULL,
office_city VARCHAR(100) NOT NULL
);

CREATE TABLE TestDimEmployee(
employee_surrogate_key INT PRIMARY KEY IDENTITY,
employee_name VARCHAR(100) NOT NULL
);

CREATE TABLE TestFact(
incident_number INT PRIMARY KEY IDENTITY,
incident_date DATE NOT NULL,
incident_time TIME NOT NULL,
hour_of_day CHAR(2) NOT NULL,
office_surrogate_key INT NOT NULL,
employee_surrogate_key INT NOT NULL,
downtime_in_minutes SMALLINT NOT NULL,

CONSTRAINT fk_date
FOREIGN KEY (incident_date) REFERENCES TestDimDate(date),

CONSTRAINT fk_hour_of_day
FOREIGN KEY (hour_of_day) REFERENCES TestDimTime(hour_of_day),

CONSTRAINT fk_office_surrogate_key
FOREIGN KEY (office_surrogate_key) REFERENCES TestDimOffice(office_surrogate_key),

CONSTRAINT fk_employee_surrogate_key
FOREIGN KEY (employee_surrogate_key) REFERENCES TestDimEmployee(employee_surrogate_key)
);

END TRY

BEGIN CATCH

IF @@TRANCOUNT > 0 
	ROLLBACK TRANSACTION;

END CATCH

IF @@TRANCOUNT > 0
	COMMIT TRANSACTION;
