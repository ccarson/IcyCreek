CREATE TABLE [dbo].[meetings_responses] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [sResponse]    NVARCHAR (50) NOT NULL,
    [bActive]      BIT           NOT NULL,
    [displayOrder] INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

