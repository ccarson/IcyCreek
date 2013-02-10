ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_openclose] DEFAULT ((0)) FOR [openclose];

