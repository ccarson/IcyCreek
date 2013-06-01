CREATE TABLE [dbo].[mc_groupmembers] (
    [ID]               INT           IDENTITY (5618, 1) NOT NULL,
    [GroupID]          INT           CONSTRAINT [DF_mc_groupmembers_GroupID] DEFAULT ('0') NULL,
    [ForeignKeyID]     INT           CONSTRAINT [DF_mc_groupmembers_ForeignKeyID] DEFAULT ('0') NULL,
    [Type]             NVARCHAR (50) CONSTRAINT [DF_mc_groupmembers_Type] DEFAULT (N'') NULL,
    [Role]             INT           CONSTRAINT [DF_mc_groupmembers_Role] DEFAULT ('0') NULL,
    [Accepted]         INT           CONSTRAINT [DF_mc_groupmembers_Accepted] DEFAULT ('0') NOT NULL,
    [MemberTypeID]     INT           CONSTRAINT [DF_mc_groupmembers_MemberTypeID] DEFAULT ('0') NOT NULL,
    [externalGroupID]  INT           CONSTRAINT [DF_mc_groupmembers_externalGroupID] DEFAULT ('0') NOT NULL,
    [relatedGroupID]   INT           CONSTRAINT [DF_mc_groupmembers_relatedGroupID] DEFAULT ('0') NOT NULL,
    [Expires]          DATETIME2 (0) CONSTRAINT [DF_mc_groupmembers_Expires] DEFAULT (NULL) NULL,
    [DateAdded]        DATETIME2 (0) CONSTRAINT [DF_mc_groupmembers_DateAdded] DEFAULT (NULL) NULL,
    [groupLevel]       INT           CONSTRAINT [DF_mc_groupmembers_groupLevel] DEFAULT ('0') NOT NULL,
    [RoleExpires]      DATETIME2 (0) CONSTRAINT [DF_mc_groupmembers_RoleExpires] DEFAULT (NULL) NULL,
    [Term_ID]          INT           CONSTRAINT [DF_mc_groupmembers_Term_ID] DEFAULT ('0') NOT NULL,
    [ivisits]          INT           CONSTRAINT [df_mc_groupmembers_ivisits] DEFAULT ((0)) NOT NULL,
    [dtlastaccessdate] DATE          NULL,
    CONSTRAINT [PK_mc_groupmembers] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_mc_groupmembers_ForeignKeyID]
    ON [dbo].[mc_groupmembers]([ForeignKeyID] ASC, [GroupID] ASC, [ID] ASC)
    INCLUDE([Accepted], [DateAdded]);

