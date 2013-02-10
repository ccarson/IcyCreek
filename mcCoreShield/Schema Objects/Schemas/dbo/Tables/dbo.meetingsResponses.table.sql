CREATE TABLE [dbo].[meetingsResponses] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [sResponse]    NVARCHAR (50) NOT NULL,
    [bActive]      BIT           DEFAULT ((1)) NOT NULL,
    [displayOrder] INT           NULL
);

