ALTER TABLE [dbo].[mc_groups_publicpages]
    ADD CONSTRAINT [DF_mc_groups_publicpages_iCreatedBy] DEFAULT ('0') FOR [iCreatedBy];

