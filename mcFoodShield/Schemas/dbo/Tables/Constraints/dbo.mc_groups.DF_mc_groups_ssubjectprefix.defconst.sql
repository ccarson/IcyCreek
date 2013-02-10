ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_ssubjectprefix] DEFAULT (NULL) FOR [ssubjectprefix];

