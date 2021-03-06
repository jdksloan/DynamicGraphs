use Test_Scenario

SELECT * FROM [dbo].[HISTORY] t1
 right JOIN [HISTORY_RATES] t2 ON t2.M_LoanID = t1.M_LoanID
WHERE t1.M_LoanID = t2.M_LoanID AND T1.ReportDate = T2.ReportDate
--each rate has two types and each type has a history

SELECT *
FROM [HISTORY]
WHERE M_LoanID = '7c6f9bb459d2945d8e9d12bd0e6cbe41'

--Left
select * from [dbo].[HISTORY] a 
left outer join dbo.[MASTER] b on a.M_LoanID = b.M_LoanID
where b.M_LoanID is null

--Exist in History but not History Rate
--7c6f9bb459d2945d8e9d12bd0e6cbe41
--7fa8282ad93047a4d6fe6111c93b308a

select * from [dbo].[HISTORY_RATES] a 
left outer join dbo.[HISTORY] b on a.M_LoanID = b.M_LoanID
where b.M_LoanID is null

--Exist in History Rate but not History
--64f7d8bea64233104b757faed38a567c
--fa203d2371427700cabbd90fd12d4a47

--All missing values
SELECT *, (CurrentPrincipalBalance + Savings) as 'Combined'
FROM [HISTORY]
WHERE M_LoanID = '7c6f9bb459d2945d8e9d12bd0e6cbe41' OR M_LoanID = '7fa8282ad93047a4d6fe6111c93b308a'


SELECT *
FROM [HISTORY_RATES]
WHERE M_LoanID = '64f7d8bea64233104b757faed38a567c' OR M_LoanID = 'fa203d2371427700cabbd90fd12d4a47'





