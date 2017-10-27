USE [Test_Scenario]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SaturateMASTER]

SELECT	'Return Value' = @return_value

GO

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct TOP 1000 *
  FROM [Test_Scenario].[dbo].[HISTORY_RATES]

  SELECT distinct TOP 1000 *
  FROM [Test_Scenario].[dbo].[HISTORY]