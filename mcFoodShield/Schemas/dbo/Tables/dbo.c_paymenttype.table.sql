CREATE TABLE [dbo].[c_paymenttype] (
    [id]       INT           IDENTITY (7, 1) NOT NULL,
    [typename] NVARCHAR (25) NOT NULL,
    [active]   BIT           NOT NULL
);

