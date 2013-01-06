ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_stwitterpass] DEFAULT (NULL) FOR [stwitterpass];

