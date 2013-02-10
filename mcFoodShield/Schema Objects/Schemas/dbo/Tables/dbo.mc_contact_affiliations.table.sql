CREATE TABLE [dbo].[mc_contact_affiliations] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [user_id]        INT           NOT NULL,
    [affiliation_id] INT           NOT NULL,
    [bActive]        BIT           NOT NULL,
    [dateCreated]    DATETIME2 (7) NOT NULL,
    [iCreatedBy]     INT           NOT NULL,
    [bDefault]       BIT           NOT NULL
);

