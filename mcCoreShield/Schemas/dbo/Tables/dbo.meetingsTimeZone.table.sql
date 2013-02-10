CREATE TABLE [dbo].[meetingsTimeZone] (
    [id]          INT           IDENTITY (7, 1) NOT NULL,
    [sTimeZone]   NVARCHAR (20) NOT NULL,
    [iTimeOffset] INT           DEFAULT ('0') NOT NULL,
    [bActive]     BIT           DEFAULT ((1)) NOT NULL
);

