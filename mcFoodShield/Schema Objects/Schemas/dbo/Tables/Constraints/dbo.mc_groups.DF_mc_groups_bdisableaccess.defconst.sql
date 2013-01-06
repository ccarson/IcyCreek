ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_bdisableaccess] DEFAULT ((0)) FOR [bdisableaccess];

