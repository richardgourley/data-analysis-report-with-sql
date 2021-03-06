BEGIN TRANSACTION

BEGIN TRY

INSERT INTO TestFact
(incident_date, incident_time, hour_of_day, office_surrogate_key, employee_surrogate_key, downtime_in_minutes)
VALUES
('2022/01/03','08:02','8',1,2,13),
('2022/01/03','08:27','8',1,1,7),
('2022/01/03','09:33','9',2,3,23),
('2022/01/06','08:11','8',1,2,6),
('2022/01/10','08:21','8',1,2,9),
('2022/01/10','08:36','8',2,3,15),
('2022/01/11','11:36','11',1,2,13),
('2022/01/12','03:36','3',2,4,9),
('2022/01/15','03:36','3',2,4,9),
('2022/01/17','08:37','8',1,1,30),
('2022/01/17','10:22','10',1,2,9),
('2022/01/17','16:36','16',2,4,15),
('2022/01/24','08:12','8',1,2,6),
('2022/01/25','11:36','11',1,1,14),
('2022/01/31','07:12','7',1,2,9),
('2022/01/31','08:19','8',1,1,11),
('2022/02/07','08:19','8',1,2,11),
('2022/02/08','08:26','8',2,3,22),
('2022/02/14','08:31','8',1,2,15),
('2022/02/21','09:21','9',1,2,19),
('2022/03/02','11:19','11',1,2,7),
('2022/03/03','08:19','8',1,1,23),
('2022/03/08','06:19','6',2,4,15);

END TRY

BEGIN CATCH

IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION;

END CATCH

IF @@TRANCOUNT > 0
	COMMIT TRANSACTION;
