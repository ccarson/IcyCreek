ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_createdOn] DEFAULT (NULL) FOR [createdOn];

