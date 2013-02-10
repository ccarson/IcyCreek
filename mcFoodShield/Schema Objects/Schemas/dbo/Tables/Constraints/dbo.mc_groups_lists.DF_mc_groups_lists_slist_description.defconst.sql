ALTER TABLE [dbo].[mc_groups_lists]
    ADD CONSTRAINT [DF_mc_groups_lists_slist_description] DEFAULT (NULL) FOR [slist_description];

