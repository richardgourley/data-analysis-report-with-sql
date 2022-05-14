BEGIN TRANSACTION 

BEGIN TRY

INSERT INTO TestDimTime
(hour_of_day, time_of_day)
VALUES
(0, 'night'),
(1, 'night'),
(2, 'night'),
(3, 'night'),
(4, 'night'),
(5, 'night'),
(6, 'morning'),
(7, 'morning'),
(8, 'morning'),
(9, 'morning'),
(10, 'morning'),
(11, 'morning'),
(12, 'morning'),
(13, 'afternoon'),
(14, 'afternoon'),
(15, 'afternoon'),
(16, 'afternoon'),
(17, 'afternoon'),
(18, 'afternoon'),
(19, 'evening'),
(20, 'evening'),
(21, 'evening'),
(22, 'night'),
(23, 'night');

END TRY

BEGIN CATCH

IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION

END CATCH

IF @@TRANCOUNT > 0
	COMMIT TRANSACTION





