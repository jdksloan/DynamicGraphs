
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Jethro Sloan>
-- Create date: <25/10/2017>
-- Description:	<Inserts extra rows>
-- =============================================
ALTER PROCEDURE SaturateMASTER 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
---- This will create a random number between 1 and 999
DECLARE @LowerOPB AS FLOAT = (SELECT MIN([OriginalPrincipalBalance])
 FROM [Test_Scenario].[dbo].[MASTER])
DECLARE @UpperOPB AS FLOAT = (SELECT MAX([OriginalPrincipalBalance])
 FROM [Test_Scenario].[dbo].[MASTER])
DECLARE @RandOriginalPrincipalBalance  AS FLOAT = ROUND(((@UpperOPB - @LowerOPB -1) * RAND() + @LowerOPB), 1)

DECLARE @FromDate DATETIME = DATEADD(DAY, -2, GETDATE())
DECLARE @ToDate   DATETIME = DATEADD(DAY, -1, GETDATE())

DECLARE @Seconds INT = DATEDIFF(SECOND, @FromDate, @ToDate)
DECLARE @Random INT = ROUND(((@Seconds-1) * RAND()), 0)
DECLARE @Milliseconds INT = ROUND((999 * RAND()), 0)

SELECT DATEADD(MILLISECOND, @Milliseconds, DATEADD(SECOND, @Random, @FromDate))


DECLARE @M_LoanID uniqueidentifier = NEWID();  

DECLARE @M_BorrowerID uniqueidentifier = NEWID();  
DECLARE @ClassType as INT = 1;
DECLARE @Sector  VARCHAR(4) = 'MTGE';
SELECT CONVERT(char(255), @M_LoanID) AS 'M_LoanID', CONVERT(char(255), @M_BorrowerID) AS 'M_BorrowerID', @ClassType as 'ClassType', @RandOriginalPrincipalBalance AS 'OriginalPrincipalBalance', @Sector as 'Sector';  

END
GO



