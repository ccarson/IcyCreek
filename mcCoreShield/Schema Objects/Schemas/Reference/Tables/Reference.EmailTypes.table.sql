CREATE TABLE [Reference].[EmailTypes] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [EmailTypeID]   INT           NOT NULL,
    [portalName]    NVARCHAR (20) NOT NULL,
    [EmailTypeName] NVARCHAR (50) NOT NULL,
    [isActive]      INT           NOT NULL,
    [displayOrder]  INT           NOT NULL,
    [isExcluded]    BIT           NULL
);

