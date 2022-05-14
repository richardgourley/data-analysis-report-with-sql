BEGIN TRANSACTION 

BEGIN TRY

INSERT INTO TestDimOffice
(office_name, office_city)
VALUES
('Manhattan', 'New York'),
('Bakerloo', 'London');

END TRY

BEGIN CATCH

IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION;

END CATCH

IF @@TRANCOUNT > 0
	COMMIT TRANSACTION;






