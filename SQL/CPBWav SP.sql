USE [Test_Scenario]
GO
/****** Object:  StoredProcedure [dbo].[Get_CPB_Vs_OPB]    Script Date: 30/10/2017 06:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Jethro Sloan>
-- Create date: <28/10/2017>
-- Description:	<Gets the total CPB vs OPB>
-- =============================================
ALTER PROCEDURE [dbo].[Get_CPB_Vs_OPB]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @totalOPB as FLOAT;
	DECLARE @myDateTime DATETIME
	SET @myDateTime = LEFT(CONVERT(VARCHAR, EOMONTH(GETDATE()), 120), 10);
	declare @totalCPB as FLOAT;
	SELECT @totalOPB =SUM(OriginalPrincipalBalance)  
	FROM dbo.[MASTER]


	select @totalCPB= sum( t.CurrentPrincipalBalance)
	from dbo.HISTORY_NEW t
	 where ReportDate = @myDateTime

	select @totalOPB as OPB, @totalCPB as CPB, (@totalCPB/@totalOPB) * 100 as WAV
END
