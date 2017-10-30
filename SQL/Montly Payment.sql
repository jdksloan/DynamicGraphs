
declare @LoanID as varchar(MAX) = '02406285283ae6008de585af2cb14234'
declare @InterestRate money, @PeriodRate money, @Balance money
declare @Duration money, @Frequency money, @MonthlyPayment money

set @InterestRate=0.055
set @Frequency=12
set @PeriodRate=@InterestRate/@Frequency
set @Balance = 200000
set @Duration = 30


set @MonthlyPayment = ((@Balance*power(1.0+@PeriodRate,(@Duration*@Frequency)))*@PeriodRate)
/(power(1.0+@PeriodRate,@Duration*@Frequency)-1)

select Balance=@Balance, InterestRate=@InterestRate, MonthlyPayment=@MonthlyPayment

USE [Test_Scenario]
GO


--INSERT INTO [dbo].[HISTORY_NEW]
--     VALUES
--           (<M_PoolID, varchar(45),>
--           ,<M_LoanID, varchar(45),>
--           ,<ReportDate, date,>
--           ,<CurrentPrincipalBalance, float,>
--           ,<CurrentLTV, float,>
--           ,<LoanAge, float,>
--           ,<CurrentPropertyVal, varchar(max),>
--           ,<Savings, float,>
--           ,<CurrentIndexedLTV, float,>
--           ,<DelinquencyStatus, float,>
--           ,<BorrowerExposure, decimal(15,2),>
--           ,<NoBorrowers, int,>)
--GO

