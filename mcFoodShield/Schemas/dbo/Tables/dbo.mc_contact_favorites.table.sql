CREATE TABLE [dbo].[mc_contact_favorites] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [iUserID]     INT           NOT NULL,
    [iEntityID]   INT           NOT NULL,
    [iEntityType] INT           NOT NULL,
    [dtCreate]    DATETIME2 (0) NOT NULL
);

