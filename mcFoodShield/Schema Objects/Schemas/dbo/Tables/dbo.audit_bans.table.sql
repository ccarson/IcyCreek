CREATE TABLE [dbo].[audit_bans] (
    [id]       INT           IDENTITY (70, 1) NOT NULL,
    [sBanIP]   NVARCHAR (20) NOT NULL,
    [dBanDate] DATETIME2 (0) NOT NULL,
    [bActive]  BIT           NOT NULL
);

