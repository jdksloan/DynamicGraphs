DECLARE @PV as NUMERIC(18,8) = -1000000 --Loan Amount
,@FV as NUMERIC(18,8) = 0 --Value of the loan at termination
,@Term as float = 30 --The term of the loan in years
,@Pay_type as bit = 1 --Identifies the payment as due at the end (0) or the beginning (1) of the period
,@annual_rate as float = .07 --The annual rate of interest
,@payment_frequency as float = 12 --The number of payments in a year
,@rate as numeric(18,8)
,@nper as float
 
Set @rate = @annual_rate/@payment_frequency
Set @nper = @Term * @payment_frequency
select @PV as pv, @term as term, @annual_rate as annual, @payment_frequency as paymentfreq, @rate as rate, @nper as nper

  
;WITH
Nbrs_3( n ) AS ( SELECT 1 UNION SELECT 0 ),
Nbrs_2( n ) AS ( SELECT 1 FROM Nbrs_3 n1 CROSS JOIN Nbrs_3 n2 ),
Nbrs_1( n ) AS ( SELECT 1 FROM Nbrs_2 n1 CROSS JOIN Nbrs_2 n2 ),
Nbrs_0( n ) AS ( SELECT 1 FROM Nbrs_1 n1 CROSS JOIN Nbrs_1 n2 ),
Nbrs ( n ) AS ( SELECT 1 FROM Nbrs_0 n1 CROSS JOIN Nbrs_0 n2 )
SELECT n as [Period]
,CASE n
  WHEN 1 THEN @PV
  ELSE -dbo.Pv(@rate,@nper - (n -1),dbo.Pmt(@rate,@nper,@PV,@FV,@pay_type),@fV,@pay_type) 
END  AS [Starting Balance]
,dbo.Pmt(@rate,@nper,@PV,@FV,@pay_type) as [Payment]
,dbo.Ipmt(@rate,n,@nper,@PV,@FV,@pay_type) as [Interest Payment]
,dbo.Ppmt(@rate,n,@nper,@PV,@FV,@pay_type) as [Principal Payment]
,-dbo.Pv(@rate,@nper-n,dbo.Pmt(@rate,@nper,@PV,@FV,@pay_type),@fV,@pay_type) as [Ending Balance]
 FROM ( SELECT ROW_NUMBER() OVER (ORDER BY n)
           FROM Nbrs ) D( n )
 WHERE n <= @nper




