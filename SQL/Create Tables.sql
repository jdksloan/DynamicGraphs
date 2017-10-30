USE [Test_Scenario]
GO

/****** Object:  Table [dbo].[HISTORY_NEW]    Script Date: 30/10/2017 06:54:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HISTORY_NEW](
	[M_PoolID] [varchar](45) NOT NULL,
	[M_LoanID] [varchar](45) NOT NULL,
	[ReportDate] [date] NOT NULL,
	[CurrentPrincipalBalance] [float] NULL,
	[CurrentLTV] [float] NULL,
	[LoanAge] [float] NULL,
	[CurrentPropertyVal] [varchar](max) NULL,
	[Savings] [float] NULL,
	[CurrentIndexedLTV] [float] NULL,
	[DelinquencyStatus] [float] NULL,
	[BorrowerExposure] [decimal](15, 2) NULL,
	[NoBorrowers] [int] NULL,
 CONSTRAINT [PK_HISTORY_NEW] PRIMARY KEY CLUSTERED 
(
	[M_LoanID] ASC,
	[ReportDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

USE [Test_Scenario]
GO

/****** Object:  Table [dbo].[HISTORY_RATES_NEW]    Script Date: 30/10/2017 06:54:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HISTORY_RATES_NEW](
	[M_PoolID] [varchar](45) NOT NULL,
	[M_LoanID] [varchar](45) NOT NULL,
	[ReportDate] [date] NOT NULL,
	[CurrentRateType] [nvarchar](200) NOT NULL,
	[CurrentInterestRate] [float] NULL,
	[CurrentDTI] [float] NULL,
	[CurrentLTFV] [float] NULL,
 CONSTRAINT [PK_HISTORY_RATES_NEW] PRIMARY KEY CLUSTERED 
(
	[M_LoanID] ASC,
	[ReportDate] ASC,
	[CurrentRateType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[HISTORY_RATES_NEW]  WITH CHECK ADD  CONSTRAINT [FK_HISTORY_RATES_NEW_RATES] FOREIGN KEY([M_LoanID])
REFERENCES [dbo].[RATES] ([M_LoanID])
GO

ALTER TABLE [dbo].[HISTORY_RATES_NEW] CHECK CONSTRAINT [FK_HISTORY_RATES_NEW_RATES]
GO



