declare @LoanID as varchar(MAX) = 'ff042efb6813cfebdbac8f4ad469077c'
SELECT OriginalPrincipalBalance, CurrentPrincipalBalance,  (OriginalPrincipalBalance - CurrentPrincipalBalance)  as MonthlyRepayment 
FROM dbo.[MASTER] mas
inner join dbo.HISTORY his on mas.M_LoanID = his.M_LoanID
where mas.M_LoanID = @LoanID

declare @totalOPB as FLOAT;
declare @totalCPB as FLOAT;
SELECT  @totalOPB =SUM(OriginalPrincipalBalance) , @totalCPB =SUM(CurrentPrincipalBalance)
FROM dbo.[MASTER] mas
inner join dbo.HISTORY his on mas.M_LoanID = his.M_LoanID

select @totalOPB as OPB, @totalCPB as CPB, (@totalCPB/@totalOPB) * 100 as WAV


select count(m_loanID)
from dbo.HISTORY_RATES

where ReportDate = '2011-12-31'