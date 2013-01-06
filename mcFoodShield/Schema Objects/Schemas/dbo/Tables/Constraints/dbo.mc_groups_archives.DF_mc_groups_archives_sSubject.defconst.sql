ALTER TABLE [dbo].[mc_groups_archives]
    ADD CONSTRAINT [DF_mc_groups_archives_sSubject] DEFAULT (NULL) FOR [sSubject];

