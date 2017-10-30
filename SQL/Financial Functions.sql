IF OBJECT_ID('Pmt', 'FN') IS NOT NULL DROP FUNCTION dbo.Pmt  
GO  
CREATE FUNCTION dbo.Pmt (@r NUMERIC(18,8), @nper INT, @pv NUMERIC(18,8), @fv NUMERIC(18,8), @type INT)  
RETURNS NUMERIC(18,8)
AS  
BEGIN  
 DECLARE @pmt NUMERIC(18,8)  
 
 SET @pmt = @r / (Power(1.0 + @r, @nper) - 1.0) * -(@pv * Power(1.0 + @r, @nper) + @fv)  
 
 if @type = 1  
 SET @pmt = @pmt / (1 + @r)  
 RETURN @pmt  
END  
GO  


IF OBJECT_ID('Fv', 'FN') IS NOT NULL DROP FUNCTION dbo.Fv  
GO  
CREATE FUNCTION dbo.Fv (@r NUMERIC(18,8), @nper INT, @c NUMERIC(18,8), @pv NUMERIC(18,8), @type INT)  
RETURNS NUMERIC(18,8)
AS  
BEGIN  
 DECLARE @fv NUMERIC(18,8)  
 
 IF @type = 1  
 SET @c = @c * (1 + @r);  


 SET @fv = -(@c * (Power(1 + @r, @nper) - 1) / @r + @pv  
    * Power(1 + @r, @nper))  
 
 RETURN @fv  
END  
GO  

IF OBJECT_ID('Pv', 'FN') IS NOT NULL DROP FUNCTION dbo.Pv 
GO 
CREATE FUNCTION dbo.[pv] (
   @r NUMERIC(18,8),
   @nper int,
   @pmt NUMERIC(18,8),
   @fv NUMERIC(18,8),
   @type tinyint
) returns NUMERIC(18,8)
as
begin
   declare @pv NUMERIC(18,8);
   
   /* 
   Adjust payment value based on loan type. 
   i.e., account for payment at beginning of period versus end. 
   */
   if (@type = 1) set @pmt = @pmt * (1 + @r);

   /* 
   Solve for present value. 
   */
   set @pv = @fv - @pmt * (1 - power(1 + @r, -@nper)) / @r;
   
   /* Return present value. */
   return @pv;
end

go

IF OBJECT_ID('Ipmt', 'FN') IS NOT NULL DROP FUNCTION dbo.Ipmt  
GO  
CREATE FUNCTION dbo.Ipmt (@r NUMERIC(18,8), @per INT, @nper INT, @pv NUMERIC(18,8), @fv NUMERIC(18,8), @type INT)  
RETURNS NUMERIC(18,8)   
AS  
BEGIN  
 DECLARE @ipmt NUMERIC(18,8)  
 SET @ipmt = dbo.Fv(@r, @per - 1, dbo.Pmt(@r, @nper, @pv, @fv, @type), @pv, @type) * @r  
 
 if @type = 1  
 SET @ipmt = @ipmt / (1 + @r)  
 RETURN @ipmt  
END  
GO  

IF OBJECT_ID('Ppmt', 'FN') IS NOT NULL DROP FUNCTION dbo.Ppmt  
GO  
CREATE FUNCTION dbo.Ppmt (@r NUMERIC(18,8), @per INT, @nper INT, @pv NUMERIC(18,8), @fv NUMERIC(18,8), @type INT)  
RETURNS NUMERIC(18,8)   
AS  
BEGIN  

 RETURN dbo.Pmt(@r, @nper, @pv, @fv, @type) - dbo.Ipmt(@r, @per, @nper, @pv, @fv, @type);  

END  
GO
