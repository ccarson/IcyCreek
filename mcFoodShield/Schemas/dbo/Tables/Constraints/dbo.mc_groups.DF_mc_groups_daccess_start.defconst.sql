ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_daccess_start] DEFAULT (NULL) FOR [daccess_start];

