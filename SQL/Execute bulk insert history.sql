USE [Test_Scenario]
GO
truncate table [dbo].[HISTORY_NEW]
truncate table [dbo].[HISTORY_RAtes_NEW]
DECLARE @M_LoanIDnew as varchar(max)
	
DECLARE c1 CURSOR READ_ONLY
FOR 
SELECT distinct M_LoanID
FROM dbo.[MASTER]

OPEN c1

FETCH NEXT FROM c1
INTO @M_LoanIDNew

WHILE @@FETCH_STATUS = 0
BEGIN

	PRINT @M_LoanIDnew


	EXEC	 [dbo].[Insert_Historic_Data]
		@M_LoanID = @M_LoanIDnew
	FETCH NEXT FROM c1
	INTO @M_LoanIDnew

END

CLOSE c1
DEALLOCATE c1

INSERT INTO [dbo].[HISTORY_RATES_NEW]
	SELECT  M_PoolID, T.M_LoanID, GETDATE(), T.CurrentRateType, t.CurrentInterestRate, T.CurrentDTI,T.CurrentLTFV
	FROM dbo.HISTORY_RATES t
	inner join (
		SELECT M_LoanID, max(ReportDate) as MaxDate
		FROM dbo.HISTORY_RATES
		GROUP BY M_LoanID
	) tm ON t.M_LoanID = tm.M_LoanID and t.ReportDate = tm.MaxDate





