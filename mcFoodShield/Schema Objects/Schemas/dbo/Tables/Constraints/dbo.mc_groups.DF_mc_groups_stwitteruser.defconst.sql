ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_stwitteruser] DEFAULT (NULL) FOR [stwitteruser];

