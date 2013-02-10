CREATE TABLE [Reference].[PhoneTypes] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [PhoneTypeID]   INT           NOT NULL,
    [portalName]    NVARCHAR (20) NOT NULL,
    [PhoneTypeName] NVARCHAR (50) NOT NULL,
    [isActive]      INT           NOT NULL,
    [displayOrder]  INT           NOT NULL,
    [isExcluded]    BIT           NULL
);

