CREATE TABLE [dbo].[mc_groupmembers] (
    [ID]               INT           IDENTITY (5618, 1) NOT NULL,
    [GroupID]          INT           NULL,
    [ForeignKeyID]     INT           NULL,
    [Type]             NVARCHAR (50) NULL,
    [Role]             INT           NULL,
    [Accepted]         INT           NOT NULL,
    [MemberTypeID]     INT           NOT NULL,
    [externalGroupID]  INT           NOT NULL,
    [relatedGroupID]   INT           NOT NULL,
    [Expires]          DATETIME2 (0) NULL,
    [DateAdded]        DATETIME2 (0) NULL,
    [groupLevel]       INT           NOT NULL,
    [RoleExpires]      DATETIME2 (0) NULL,
    [Term_ID]          INT           NOT NULL,
    [ivisits]          INT           NOT NULL,
    [dtlastaccessdate] DATE          NULL
);

