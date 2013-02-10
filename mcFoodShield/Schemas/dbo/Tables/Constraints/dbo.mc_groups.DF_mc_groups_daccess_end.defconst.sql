ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_daccess_end] DEFAULT (NULL) FOR [daccess_end];

