BEGIN TRANSACTION 

BEGIN TRY

INSERT INTO TestDimEmployee
(employee_name)
VALUES
('Jenny Smith'),
('Paul Bradley'),
('David Wilson'),
('Sarah Jones');

END TRY

BEGIN CATCH

IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION;

END CATCH

IF @@TRANCOUNT > 0
	COMMIT TRANSACTION;






