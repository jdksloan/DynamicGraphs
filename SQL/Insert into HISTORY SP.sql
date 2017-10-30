USE Test_Scenario
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Jethro Sloan>
-- Create date: <28/10/2017>
-- Description:	<Inserts new Data>
-- =============================================
ALTER PROCEDURE Insert_Historic_Data 
	@M_LoanID varchar(MAX)
AS
BEGIN


 DECLARE @PV as numeric (18, 8)
,@FV as float = 0 --Value of the loan at termination
,@Term as float --The term of the loan in years
,@Pay_type as bit = 0 --Identifies the payment as due at the end (0) or the beginning (1) of the period
,@annual_rate as numeric (18, 8) = .07 --The annual rate of interest
,@payment_frequency as float = 12 --The number of payments in a year
,@rate as float
,@nper as float
,@startDate as DATETIME
,@PoolID as varchar(8) = 'TestPool'
,@startMortValue as float
,@NoBorrowers as INT
,@Random INT
,@Upper INT
,@Lower INT
,@DQStatus FLOAT
 


SELECT  @PV = -OriginalPrincipalBalance, @Term = (mas.TermToMaturity/12), @startDate = mas.LoanOriginationDate, @startMortValue = val.OriginalPropertyValue
		,@DQStatus = his.DelinquencyStatus
FROM  dbo.[MASTER] mas 
inner join dbo.HISTORY his on mas.M_LoanID = his.M_LoanID
inner join dbo.HISTORY_RATES hisr on mas.M_LoanID = hisr.M_LoanID
inner join dbo.INCOME inc on mas.M_LoanID = inc.M_LoanID
inner join dbo.MORTGAGE mor on mas.M_LoanID = mor.M_LoanID
inner join dbo.RATES rate on mas.M_LoanID = rate.M_LoanID
inner join dbo.SECURITIZATION sec on mas.M_LoanID = sec.M_LoanID
inner join dbo.VALUATION val on mas.M_LoanID = val.M_LoanID
where mas.M_LoanID = @M_LoanID

	SELECT TOP 1 @annual_rate = (t.CurrentInterestRate / 100)
	FROM dbo.HISTORY_RATES t
	inner join (
		SELECT M_LoanID, max(ReportDate) as MaxDate
		FROM dbo.HISTORY_RATES
		GROUP BY M_LoanID
	) tm ON t.M_LoanID = tm.M_LoanID and t.ReportDate = tm.MaxDate
	WHERE t.M_LoanID = @M_LoanID

	---- This will create a random number between 1 and 999
SET @Lower = 1 ---- The lowest random number
SET @Upper = 4 ---- The highest random number
Set @NoBorrowers = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)
 
Set @rate = @annual_rate/@payment_frequency
Set @nper = @Term * @payment_frequency
select @PV as pv, @Term as term, @annual_rate as annual, @payment_frequency as paymentfreq, @rate as rate, @nper as nper

 
;WITH
Nbrs_3( n ) AS ( SELECT 1 UNION SELECT 0 ),
Nbrs_2( n ) AS ( SELECT 1 FROM Nbrs_3 n1 CROSS JOIN Nbrs_3 n2 ),
Nbrs_1( n ) AS ( SELECT 1 FROM Nbrs_2 n1 CROSS JOIN Nbrs_2 n2 ),
Nbrs_0( n ) AS ( SELECT 1 FROM Nbrs_1 n1 CROSS JOIN Nbrs_1 n2 ),
Nbrs ( n ) AS ( SELECT 1 FROM Nbrs_0 n1 CROSS JOIN Nbrs_0 n2 )
INSERT INTO [dbo].[HISTORY_NEW]
SELECT @PoolID 
,@M_LoanID
,EOMONTH(DATEADD(MONTH ,n , @startDate)) as ReportDate
,CASE n
  WHEN 1 THEN -@PV
  ELSE -dbo.Pv(@rate,@nper - (n -1),dbo.Pmt(@rate,@nper,@PV,@FV,@pay_type),@fV,@pay_type) 
END  AS [Currrent Principal Balance]
, round((-dbo.Pv(@rate,@nper - (n -1),dbo.Pmt(@rate,@nper,@PV,@FV,@pay_type),@fV,@pay_type) /  @startMortValue) * 100,3) as LTV
,n AS LoanAge
,@startMortValue as CurrentPropertyValue
, 0 as Savings 
, round((-dbo.Pv(@rate,@nper - (n -1),dbo.Pmt(@rate,@nper,@PV,@FV,@pay_type),@fV,@pay_type) /  @startMortValue) * 100,3) as IndexedLTV
,@DQStatus as DelinquencyStatus

,CASE n
  WHEN 1 THEN -@PV
  ELSE -dbo.Pv(@rate,@nper - (n -1),dbo.Pmt(@rate,@nper,@PV,@FV,@pay_type),@fV,@pay_type) 
END  AS [BorrowerExposure]

,@NoBorrowers as NoBorrowers
 FROM ( SELECT ROW_NUMBER() OVER (ORDER BY n)
           FROM Nbrs ) D( n )
 WHERE n <= @nper


END
GO


