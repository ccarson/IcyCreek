CREATE TABLE [dbo].[pt_client_rates] (
    [rateID]   NCHAR (35)     NOT NULL,
    [clientID] NCHAR (35)     NULL,
    [category] NVARCHAR (150) NULL,
    [rate]     DECIMAL (6, 2) NULL
);

