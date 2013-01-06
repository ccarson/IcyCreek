ALTER TABLE [dbo].[mc_groups_tags]
    ADD CONSTRAINT [DF_mc_groups_tags_datecreated] DEFAULT (NULL) FOR [datecreated];

