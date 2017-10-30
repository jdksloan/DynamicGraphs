select * from dbo.[MASTER] mas 
inner join dbo.HISTORY his on mas.M_LoanID = his.M_LoanID
inner join dbo.HISTORY_RATES hisr on mas.M_LoanID = hisr.M_LoanID
inner join dbo.INCOME inc on mas.M_LoanID = inc.M_LoanID
inner join dbo.MORTGAGE mor on mas.M_LoanID = mor.M_LoanID
inner join dbo.RATES rate on mas.M_LoanID = rate.M_LoanID
inner join dbo.SECURITIZATION sec on mas.M_LoanID = sec.M_LoanID
inner join dbo.VALUATION val on mas.M_LoanID = val.M_LoanID


declare @LoanID as varchar(MAX) = '02406285283ae6008de585af2cb14234'
select * from dbo.[MASTER] where M_LoanID = @LoanID
select * from dbo.HISTORY where M_LoanID = @LoanID
select * from dbo.HISTORY_RATES where M_LoanID = @LoanID
select * from dbo.INCOME where M_LoanID = @LoanID
select * from dbo.MORTGAGE where M_LoanID = @LoanID
select * from dbo.RATES where M_LoanID = @LoanID
select * from dbo.SECURITIZATION where M_LoanID = @LoanID
select * from dbo.VALUATION where M_LoanID = @LoanID


select * from dbo.HISTORY val
where val.BorrowerExposure = val.CurrentPrincipalBalance

--select top 1 * into dbo.[History_NEW]
--FROM dbo.[HISTORY]
--where currentratetype = 'fixed'


