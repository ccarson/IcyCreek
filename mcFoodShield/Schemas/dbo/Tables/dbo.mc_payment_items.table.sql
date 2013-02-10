CREATE TABLE [dbo].[mc_payment_items] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [itemname] NVARCHAR (25) NOT NULL,
    [active]   BIT           NOT NULL,
    [amount]   INT           NOT NULL
);

