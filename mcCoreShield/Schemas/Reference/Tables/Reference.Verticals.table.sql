CREATE TABLE [Reference].[Verticals] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [VerticalID]   INT           NULL,
    [portalName]   NVARCHAR (20) NOT NULL,
    [VerticalName] NVARCHAR (50) NOT NULL,
    [isActive]     INT           NOT NULL,
    [noEdit]       BIT           NOT NULL,
    [isExcluded]   BIT           NOT NULL
);

