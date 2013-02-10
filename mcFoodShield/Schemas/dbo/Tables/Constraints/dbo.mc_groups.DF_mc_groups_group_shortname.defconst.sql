ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_group_shortname] DEFAULT (NULL) FOR [group_shortname];

