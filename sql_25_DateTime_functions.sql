--DateTime Functions
--time:				hh:mm:ss[.nnn]
--date:				YYYY-MM-DD
--datetime:			YYYY-MM-DD hh:mm:ss[.nnn]
--datetime2:		YYYY-MM-DD hh:mm:ss[.nnnnnn]
--datetimeoffset:	YYYY-MM-DD hh:mm:ss[.nnnnnn][+\-]hh:mm		Origin in in UTC timezone. The function is to calculate timezone

/*
UTC stands for Coordinated Universal Time, Usually synonymous with GMT but there is '冬夏令时间，UTC等于冬令时GMT'

*/

SELECT GETDATE()				--Get current datetime
SELECT CURRENT_TIMESTAMP		--Get current time
SELECT SYSDATETIME()			--Get current datetime2
SELECT SYSDATETIMEOFFSET()		--Get difference from UTC time
SELECT GETUTCDATE()				--Get UTC time in datetime precision
SELECT SYSUTCDATETIME()			--Get System UTC time in datetime2 precision