Declare @loadID as Varchar(MAX) = '02caefd9bc85747f17720ff75c7e8585'

select * from dbo.[MASTER]
where [M_LoanID] = @loadID

select * from dbo.[RATES]
where [M_LoanID] = @loadID


select * from dbo.[HISTORY_RATES]
where [M_LoanID] = @loadID

select * from dbo.[HISTORY]
where [M_LoanID] = @loadID

--select * from dbo.[RATES]
--where (RemainingFixedRateTerm = 0 OR  OriginalFixedRateTerm = 0 or RemainingFixedRateTerm = null OR  OriginalFixedRateTerm = null) and [M_LoanID] = @loadID

--select count([M_LoanId]) as ROWCO
--from dbo.[HISTORY_RATES]

--select [M_LoanId], count([M_LoanId])
--from dbo.[HISTORY]
--group by [M_LoanID]
--order by count([M_loanID]) desc
