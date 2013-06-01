CREATE TABLE [dbo].[c_timezone] (
    [id]          INT           IDENTITY (7, 1) NOT NULL,
    [sTimeZone]   NVARCHAR (20) NOT NULL,
    [iTimeOffset] INT           NOT NULL,
    [bActive]     BIT           NOT NULL
);

